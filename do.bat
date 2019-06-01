call %ALLUSERSPROFILE%/Anaconda3/Scripts/activate.bat

set style=bootstrap_blue
doconce format html "AlternativeEnergyProjects.do.txt" --cite_doconce --html_style=%style%
doconce split_html  "AlternativeEnergyProjects.html"
doconce format html "Apiary.do.txt" --cite_doconce --html_style=%style%
doconce split_html  "Apiary.html"
doconce format html "BoatProjects.do.txt" --cite_doconce --html_style=%style%
doconce split_html  "BoatProjects.html"
doconce format html "BusinessIdeas.do.txt" --cite_doconce --html_style=%style%
doconce split_html  "BusinessIdeas.html"
doconce format html "ComputerProjects.do.txt" --cite_doconce --html_style=%style%
doconce split_html  "ComputerProjects.html"
doconce format html "EmergencyPlans.do.txt" --cite_doconce --html_style=%style%
doconce split_html  "EmergencyPlans.html"
doconce format html "everything.do.txt" --cite_doconce --html_style=%style%
doconce split_html  "everything.html"
doconce format html "HappyHippieLifestyleProjects.do.txt" --cite_doconce --html_style=%style%
doconce split_html  "HappyHippieLifestyleProjects.html"
doconce format html "index.do.txt" --cite_doconce --html_style=%style%
doconce split_html  "index.html"
doconce format html "intro.do.txt" --cite_doconce --html_style=%style%
doconce split_html  "intro.html"
doconce format html "NorthWoodsCottage.do.txt" --cite_doconce --html_style=%style%
doconce split_html  "NorthWoodsCottage.html"
doconce format html "RoboticsProjects.do.txt" --cite_doconce --html_style=%style%
doconce split_html  "RoboticsProjects.html"
doconce format html "ShootingProjects.do.txt" --cite_doconce --html_style=%style%
doconce split_html  "ShootingProjects.html"
doconce format html "TemporaryRetirement.do.txt" --cite_doconce --html_style=%style%
doconce split_html  "TemporaryRetirement.html"
doconce format html "ThistleRidgeFarmProjects.do.txt" --cite_doconce --html_style=%style%
doconce split_html  "ThistleRidgeFarmProjects.html"
doconce format html "WoodWorking.do.txt" --cite_doconce --html_style=%style%
doconce split_html  "WoodWorking.html"

doconce lightclean
