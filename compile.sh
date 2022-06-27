#!/bin/sh

### Params ###
# LaTeX build files directory
BUILD="build"

# Thesis root .tex file name
THESIS="tesi"

loadParams() {
  glossary=true
  bibliography=true
  clean=true
  log=false

  while getopts :bcd:glh flag
  do
    case "${flag}" in
      b) bibliography=false;;
      c) clean=false;;
      d) BUILD=$OPTARG;;
      g) glossary=false;;
      l) log=true;;
      h) printHelp; exit 0;;
      *) printHelp; exit 1;;
    esac
  done
}

printHelp() {
  echo "LaTeX FIUP thesis compile script"
  echo "Usage:    compile.sh [-bdghl]"
  echo "Shell options:"
  echo "    -b    skip bibliography compile"
  echo "    -c    skip build directory clean"
  echo "    -d    directory to put temporary files in"
  echo "    -g    skip glossary compile"
  echo "    -l    keep logs in build/ directory"
  echo "    -h    print this message"
}

compile() {
  pdflatex -output-directory=$BUILD -interaction=nonstopmode $THESIS 
}

makeGlossary() {
  makeindex -s $THESIS.ist -t $THESIS.glg -o $THESIS.{gls,glo}
  makeglossaries -d $BUILD $THESIS
  makeindex -s $THESIS.ist -t $THESIS.alg -o $THESIS.{acr,acn}
}

makeBibliography() {
  biber --input_directory $BUILD --output_directory $BUILD $THESIS
}

compileWithBibGloss() {
  if [ $glossary = true ]; then
    makeGlossary
  fi

  if [ $bibliography = true ]; then
    makeBibliography
  fi

  compile

  if [ $glossary = true ]; then
    compile
  fi
}

clean() {
  rm $BUILD/*.{acn,aux,bbl,bcf,glo,ist,lof,lot,run.xml,toc} &> /dev/null

  if [ $log = false ]; then
    rm $BUILD/*.{blg,log} &> /dev/null
  fi
}

main() {
  # Move to script directory
  cd $PWD/$( dirname -- "$0" )
  
  loadParams $*

  if [ ! -d $BUILD ]; then
    mkdir $BUILD;
  fi

  compile

  if [ $glossary = true ] || [ $bibliography = true ]; then
    compileWithBibGloss
  fi
 
  if [ $clean = true ]; then
    clean
  fi

  # Move generated pdf to the same level of the source file
  mv $BUILD/$THESIS.pdf ./
}

main $*
