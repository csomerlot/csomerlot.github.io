import socket, sys, os, csv
import subprocess as sub

def log(message):
    print(message)

def dbInsert(dbconn, row):
    dbconn.writerow(row)

def revLookup(ipaddr):
    return socket.gethostbyaddr(ipaddr)[0]

if __name__ == '__main__':
    ## run tcpdump in buffer mode, link headers only
    csvf = open(__file__.replace(".py", ".csv"), 'w', encoding='utf-8')
    csvwriter = csv.DictWriter(csvf, ['time','fromMAC','toMAC','type','length','fromADD','toADD'])
    csvwriter.writeheader()
    
    p = sub.Popen(('sudo', 'tcpdump', '-l', '-e', '-c', '50'), stdout=sub.PIPE)
    for row in iter(p.stdout.readline, b''):
        try:
            mainParts =  row.strip().split(',')
            timeStamp = mainParts[0].split(' ')[0]
            fromMAC, toMAC = mainParts[0].replace(timeStamp, "").split('>')
            type = mainParts[1]
            length = mainParts[2].split(':')[0]
            fromADD, toADD = mainParts[2].split(':')[1].split('>')
            dbInsert(csvwriter, {
                'time':timeStamp,
                'fromMAC': fromMAC.strip(),
                'toMAC':toMAC.strip(),
                'type':type.strip(),
                'length':int(length.replace('length','').strip()),
                'fromADD':fromADD.strip(),
                'toADD':toADD.strip()
                })
        except:
            log("Bad row: {}".format(row.strip()))
