import socket, sys, os, time
import subprocess as sub

def log(message):
    print(message)

def csvInit():
    with open(__file__.replace(".py", ".csv"), 'w', encoding='utf-8', newline='\n') as csvf:
        csvf.write("datetime,path,size\n")

    return csvf.name

def csvInsert(fname, data):
    with open(fname, 'a', encoding='utf-8', newline='\n') as csvf:
        for row in data:
            csvf.write("{},{},{}\n".format(time.strftime("%m/%d/%Y %H:%M", time.localtime()), row, data[row]))

def dbInit():
    ## https://enterprise-docs.anaconda.com/en/latest/data-science-workflows/data/mariadb.html
    import mysql.connector as mariadb
    import json

    ## take care to configure security correctly:
    #### https://stackoverflow.com/questions/1559955/host-xxx-xx-xxx-xxx-is-not-allowed-to-connect-to-this-mysql-server
    #### https://mariadb.com/kb/en/configuring-mariadb-for-remote-client-access/
    ## Now, read the credentials from secret
    credentials = None
    with open(__file__.replace(".py", ".jsn")) as f:
        credentials = json.load(f)

    # Ensure your credentials were setup
    if credentials:
        # Connect to the DB
        connection = mariadb.connect(
            user=credentials.get('user'),
            password=credentials.get('password'),
            database=credentials.get('database'),
            host=credentials.get('host')
        )
        cursor = connection.cursor()

        # Execute the query
        cursor.execute("CREATE TABLE IF NOT EXISTS activity (dt DATETIME, len INT UNSIGNED NOT NULL, path NVARCHAR(255) NOT NULL);")

        return connection

def dbInsert(dbconn, data):
    cursor = dbconn.cursor()
    insertStr = "INSERT INTO activity VALUES "

    for path in data:
        insertStr += "('{}',{},'{}'), ".format(time.strftime("%Y-%m-%d %H:%M", time.localtime()), data[path], path)
    insertStr = insertStr[:-2] + ';'

    cursor.execute(insertStr)
    dbconn.commit()

if __name__ == '__main__':
    ## simplest use is 'nohup python3 watcher.py &', but making it a systemctl service is better

    # datastore = csvInit()
    # saveData = csvInsert
    # or
    datastore = dbInit()
    saveData = dbInsert

    timeIndex = 4 ## index of the struct_time; 5 for sum by second, 4 for sum data by minute, 3 for sum by hour

    lastmin = time.localtime()[timeIndex]
    db = {}

    ## run tcpdump in buffer mode, link headers only
    p = sub.Popen(('sudo', 'tcpdump', '-q', '-i', 'wlan1', '-le', 'greater 55 and tcp'), stdout=sub.PIPE)
    for row in iter(p.stdout.readline, b''):

    ## or use a test file for debugging
    # with open('test.log', 'rb') as f: testlog = f.readlines()
    # for row in testlog:

        try:
            mainParts =  row.decode('utf-8').strip().split(',')
            nextParts = mainParts[2].split(':')
            path = nextParts[1]
            length = int(nextParts[0][7:])
            if path not in db: db[path] = 0
            db[path]+= length

            if lastmin != time.localtime()[timeIndex]:
                saveData(datastore, db)
                db = {}
                lastmin = time.localtime()[timeIndex]

        except ValueError:
            log("Bad row: {}".format(row.strip()))
