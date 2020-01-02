import socket, sys, os, time
import subprocess as sub

with open(__file__.replace(".py", ".csv"), 'w', encoding='utf-8', newline='\n') as csvf:
    csvf.write("datetime,path,size\n")
lastmin = time.localtime()[4]

def log(message):
    print(message)

def dbInsert(dbconn, data):
    with open(__file__.replace(".py", ".csv"), 'a', encoding='utf-8', newline='\n') as csvf:
        for row in data:
            csvf.write("{},{},{}\n".format(time.strftime("%m/%d/%Y %H:%M", time.localtime()), row, data[row]))

if __name__ == '__main__':
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

            if lastmin != time.localtime()[4]:
                dbInsert(None, db)
                db = {}
                lastmin = time.localtime()[4]

        except ValueError:
            log("Bad row: {}".format(row.strip()))
