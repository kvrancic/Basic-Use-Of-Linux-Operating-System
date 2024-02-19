#!/bin/bash

echo "Analiza datoteke /usr/include/stdio.h"

# Prebrojite redove koji su uvuceni u /usr/include/stdio.h
# cini mi se da se meni ekvivalentan file nalazi na /Library/Developer/CommandLineTools/usr/include/c++/v1/stdio.h
uvuceni_redovi=$(egrep -c "^[[:blank:]].*" /Library/Developer/CommandLineTools/usr/include/c++/v1/stdio.h) 
echo "Broj uvucenih redova je: $uvuceni_redovi"

# Prebrojite koliko u datoteci postoji funkcija koje primaju argument naziva __arg
# ideja -> prebrojati koliko se puta pojavljuje __arg u redovima koji nisu uvuceni jer to budu definicije funkcija
broj_funkcija=$(egrep -c ".*__arg[^[:alnum:]_]+.*" /usr/include/stdio.h)
echo "Broj funkcija koje primaju argument naziva __arg je: $broj_funkcija"


