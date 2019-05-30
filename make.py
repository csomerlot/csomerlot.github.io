import os

with open("do.bat", 'w') as makeFile:
    makeFile.write('call %ALLUSERSPROFILE%/Anaconda3/Scripts/activate.bat\n\nset style=bootstrap_blue\n')
    for f in os.listdir(os.getcwd()):
        if f.endswith(".do.txt"):
            makeFile.write('doconce format html "{}" --cite_doconce --html_style=%style%\ndoconce split_html  "{}"\n'.format(f, f.replace(".do.txt",".html")))
    makeFile.write('\ndoconce lightclean\n')