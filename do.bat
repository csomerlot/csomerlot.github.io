set style=bootstrap_blue
set doconce=C:\Users\csomerlot\Miniconda3\Scripts\doconce
python %doconce% format html "AlternativeEnergyProjects.do.txt" --cite_doconce --html_style=%style%
python %doconce% split_html  "AlternativeEnergyProjects.html"
python %doconce% format html "Apiary.do.txt" --cite_doconce --html_style=%style%
python %doconce% split_html  "Apiary.html"
python %doconce% format html "BoatProjects.do.txt" --cite_doconce --html_style=%style%
python %doconce% split_html  "BoatProjects.html"
python %doconce% format html "BusinessIdeas.do.txt" --cite_doconce --html_style=%style%
python %doconce% split_html  "BusinessIdeas.html"
python %doconce% format html "ComputerProjects.do.txt" --cite_doconce --html_style=%style%
python %doconce% split_html  "ComputerProjects.html"
python %doconce% format html "EmergencyPlans.do.txt" --cite_doconce --html_style=%style%
python %doconce% split_html  "EmergencyPlans.html"
python %doconce% format html "HappyHippieLifestyleProjects.do.txt" --cite_doconce --html_style=%style%
python %doconce% split_html  "HappyHippieLifestyleProjects.html"
python %doconce% format html "index.do.txt" --cite_doconce --html_style=%style%
python %doconce% split_html  "index.html"
python %doconce% format html "IoTProjects.do.txt" --cite_doconce --html_style=%style%
python %doconce% split_html  "IoTProjects.html"
python %doconce% format html "NorthWoodsCottage.do.txt" --cite_doconce --html_style=%style%
python %doconce% split_html  "NorthWoodsCottage.html"
python %doconce% format html "RoboticsProjects.do.txt" --cite_doconce --html_style=%style%
python %doconce% split_html  "RoboticsProjects.html"
python %doconce% format html "ShootingProjects.do.txt" --cite_doconce --html_style=%style%
python %doconce% split_html  "ShootingProjects.html"
python %doconce% format html "TemporaryRetirement.do.txt" --cite_doconce --html_style=%style%
python %doconce% split_html  "TemporaryRetirement.html"
python %doconce% format html "ThistleRidgeFarmProjects.do.txt" --cite_doconce --html_style=%style%
python %doconce% split_html  "ThistleRidgeFarmProjects.html"
python %doconce% format html "WoodWorking.do.txt" --cite_doconce --html_style=%style%
python %doconce% split_html  "WoodWorking.html"
python %doconce% format html "everything.do.txt" --cite_doconce --html_style=%style%

python publish.py

python %doconce% lightclean
