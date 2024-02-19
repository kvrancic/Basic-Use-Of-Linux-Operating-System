#!/bin/bash 

#napisati skriptu za stvaranje novih korisnika. Skripta mora biti neinteraktivna, tj. mora napraviti sto se trazi od nje bez dodatnih unosa od strane korisnika tijekom izvodenja. Skripta mora:
# – stvoriti korisnike koji su navedeni u datoteci
# – svakom korisniku postaviti da koristi bash ljusku
# – svakom korisniku stvoriti maticni direktorij koristeci nas skeleton
# – svakom korisniku postaviti istu defaultnu lozinku. Napomena: Postavljanje defaultne lozinke neinteraktivnim putem je sigurnosni rizik koji cemo za potrebe ovog zadatka nakratko ignorirati.
#  – osigurati da nitko ne moze pristupiti maticnom direktoriju osim njegovog vlasnika, da bismo sprijecili ostale studente da vide osjetljive podatke

for user in $(cat students.txt) # iteriramo po outputu cat students.txt
do
    sudo adduser --shell /usr/bin/bash --home /home/studenti/"${user}" --gecos '' "${user}" # stvaramo korisnika
    echo "${user}password" | sudo chpasswd # postavljamo lozinku
    sudo usermod -aG studenti "${user}" # dodajemo korisnika u grupu studenti
    sudo chmod 700 /home/studenti/"${user}" # omogucavamo samo vlasniku 
done

