#!/bin/bash

DIR="./output"	# modificare per scegliere il nome della cartella di destinazione
NAME="tesi"		# modificiare per scegliere il nome del file di origine (.tex)

if [ ! -d $DIR ];
  then
    mkdir $DIR;
fi

echo --------------------
echo - Inizializzazione -
echo --------------------

pdflatex -output-directory=$DIR $NAME
biber $DIR/$NAME
makeindex -s ./$NAME.ist -t ./$NAME.glg -o ./$NAME.gls ./$NAME.glo
makeindex -s ./$NAME.ist -t ./$NAME.alg -o ./$NAME.acr ./$NAME.acn

# Due volte because Latex

pdflatex -output-directory=$DIR $NAME
biber $DIR/$NAME
makeindex -s ./$NAME.ist -t ./$NAME.glg -o ./$NAME.gls ./$NAME.glo
makeindex -s ./$NAME.ist -t ./$NAME.alg -o ./$NAME.acr ./$NAME.acn

echo -------------------------
echo - Generazione Documento -
echo -------------------------

pdflatex -output-directory=$DIR $NAME
pdflatex -output-directory=$DIR $NAME

echo ---------------------------------
echo - Pulisco e poi apro il file... -
echo ---------------------------------

rm $DIR/*.acn $DIR/*.aux $DIR/*.bbl $DIR/*.bcf $DIR/*.glo
rm $DIR/*.ist $DIR/*.lof $DIR/*.lot $DIR/*.run.xml $DIR/*.toc
# Per mantenere i log commentare la linea seguente
rm $DIR/*.blg  $DIR/*.log

open $DIR/$NAME.pdf

echo ---------------------------- END -----------------------------
