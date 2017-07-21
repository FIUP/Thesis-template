@echo off

if [%MAIN%]==[] set MAIN=tesi
if [%BUILD_DIR%]==[] set BUILD_DIR=.\

set BUILD_MAIN=%BUILD_DIR%%MAIN%

@echo --------------------------------------------------------------
@echo -                   Aggiornamento Glossario                  -
@echo --------------------------------------------------------------

makeindex -s %BUILD_MAIN%.ist -t %BUILD_MAIN%.glg -o %BUILD_MAIN%.gls %BUILD_MAIN%.glo

@echo --------------------------------------------------------------
@echo -                   Aggiornamento Acronimi                   -
@echo --------------------------------------------------------------

makeindex -s %BUILD_MAIN%.ist -t %BUILD_MAIN%.alg -o %BUILD_MAIN%.acr %BUILD_MAIN%.acn

::set /p keys=Done...