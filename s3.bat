call %ALLUSERSPROFILE%/Anaconda3/Scripts/activate.bat
aws s3 sync ./ s3://projects.somerlot.net --exclude "*" --include "*.html" --include "*.png" --include "*.jpg" --include "*.svg" --include "*.pdf" --include "*.xslx" --acl public-read --delete
