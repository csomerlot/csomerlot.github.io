import os, glob

for f in glob.glob("*.html")+glob.glob(".*.html"):
    with open(f) as of: contents = of.read()
    with open(os.path.join('docs',f), 'w') as of:
        of.write(contents.replace('img src="', 'img src="https://raw.githubusercontent.com/csomerlot/csomerlot.github.io/master/'))
    os.remove(f)
    print("Moved {}".format(f))