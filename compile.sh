#!/usr/bin/env bash

### Params ###
# LaTeX build files directory
BUILD_DIR="build"

# Thesis root .tex file name
THESIS="tesi"

loadParams() {
  GLOSSARY=true
  BIBLIOGRAPHY=true
  CLEAN=true
  LOG=false
  FULL_RUN=false

  # Check that last parameter is not an option
  if [[ $# -gt 0 && ${!#} =~ ^[^-].*$ ]]; then
    PDF_NAME=${!#}
  else
    PDF_NAME=$THESIS
  fi

  while getopts :bcd:fglh flag
  do
    case "${flag}" in
      b) BIBLIOGRAPHY=false;;
      c) CLEAN=false;;
      d) BUILD_DIR=$OPTARG;;
      f) FULL_RUN=true;;
      g) GLOSSARY=false;;
      l) LOG=true;;
      h) printHelp; exit 0;;
      *) printHelp; exit 1;;
    esac
  done
}

printHelp() {
  echo "LaTeX FIUP thesis template compile script"
  echo "Usage:    compile.sh [-bcfghl] [-d build_directory] [pdf_name]"
  echo "Shell options:"
  echo "    -b    skip bibliography compile"
  echo "    -c    skip build directory clean"
  echo "    -d    directory to put temporary files in"
  echo "    -f    force the full compile process."
  echo "          Comes handy if you have problems with glossary or bibligraphy"
  echo "    -g    skip glossary compile"
  echo "    -l    keep logs in build/ directory"
  echo "    -h    print this message"
}

compile() {
  pdflatex -output-directory=$BUILD_DIR -interaction=nonstopmode $THESIS 
}

makeGlossary() {
  makeindex -s $BUILD_DIR/$THESIS.ist -t $BUILD_DIR/$THESIS.alg -o $BUILD_DIR/$THESIS.{acr,acn}
  makeglossaries -d $BUILD_DIR $THESIS
  makeindex -s $BUILD_DIR/$THESIS.ist -t $BUILD_DIR/$THESIS.glg -o $BUILD_DIR/$THESIS.{gls,glo}
}

makeBibliography() {
  biber --input_directory $BUILD_DIR --output_directory $BUILD_DIR $THESIS
}

compileWithBibGloss() {
  if [[ $GLOSSARY == true ]]; then
    makeGlossary
  fi

  if [[ $BIBLIOGRAPHY == true ]]; then
    makeBibliography
  fi

  compile

  # The first time the glossary needs to be compiled three times
  if [[ $FULL_RUN == true ]]; then
    makeGlossary
    compile

    makeGlossary
    compile
  fi
}

clean() {
  rm $BUILD_DIR/*.{acn,aux,bbl,bcf,glo,ist,lof,lot,run.xml,toc} &> /dev/null

  if [[ $LOG == false ]]; then
    rm $BUILD_DIR/*.{blg,log} &> /dev/null
  fi
}

main() {
  # Move to script directory
  cd $PWD/$( dirname -- "$0" )
  
  loadParams "$@"

  if [[ ! -d $BUILD_DIR ]]; then
    FULL_RUN=true
    GLOSSARY=true
    BIBLIOGRAPHY=true

    mkdir $BUILD_DIR;
  fi

  compile

  if [[ $GLOSSARY == true ]] || [[ $BIBLIOGRAPHY == true ]]; then
    compileWithBibGloss
  fi
 
  if [[ $CLEAN == true ]]; then
    clean
  fi

  # Move generated pdf to the same level of the source file
  mv $BUILD_DIR/$THESIS.pdf ./"$PDF_NAME.pdf"
}

main "$@"
