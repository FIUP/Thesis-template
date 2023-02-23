# Thesis template
A simple Thesis template for the Bachelor Degree in Computer Science @Unipadova

# Troubleshooting
## The PDF won't compile
If you have any problem during the compilation of you thesis you may not have some necessary LaTeX packages. If you use TeX Live as you LaTeX distribution you can follow the next configuration steps to be up and running with your setup.

### Configuration for TeX Live
You can install the required packages manually using the TeX Live Manager, or using the CLI utility (tlmgr).

#### Windows
To automate the install process open a cmd window with admin rights and run:
```
tlmgr update --self
tlmgr update --all
tlmgr install filecontents pdfx xcolor xmpincl caption changepage csquotes emptypage epigraph nextpage eurosym layaureo listings microtype mparhack relsize quoting subfig booktabs glossaries glossaries-italian glossaries-english biblatex babel babel-italian cm-super latexmk
```

#### Unix shell (GNU/Linux, macOS)
```bash
sudo tlmgr update --self
sudo tlmgr update --all
sudo tlmgr install filecontents pdfx xcolor xmpincl caption changepage csquotes emptypage epigraph nextpage eurosym layaureo listings microtype mparhack relsize quoting subfig booktabs glossaries glossaries-italian glossaries-english biblatex babel babel-italian cm-super latexmk
```

## Glossary isn't showing up and/or bibliography is empty
Glossary and bibliography need a special (and not straightforward at all) treatment during the compilation process. In order to get the complete PDF of your thesis, with all the rings and bells of glossaries and bibliographies you need to compile your PDF using the compile scripts given with this template: `compile.bat` if you're using Windows or `compile.sh` if you're under macOS or a Linux distribution.

### Yeah ok, cool, but I don't want to always compile from the terminal
You can tell your LaTeX editor to automatically compile using the script.

#### VS Code + TeX Workshop extension
Create a `.vscode/` directory in the root of your thesis directory (on the same level of `readme.md`, for instance) and put a file `settings.json` inside it, with the following code (use `"compile.sh"` in macOS/Linux):
```json
{
    "latex-workshop.latex.external.build.command": "compile.bat",
}
```

If you want to pass some options to the command your `settings.json` can look like this:
```json
{
    "latex-workshop.latex.external.build.command": "compile.bat",
    "latex-workshop.latex.external.build.args": [
        "-bg"
    ]
}
```

In the example the options `-b` and `-g` are used to skip the bibliography and glossary compilation, which can save you some time if you don't need them.
