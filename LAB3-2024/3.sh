#!/bin/bash

cat << EOF > Top10
Linux Mint 19.1
Ubuntu 20.4
Debian GNU/Linux 10.7
Mageia 7.1
Fedora 33
openSUSE Leap 15.2
Arch Linux
CentOS 8
PCLinuxOS
Slackware Linux 14.2
FreeBSD
EOF

echo "Izvorna datoteka Top10:"
cat Top10

# Obrisati sve redove koji sadrze imena distribucija bez brojeva
sed -i '' '/[0-9]/!d' Top10

echo "Datoteka Top10 nakon brisanja redova koji ne sadrze brojeve:"
cat Top10

# Brojeve verzija prebaciti na pocetak reda
sed -i '' -E 's/([^0-9]*)([0-9]+\.[0-9]+)/\2 \1/' Top10

echo "Datoteka Top10 nakon premjestanja brojeva verzija na pocetak reda:"
cat Top10

# Sva slova promijeniti u mala
#sed -i '' 's/\(.*\)/\L\1/' Top10
awk '{print tolower($0)}' Top10 > temp && mv temp Top10

echo "Datoteka Top10 nakon promjene svih slova u mala:"
cat Top10

# Sve samoglasnike prebaciti u velika slova
sed -i '' 's/a/A/g; s/e/E/g; s/i/I/g; s/o/O/g; s/u/U/g' Top10

echo "Datoteka Top10 nakon promjene svih samoglasnika u velika slova:"
cat Top10
