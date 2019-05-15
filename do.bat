set style=bootstrap_readable
doconce format html "index.do" --cite_doconce --html_style=%style% --pygments_html_style=default --html_admon=bootstrap_alert --html_output=index_%style% --keep_pygments_html_bg --html_code_style=inherit --html_pre_style=inherit

doconce format html "index.do" --cite_doconce --html_style=%style% 
doconce format html "Alternative Energy Projects.do" --cite_doconce --html_style=%style%
doconce format html "Boat Projects.do" --cite_doconce --html_style=%style%
doconce format html "Computer Projects.do" --cite_doconce --html_style=%style%
doconce format html "Happy Hippie Lifestyle Projects.do" --cite_doconce --html_style=%style%
doconce format html "Python Programming Projects.do" --cite_doconce --html_style=%style%
doconce format html "Robotics Projects.do" --cite_doconce --html_style=%style%
doconce split_html  "Robotics Projects.html"
doconce format html "Shooting Projects.do" --cite_doconce --html_style=%style%
doconce format html "Thistle Ridge Farm Projects.do" --cite_doconce --html_style=%style%
doconce split_html  "Thistle Ridge Farm Projects.html"
REM doconce format html "Wool Milling.do" --cite_doconce --html_style=%style%
doconce format html "Apiary.do" --cite_doconce --html_style=%style%
doconce split_html  "Apiary.html"

start index_%style%.html