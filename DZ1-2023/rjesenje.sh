#Zadaci
#1. Ispiˇsite trenutni radni direktorij. (0.5)
#Napomena: Nije potrebno ispisati sadrˇzaj direktorija.
pwd 

#2. Ispiˇsite sadrˇzaj .bash history datoteke u vaˇsem matiˇcnom direktoriju. (0.5)
cat ~/.bash_history

# 3. Ispiˇsite sadrˇzaj home direktorija trenutnog korisnika sortirano po veliˇcini uzlazno. (1.0)
ls -lhrS ~ # l za long, h human readable, r da obrnemo i S za silazni sort 

# 4. Bez mijenjanja radnog direktorija, unutar direktorija /tmp napravite direktorij OKOSL tjedan koji  ́ce sadrˇzavati direktorije ponedjeljak, utorak, srijeda, cetvrtak, petak i subota, gdje  ́ce subota biti skriveni direktorij. (1.0)
mkdir -p /tmp/OKOSL\ tjedan/{pondjeljak,utorak,srijeda,cetvrtak,petak,.subota,nedjelja}

# 5. Bez mijenjanja radnog direktorija, u skrivenom direktoriju iz proˇslog zadatka subota napravite prazne datoteke predavanja, labosi, zadaca1, zadaca2 ... zadaca8. (1.0)
touch /tmp/OKOSL\ tjedan/.subota/{predavanja,labosi,zadaca{1..8}}

#6. Kopirajte direktorij subota u direktorij ponedjeljak. (0.5)
cp -r /tmp/OKOSL\ tjedan/.subota /tmp/OKOSL\ tjedan/ponedjeljak

#7. Ispiˇsite cijeli sadrˇzaj direktorija /tmp/OKOSL tjedan rekurzivno kako biste dokazali da su uistinu svi direktoriji i datoteke napravljeni kako smo i htjeli. (0.5)
ls -R tmp/OKOSL\ tjedan/* tmp/OKOSL\ tjedan/.* # ZASTO NO MATCHES

#8. U svom matiˇcnom direktoriju stvorite simboliˇcku poveznicu Varionica na direktorij /var. (0.75)
ln -s /var/ /Users/Varionica

#9. Ispiˇsite sadrˇzaj /var direktorija koriste ́ci poveznicu stvorenu u proˇslom zadatku. (0.5)
ls /Users/Varionica

#10. Izbriˇsite simboliˇcku poveznicu Varionica. (0.5)
rm /Users/Varionica 

#11. Odredite koliko vam je preostalo slobodne memorije na disku montiranom na / direktorij. Pobrinite se da je ispis u ljudski ˇcitljivom formatu. (0.75)
df -h /

#12. Odredite kojeg su tipa datoteke /bin/bash, /etc/passwd i /boot, tim redoslijedom. (0.5)
file /bin/bash /etc/passwd /boot
