#!/bin/bash 

# Druga skripta svake sekunde ispisuje zabiljezene kolicine svake tablete. Pri dolasku pojedinog signala inkrementira odgovarajucu varijablu u kojoj cuva kolicinu te vrste tableta. Uz tri signala koji  ce modelirati nadolazece tablete, skripta mora imati i signal koji obustavlja njen rad (sigint). Pri obustavljanju rada ispisuje se ukupna kolicina svih ocitanih tableta.

# Ispis PID-a skripte
echo "PID ove skripte je $$."

# Inicijalizacija brojača za svaku vrstu tableta
count_kapsule=0
count_komprimirane=0
count_sumece=0

# Postavljanje signal handlera
trap 'count_kapsule=$((count_kapsule + 1))' USR1
trap 'count_komprimirane=$((count_komprimirane + 1))' USR2
trap 'count_sumece=$((count_sumece + 1))' TERM
trap 'echo "Ukupno: $((count_sumece + count_komprimirane + count_kapsule))"; exit 0' INT

while true; do
    # Ispis količine za svaku vrstu tablete
    echo "Kapsule: $count_kapsule, Komprimirane: $count_komprimirane, Sumece: $count_sumece"
    sleep 1
done
