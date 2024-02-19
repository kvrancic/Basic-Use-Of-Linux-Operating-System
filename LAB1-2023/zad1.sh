#!/bin/bash 

#Stvorite direktorij LAB1 i premjestite se u njega.
mkdir LAB1 && cd LAB1

# Stvorite novi direktorij source i u njemu prazan file empty.
mkdir source && touch source/empty

# U direktorij source kopirajte sadrzaj direktorija /boot i direktorija /etc. Napomena: Koristite jednu naredbu.
cp -R /boot/. /etc/* source/

# Ispisite zauzece direktorija source koristeci SI prefikse (potencije broja 10) mjernih jedinica.
du --si source 

# U direktoriju LAB1 stvorite simbolicku poveznicu target na direktorij source.
ln -s source/ target

# Premjestite se u direktorij target bez dereferenciranja poveznice i ispiˇsite adresu trenutnog direktorija. Pokaˇzite da ispis adrese trenutnog direktorija daje LAB1/target.
cd target 
pwd  

# Vratite se u direktorij LAB1 i premjestite se u direktorij target koriste ́ci dereferenciranje poveznice. Pokaˇzite da ispis adrese trenutnog direktorija daje LAB1/source.
cd ..
cd -P target 
pwd 

# Koristeci poveznicu target odredite velicinu direktorija source.
du -hL ../target | tail -n 1 # da ne ispisuje poddirektorije 

# Koristéci naredbu touch stvorite praznu datoteku source/novi i postavite joj vrijeme izmjene (mtime) tako da bude isto kao i datoteci source/empty. Koristite jednu naredbu.
touch -rm ../source/empty ../source/novi

# Izbriˇsite sve stvorene direktorije i datoteke u direktoriju LAB1 koriste ́ci jednu naredbu.
rm -rf ../*

# Izbriˇsite prazan direktorij LAB1 koriste ́ci naredbu za brisanje praznog direktorija.
rmdir ../../LAB1
