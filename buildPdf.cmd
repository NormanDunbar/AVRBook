@echo off
rem
rem Builds a new version of the AVR book with contents and indexes etc
rem all correctly styled. Assumes the utilities on the path include:
rem
rem    pdflatex
rem    makeindex
rem
rem And, that your cmd session is correctly open in the top level directory.
rem
rem Norman Dunbar.
rem Created 30th June 2017.
rem Last Modified: 30th June 2017.
rem

pdflatex -aux-directory=AuxFiles AVRBook.tex
pdflatex -aux-directory=AuxFiles AVRBook.tex
makeindex -s StyleInd.ist AuxFiles/AVRBook.idx
pdflatex -aux-directory=AuxFiles AVRBook.tex
pdflatex -aux-directory=AuxFiles AVRBook.tex

