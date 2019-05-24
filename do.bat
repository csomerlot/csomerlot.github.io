call %ALLUSERSPROFILE%/Anaconda3/Scripts/activate.bat

del *.html

REM set style=bootstrap_readable
set style=bootstrap_blue
REM doconce format html "index.do.txt" --cite_doconce --html_style=%style% --pygments_html_style=default --html_admon=bootstrap_alert --html_output=index_%style% --keep_pygments_html_bg --html_code_style=inherit --html_pre_style=inherit

doconce format html "index.do.txt" --cite_doconce --html_style=%style% 
doconce format html "AlternativeEnergyProjects.do.txt" --cite_doconce --html_style=%style%
doconce format html "BoatProjects.do.txt" --cite_doconce --html_style=%style%
doconce format html "ComputerProjects.do.txt" --cite_doconce --html_style=%style%
doconce format html "HappyHippieLifestyleProjects.do.txt" --cite_doconce --html_style=%style%
doconce split_html  "HappyHippieLifestyleProjects.html"
doconce format html "BusinessIdeas.do.txt" --cite_doconce --html_style=%style%
doconce split_html  "BusinessIdeas.html"
doconce format html "RoboticsProjects.do.txt" --cite_doconce --html_style=%style%
doconce split_html  "RoboticsProjects.html"
doconce format html "ShootingProjects.do.txt" --cite_doconce --html_style=%style%
doconce format html "ThistleRidgeFarmProjects.do.txt" --cite_doconce --html_style=%style%
doconce split_html  "ThistleRidgeFarmProjects.html"
doconce format html "Apiary.do.txt" --cite_doconce --html_style=%style%
doconce split_html  "Apiary.html"

REM doconce format sphinx "everything.do.txt"
REM doconce split_rst everything
REM doconce sphinx_dir everything

