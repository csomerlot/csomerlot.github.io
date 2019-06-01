import os

with open("do.bat", 'w') as makeFile:
    makeFile.write('call %ALLUSERSPROFILE%/Anaconda3/Scripts/activate.bat\n\nset style=bootstrap_blue\n')
    for f in os.listdir(os.getcwd()):
        if f.endswith(".do.txt"):
            makeFile.write('doconce format html "{}" --cite_doconce --html_style=%style%\ndoconce split_html  "{}"\n'.format(f, f.replace(".do.txt",".html")))
    makeFile.write('\ndoconce lightclean\n')

with open("index.do.txt", 'w') as indexFile:
    indexFile.write('''
# #include "intro.do.txt"

======= Chapters =======
o "Thistle Ridge Farm Projects": "ThistleRidgeFarmProjects.html"
o "Happy Hippie Lifestyle Projects": "HappyHippieLifestyleProjects.html"
o "Alternative Energy Projects": "AlternativeEnergyProjects.html"
o "Boat Projects": "BoatProjects.html"
o "Computer Projects": "ComputerProjects.html"
o "Robotics Projects": "RoboticsProjects.html"
o "Business Ideas": "BusinessIdeas.html"
o "Shooting Projects": "ShootingProjects.html"

======= Index =======
''')
    for f in os.listdir(os.getcwd()):
        if f.endswith(".do.txt"):
            indexFile.write('o "{}": "{}.html"\n'.format(f.replace(".do.txt",""), f.replace(".do.txt","")))