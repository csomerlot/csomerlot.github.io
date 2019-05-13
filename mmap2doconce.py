import csv

fname = "Map1.csv"

with open(fname) as f:
    rows = csv.reader(f)
    next(rows)
    for row in rows:
        c = 0
        line = ""
        try:
            while not row[c]:
                line +="    " 
                c+=1
            line += "o " + row[c]
        except IndexError:
            pass
        print (line)