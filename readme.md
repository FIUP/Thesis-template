# Thesis template
A simple Thesis template for the Bachelor Degree in Computer Science @Unipadova

# Installation
To use this template you will need a full LaTeX configuration installed. If you don't have an already installed distribution you can read the following instructions and you'll be ready to go!

## TeX Live installation
You can use whatever you want to compile your thesis, but one of the most straightforward ways is using TeX Live. It should be available on every platform you use and comes with a lot of packages and tools.

There are downloads for [Windows](https://mirror.ctan.org/systems/texlive/tlnet/install-tl-windows.exe) and [macOS](https://mirror.ctan.org/systems/mac/mactex/MacTeX.pkg). On Linux (but also macOS) you're probably going to install it through your package manager:
```bash
sudo apt install texlive-full
```
```bash
sudo pacman -S texlive-most
```
```bash
brew install texlive
```

## Configuration for TeX Live
This template is pretty big and complex, thus it requires a lot of specific packages, that may not be shipped with your installation of TeX Live. You can install them manually using the TeX Live Manager, or using the CLI utility counterpart tlmgr.

### Windows
To automate the install process open a cmd window with admin rights and run:
```
tlmgr update --self
tlmgr update --all
tlmgr install filecontents pdfx xcolor xmpincl caption changepage csquotes emptypage epigraph nextpage eurosym layaureo listings microtype mparhack relsize quoting subfig booktabs glossaries glossaries-italian glossaries-english biber biblatex babel babel-italian cm-super latexmk
```

### Unix shell (GNU/Linux, macOS)
```bash
sudo tlmgr update --self
sudo tlmgr update --all
sudo tlmgr install filecontents pdfx xcolor xmpincl caption changepage csquotes emptypage epigraph nextpage eurosym layaureo listings microtype mparhack relsize quoting subfig booktabs glossaries glossaries-italian glossaries-english biber biblatex babel babel-italian cm-super latexmk
```

# FAQ
## Glossary isn't showing up and/or bibliography is empty
Glossary and bibliography need a special treatment during the compilation process. In order to get the complete PDF of your thesis, with all the rings and bells of glossaries and bibliographies you may need to compile your PDF using latexmk with the following command:
```bash
latexmk tesi.tex
```

Latexmk is a powerful tool and allows you to do some other interesting stuff too. Check it out with
```bash
latexmk -help
```

Most notably, if something feels wrong in the produced PDF you may want to force a full recompilation, using the `-g` (or the more aggressive `-gg`) option.

## Yeah ok, cool, but I don't want to always compile from the terminal
You can tell your LaTeX editor to compile using latexmk by default.

### VS Code + TeX Workshop extension
This template comes with a [`settings.json`](.vscode/settings.json) file, that sets latexmk as the default command to compile the PDF. Everything should work fine out of the box.

### TeXStudio
Read the first 3 points of this [guide](https://latex.ti.bfh.ch/doc_gettingStarted/configuration/texstudio.html).
