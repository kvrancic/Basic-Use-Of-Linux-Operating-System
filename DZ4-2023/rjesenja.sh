#!/usr/bin/bash

# Obavezno prije rjesavanja detaljno procitajte pdf datoteku zadace kao i upute
# za rjesavanje domacih zadaca u repozitoriju kolegija!

# Bilo kakvo hardkodiranje rjesenja negativno ce se ocijeniti.

# Zadatke 1-9 potrebno je rijesiti bez koristenja naredbe grep.

#!#!#!#!#!#!#
# 1. Ispisite sve procese koje je pokrenuo trenutni korisnik (i samo njih)
# koristeci naredbu ps. Kao i uvijek, ucinite to dinamicki, a ne hardkodiranjem
# svog korisnickog imena. (0.5)
ps -u $USER


#!#!#!#!#!#!#
# 2. Sortirajte ispis po zauzecu memorije. (0.5)
ps -u $USER --sort -rss


#!#!#!#!#!#!#
# 3. Sada ucinite zadatak 2. pomocu naredbe top. (1.0)
top -o mem


#!#!#!#!#!#!#
# 4. Ispisite sve PID-ove vaseg internet preglednika. (0.5)
# (ovdje koristite posebnu vrstu naredbe grep koja je za procese)
pgrep chrome


#!#!#!#!#!#!#
# 5. Ispisite proces s PPID-om 2. (0.5)
ps -p 2

#!#!#!#!#!#!#
# 6. Ispisite procese s PID-om 1,4 i 7. (0.5)
ps -p 1,4,7


#!#!#!#!#!#!#
# 7. Ispisite stablo procesa za trenutnog korisnika. (0.5)
pstree $USER


#!#!#!#!#!#!#
# 8. Ispisite sve signale dostupne u vasem sustavu. (0.5)
kill -l



#!#!#!#!#!#!#
# 9. Ispisite popis ljuski dostupnih na sustavu. (0.5)
cat /etc/shells


#!#!#!#!#!#!#

# Zadaci 10-14 se odnose na C program signal_handler.c
# Posebno obratite pozornost da u zadacima 12-15 ne hardkodirate PID programa!

# 10. Pokrenite program u pozadini. (0.5)

./signal_handler &
# Napomena: Program je prvo potrebno prevesti (npr. gcc signal_handler.c) te,
# po potrebi, izmjeniti dozvole (npr. chmod +x ime_datoteke). Izlaznu datoteku
# kod prevodenja nazovite signal_handler. Naredbu za prevodenje programa te
# izmjenu dozvola ne navodite u rjesenju.
gcc signal_handler.c -o signal_handlerExe
chmod +x ./signal_handlerExe
./signal_handlerExe &


#!#!#!#!#!#!#
# 11. Pronadite PID tog programa. (0.5)
ps -o pid,command | grep "[s]ignal_handlerExe$" | awk '{print $1}'



#!#!#!#!#!#!#
# 12. Pokusajte "ubiti" taj proces naredbom kill, a potom ga pokusajte ubiti
# slanjem adekvatnog signala. (0.5)
# Napomena: U rjesenju se traze dvije naredbe
kill $(ps -o pid,command | grep "[s]ignal_handlerExe$" | awk '{print $1}')
kill -9 $(ps -o pid,command | grep "[s]ignal_handlerExe$" | awk '{print $1}') 

#!#!#!#!#!#!#
# 13. Pokrenite program u pozadini te mu posaljite signal SIGUSR1. (0.5)
# Napomena: U rjesenju se traze dvije naredbe
./signal_handlerExe &
kill -s SIGUSR1 $(ps -o pid,command | grep "[s]ignal_handlerExe$" | awk '{print $1}')

#!#!#!#!#!#!#
# 14. Posaljite mu SIGINT. (0.5)
kill -s SIGINT $(ps -o pid,command | grep "[s]ignal_handlerExe$" | awk '{print $1}')



#!#!#!#!#!#!#
# 15. Pokrenite program u pozadini te mu posaljite signal SIGUSR2. (0.5)
# Napomena: U rjesenju se traze dvije naredbe
./signal_handlerExe &
kill -s SIGUSR2 $(ps -o pid,command | grep "[s]ignal_handlerExe$" | awk '{print $1}')



#!#!#!#!#!#!#
