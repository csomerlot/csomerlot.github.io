## Managing this site 
This folder contains a bunch of notebooks authored in markdown text files, compiled to HTML via Quarto, versioned via git, and served from GitHub.io for possible sharing and co-authoring. The notebooks are published automatically, individually and as a whole, in a variety of formats, with media embedded.

Previous efforts for this documentation included doconce, Google Keep and docs, mind maps, evernote, and onenote. None of these formats support publishing as a web site, slidedeck, and pdf, nor have the versioning or sharing capability. Nor low-cost wen hosting and DNS integration.

### Setup:
    - install VS Code, Quarto, and github Desktop
### Editing tools:
    - Edit qmd quarto markdown files in VS code or directly in github
    - Use GIMP for making the background of images transparent
### To publish:
    - run quarto render (possibly as pre-commit git hook)
    - commit and push new HTML
### Organization:
    - Chapters and major sub-chapters are in their own file
    - HTML pages made for each Quarto markdown (.qmd) file
    - PDF and slidedeck generated from complete docs
    - code and image and other supporting files in folders
    - git submodules for code libraries if necessary
