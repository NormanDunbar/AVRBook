#! /bin/bash

#
# Builds a new version of the AVR book with contents and indexes etc
# all correctly styled. Assumes the utilities on the path include:
#
#    pdflatex
#    makeindex
#
# And, that your shell session is correctly open in the top level directory.
#
# Norman Dunbar.
# Create 30th June 2017
# Last Modified: 30th June 2017.
#

pdflatex -aux-directory=AuxFiles AVRBook.tex
pdflatex -aux-directory=AuxFiles AVRBook.tex
makeindex -s StyleInd.ist AuxFiles\AVRBook.idx
pdflatex -aux-directory=AuxFiles AVRBook.tex
pdflatex -aux-directory=AuxFiles AVRBook.tex

