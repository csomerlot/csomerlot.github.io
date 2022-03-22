## Managing this site 
This folder contains a bunch of notebooks authored in doconce text files, versioned via git, and stored in dropbox for possible sharing and co-authoring. The notebooks are published automatically, individually and as a whole, in a variety of formats, with media embedded.

Previous efforts for this documentation included Google Keep and docs, mind maps, evernote, and onenote. None of these formats support publishing as a web site, slidedeck, and pdf, nor have the versioning or sharingcapability. Nor low-cost and DNS integration.

### Setup:
    - install Anaconda, atom or VS Code, and a git client
    - make a bat file for preprocess in Scripts: @echo OFF; python C:\Users\Administrator\Anaconda3\Scripts\preprocess %*
    - install conda libraries
      - conda install doconce
### Editing tools:
    - directly in github
    - portable GIMP for making the background of images transparent
### Git hooks:
    - run doconce makefile
### Organization:
    - Chapters and major sub-chapters are in their own doconce file with doconce include files for whole assembly
    - HTML pages made for each doconce file
    - PDF and slidedeck generated from complete lib based on global (python) makefile
    - style set as variable in doconce
    - code and image and other supporting files in folders
    - git submodules for code libraries
