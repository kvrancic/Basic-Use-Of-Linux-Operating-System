#!/bin/bash

# Stvara datoteku ako ne postoji
touch /tmp/inboxA.txt /tmp/inboxB.txt

# Pokreće praćenje poruka koje šalje korisnik B u pozadini
tail -f /tmp/inboxB.txt &

# Sprema PID procesa kako bi ga mogao prekinuti kasnije
TAIL_PID=$!

# Čeka unos korisnika A i preusmjerava ga u datoteku inboxA.txt
# Ovdje koristimo 'cat' kako bismo čitali standardni ulaz i slali ga u datoteku
cat > /tmp/inboxA.txt

# Prekida tail proces kada se 'cat' završi (npr. korisnik upiše Ctrl-D)
kill $TAIL_PID
