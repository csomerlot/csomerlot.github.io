import socket, sys, os, csv
import subprocess as sub

def log(message):
    print(message)

def dbInsert(dbconn, row):
    dbconn.writerow(row)

def revLookup(ipaddr):
    ## not really needed since tcpdump already looks this up if it can
    try:
        return socket.gethostbyaddr(ipaddr)[0]
    except:
        return ""

def lookupDomain(name):
    ## see if its in a list of locally-known domains for specific services
    return name

def lookupMAC(MAC):
    ## first try locally-known device list, otherwise https://code.wireshark.org/review/gitweb?p=wireshark.git;a=blob_plain;f=manuf
    return MAC

if __name__ == '__main__':
    csvf = open(__file__.replace(".py", ".csv"), 'w', encoding='utf-8', newline='\n')
    csvwriter = csv.DictWriter(csvf, ['time','type','length', 'fromMAC', 'fromADD','fromPort','fromDomain','toMAC','toADD', 'toPort', 'toDomain'])
    csvwriter.writeheader()

    ## run tcpdump in buffer mode, link headers only
    # p = sub.Popen(('sudo', 'tcpdump', '-q', '-i', 'wlan1', '-le', 'greater 55 and tcp', '-c', '50'), stdout=sub.PIPE)
    # for row in iter(p.stdout.readline, b''):

    ## or use a test file for debugging
    f = open('test.log', 'rb')
    for row in f:

        try:
            mainParts =  row.decode('utf-8').strip().split(',')
            timeStamp = mainParts[0].split(' ')[0]
            fromMAC, toMAC = mainParts[0].replace(timeStamp, "").replace(" (oui Unknown)", "").split('>')
            typ = mainParts[1]
            length = mainParts[2].split(':')[0]
            fromADD, toADD = mainParts[2].split(':')[1].split('>')
            fromPort = fromADD.strip().split('.')[-1]
            toPort = toADD.strip().split('.')[-1]
            fromADD = fromADD.replace('.'+fromPort+' ','').strip()
            toADD = toADD.replace('.'+toPort,'').strip()
            if fromADD.replace('.','').isnumeric():
                fromDomain = ''
            else:
                fromDomain = ".".join(fromADD.split('.')[-2:])
            if toADD.replace('.','').isnumeric():
                toDomain = ''
            else:
                toDomain = ".".join(toADD.split('.')[-2:])
            dbInsert(csvwriter, {
                'time':timeStamp,
                'fromMAC': fromMAC.strip(),
                'toMAC':toMAC.strip(),
                'type':typ.strip(),
                'length':int(length.replace('length','').strip()),
                'fromADD':fromADD.strip(),
                'toADD':toADD.strip(),
                'toPort':toPort,
                'fromPort':fromPort,
                'fromDomain':fromDomain,
                'toDomain':toDomain
                })
        except:
            log("Bad row: {}".format(row.strip()))

    f.close()
    csvf.close()
