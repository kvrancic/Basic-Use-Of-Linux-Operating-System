#!/bin/bash

#Datotekama koje imaju naziv oblika PNG-DDMMYYYY2 
#(dan, mjesec, godina) promijenite naziv u DD_MM_YYYY.png
rename "s/PNG-([0-9]{2})([0-9]{2})([0-9]{4})/\1_\2_\3.png/" PNG-*