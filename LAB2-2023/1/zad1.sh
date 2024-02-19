#!/bin/bash

# stvoriti korisnika stjepan. Korisnika treba stvoriti bez matiˇcnog direktorija, te da po defaultu koristi bash ljusku.
adduser --no-create-home --shell /bin/bash stjepan
# na macu sudo dscl . -create /Users/stjepan UserShell /bin/bash
# za mac je drukčija naredba, ovo nađeno na https://manpages.ubuntu.com/manpages/noble/en/man8/adduser.8.html 

# koristeci sudoers, omoguciti korisniku stjepan administrativne ovlasti kod pokretanja naredbi za stvaranje/brisanje korisnika i grupa te upravljanje vlasnicima i dozvolama. Navedene naredbe zelimo da korisnik pokrece bez lozinke. Napomena: mozda  ce biti potrebno dodati jos koju naredbu u taj popis.
echo 'stjepan ALL=(ALL) NOPASSWD: /usr/sbin/adduser, /usr/sbin/deluser, /usr/sbin/addgroup, /usr/sbin/delgroup, /usr/bin/chmod, /usr/bin/chown' | sudo tee -a /etc/sudoers
# chmod za promjenu dozvola, chown za promjenu vlasnika

#stvoriti grupu studenti koja ce biti sekundarna grupa svim studentima
sudo addgroup studenti
# na macu sudo dscl . -create /Groups/studenti

# stvoriti direktorij /home/studenti u kojemu  ce se nalaziti maticni direktoriji svih studenata. Direktoriju moraju moci pristupiti svi korisnici, ali nitko ne smije nista zapisivati u njega
sudo mkdir -m 555 /home/studenti 

# Unutar direktorija /home/studenti stvoriti direktorij studenti-shared
# koji ce sluziti kao zajednicki direktorij za sve studente.
# Korisnici koji nisu u grupi studenti ne smiju vidjeti sadrzaj direktorija
# niti ista zapisivati unutra.
sudo mkdir -m 770 /home/studenti/studenti-shared
chown :studenti /home/studenti/studenti-shared

#stvoriti novi skeleton (strukturu maticnog direktorija) koji sadrzi sve ono sto
#maticni direktoriji inace sadrze, uz dodatak dva direktorija: Documents, Download
#i simbolicke poveznice na zajednicki direktorij za studente. Naziv poveznice:Shared
sudo mkdir -p /etc/skel/{Documents,Downloads}
sudo ln -s /home/studenti/studenti-shared /etc/skel/Shared








