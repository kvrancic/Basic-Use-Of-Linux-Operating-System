#!/bin/bash

#imena_datoteka=$(find . -type f -exec egrep -l '^c[[:alpha:]]*[0-9]{2}\.[[:alpha:]]+' {} \;)
#echo "Datoteke ciji sadrzaj pocinje slovom c iza kojeg slijedi proizvoljan niz slova, dva broja, tocka i barem jedno slovo iza tocke su: $imena_datoteka"

imena_datoteka2=$(ls | egrep "^c[[:alpha:]]*[0-9]{2}\.[[:alpha:]]+")
echo "Datoteke koje pocinju slovom c iza kojeg slijedi proizvoljan niz slova, dva broja, tocka i barem jedno slovo iza tocke su: $imena_datoteka2"

# Ispisite sve datoteke koje ne sadrze mala slova od a do k (abecedno), a imaju barem jednu znamenku
bezAKsaZnam=$(ls | egrep "^[^a-k]*[0-9]+[^a-k]*$")
echo "Datoteke u trenutnom direktoriju koje ne sadrze mala slova od a do k (abecedno), a imaju barem jednu znamenku su: $bezAKsaZnam"




