# Thesis template
A simple Thesis template for the Bachelor Degree in Computer Science @Unipadova

# Installation
To use this template you will need a full LaTeX configuration installed.
If you don't have an already installed distribution you can read the following instructions and you'll be ready to go!

<details>
<summary>Read more</summary>

## TeX Live installation
You can use whatever you want to compile your thesis, but one of the most straightforward ways is using TeX Live.
It should be available on every platform you use and comes with a lot of packages and tools.

There are downloads for [Windows](https://mirror.ctan.org/systems/texlive/tlnet/install-tl-windows.exe) and [macOS](https://mirror.ctan.org/systems/mac/mactex/MacTeX.pkg), or instead you can install it using your favorite package manager:
```bash
sudo apt install texlive-full
```
```bash
sudo pacman -S texlive-most
```
```bash
sudo dnf install texlive-scheme-full
```
```bash
brew install basictex
```
```powershell
choco install texlive
```

## Configuration for TeX Live
This template is pretty big and complex, therefore it requires a lot of specific packages that may not be shipped with your installation of TeX Live by default.

Here's the complete list of packages that you'll need, in order to be able to successfully compile your thesis:
- pdfx
- xcolor
- xmpincl
- caption
- changepage
- csquotes
- emptypage
- epigraph
- nextpage
- eurosym
- layaureo
- listings
- microtype
- mparhack
- relsize
- quoting
- subfig
- booktabs
- glossaries
- glossaries-italian
- glossaries-english
- biber
- biblatex
- babel
- babel-italian
- cm-super
- greek-fontenc
- latexmk
- fancyhdr

You can install them manually using the TeX Live Manager (good luck!), or using the CLI utility counterpart `tlmgr`

Just copy and paste the following command in your terminal.
```bash
sudo tlmgr update --self
sudo tlmgr update --all
sudo tlmgr install pdfx xcolor xmpincl caption changepage csquotes emptypage epigraph nextpage eurosym layaureo listings microtype mparhack relsize quoting subfig booktabs glossaries glossaries-italian glossaries-english biber biblatex babel babel-italian cm-super greek-fontenc latexmk fancyhdr
```

As you can see `tlmgr` asks for admin rights, so you'll need to use `sudo` on Linux/macOS, while on Windows you have to [open a command prompt instance as admin](https://www.makeuseof.com/windows-run-command-prompt-admin/) and omit the `sudo` at the beginning of the lines.

</details>

---

# Compilation
You tried to compile this template and the glossary isn't showing up or the bibliography is empty? Don't panic, that's pretty normal.
It happens because glossary and bibliography need a special treatment during the compilation process.

Down here you find all the details to successfully compile the PDF

<details>
<summary>Read more</summary>

## Latexmk
In order to get the complete PDF of your thesis, with all the rings and bells of glossaries and bibliographies you need to compile using latexmk with the following command:
```bash
latexmk thesis.tex
```

Latexmk is a powerful tool and allows you to do some other interesting stuff too, see `latexmk -help`.
Most notably, if something feels wrong in the produced PDF you may want to force a full recompilation, using the `-g` (or the more aggressive `-gg`) option.

## Yeah ok, cool, but I don't want to always compile from the terminal
You can tell your LaTeX editor to compile using latexmk by default.

### VS Code + TeX Workshop extension
This template comes with a [`settings.json`](.vscode/settings.json) file, that sets latexmk as the default command to compile the PDF.
Everything should work fine out of the box.

### TeXStudio
Read the first 3 points of [this guide](https://latex.ti.bfh.ch/doc_gettingStarted/configuration/texstudio.html).

</details>

---

# Template structure
So, you finally managed to get your setup working and you're ready to begin to write actual stuff, but you just realized there are so many files in here and you don't even know where to start from...

First of all, these are the only files you should care about:
```
Thesis
├── appendix/
│   ├── appendice-a.tex
│   ├── bibliography.bib
│   ├── bibliography.tex
│   └── glossary-entries.tex
├── chapters/
│   ├── concept.tex
│   └── ...
├── config/
│   ├── packages.tex
│   ├── thesis-config.tex
│   └── variables.tex
├── images/
│   ├── unipd-logo.png
│   └── ...
├── preface/
│   ├── acknowledgements.tex
│   ├── copyright.tex
│   ├── dedication.tex
│   ├── summary.tex
│   ├── table-of-contents.tex
│   └── title-page.tex
├── structure.tex
├── printable-thesis.tex
└── thesis.tex
```

Yeah, well, not actually all of them. Let's break down their purpose down here

<details>
<summary>Read more</summary>

- `config/`
    - `variables.tex`: the first file you want to look into.
    It defines all the variables that will be used to automatically fill some contents of the document, such as the title, your name, your professor etc.
    It also fills the final PDF file metadata fields.
    - `thesis-config.tex`: some custom commands definitions and package-specific configurations.
    If you feel adventurous enough you can tune them to your preferences, but the provided ones should be ok
    - `packages.tex`: should be pretty much self-explanatory.
    Just the declaration of all the packages used in the project.
    Nothing relevant to see here
- `preface/`: all those pages you find before the actual chapters are gathered here:
    - `summary.tex`: in here you briefly explain what the thesis is about.
    You shouldn't spend much effort on this, just look at what's already in there and adapt it to your experience
    - `acknowledgements.tex`: should be clear by itself. Just remember to thank your professor first
    - `dedication.tex`: contains a small dedication with famous quote
    - `title-page.tex`: declares the structure of the front page.
    Everything is automatic and the various names, such as your name, you thesis title, your professor etc get filled from those variables you set in `config/variables.tex`.
    If your thesis has a very long title you may need to slightly adjust some spacing, in order to keep a decent layout
    - `table-of-contents.tex`: generates the table of contents. Nothing to see here
    - `copyright.tex`: it's nothing special, just that blank page with copyright
- `chapters/`: the real stuff is placed here.
This is the directory you will spend most of your time in, writing the main content.
You will already find some example chapters in there, which are meant to show you how to use the template and to give an example of the structure of a thesis. \
Use file names that reflect the content of the chapter, avoid calling them `chapter-03.tex`.
When creating, deleting or editing chapters remember that you have to put them in `structure.tex` too
- `structure.tex`: this doesn't contain any actual content at all.
It just sets down the structure of the document, importing other files in the right order.
You may occasionally need to put some new chapters you will write, but apart from that there's not much to do here
- `thesis.tex`: the root file of your thesis. As you can read above it is the only file to compile, in order to get the final PDF. Nothing more to say
- `printable-thesis.tex`: yet another root file.
When compiled, this one produces a version that is more fit to be printed as an elegant sweet physical copy, than to be viewed on your favorite PDF reader.
It provides asymmetrical margins, chapters openings on the right and no links highlighting
- `images/`: where the template will look for images, when including one
- `appendix/`: contains the last chapters, such as custom appendix chapters, bibliography and glossary
    - `bibliography.bib`: where you put actual bibliography content
    - `glossary-entries.tex:` where you put your glossary definitions, following the syntax of the example terms
    - `bibliography.tex`: the automatic structure of bibliography. No need to change anything here

</details>

---

Remember not to unconditionally stick with this structure, as it's just an example.
If you feel you don't need this chapter or that section, or you prefer a different order and organization of the content do as you want.

Before really starting to write actual content you should take some time to think about the structure of your chapters, filling them with the (empty) sections you will then develop, as it should help later on, avoiding to constantly rewrite and reorder stuff.
