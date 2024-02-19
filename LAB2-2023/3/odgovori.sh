#!/bin/bash 

# Skripta lab02-3.sh sadrzi beskonacnu petlju. Na sljedeca pitanja je potrebno odgovoriti pokretanjem te skripte i manipulacijom njenog procesa.

# • Pokrenite proces u foreground-u te ga zatim posaljite u pozadinu. Objasnite kako ste to napravili. Kako biste proces poslali u pozadinu odmah pri pokretanju?

# u foregroundu pa u pozadinu: 
bash lab02-3.sh
# ctrl+z
# bg

# odmah u pozadinu:
bash lab02-3.sh &

# • Nastavite izvodenje procesa u pozadini. Kako ste to izveli?

# ako je vec u pozadini, nastavlja se izvoditi - mozemo provjeriti s:
jobs

# • Pronadite PID pokrenute skripte i njezin nice broj. Promijenite ga. Objasnite sto ste s time postigli.

ps -o pid,ni,command | grep "[b]ash lab02-3.sh$" | awk '{print $1, $2}'
# promjena nice broja:
renice -n 10 -p $(ps -o pid,ni,command | grep "[b]ash lab02-3.sh$" | awk '{print $1}')
# povećan je na 10 što znači da mu je smanjen prioritet

# • Dok se proces izvodi u foregroundu pritisnite kombinaciju tipki CTRL+C. Koji je signal poslan? Sto se dogodilo i zasto? Sto morate uciniti kako biste prekinuli proces pomocu signala?

# poslan je SIGINT - interrupt signal - prekida izvođenje skripte
# da bi se prekinuo proces pomocu signala, potrebno je koristiti kill:
kill -s SIGINT $(ps -o pid,command | grep "[b]ash lab02-3.sh$" | awk '{print $1}')


# • Ugasite terminal. Objasnite sto se dogodilo s procesom. Koji signal mu je poslan? Navedite barem jedan nacin kako biste pokrenuli proces i osigurali nastavak njegova izvodenja nakon gasenja terminala.
# poslan je SIGHUP - hangup signal - prekida procese koji su vezani za terminal
# da bi se proces nastavio izvoditi nakon gasenja terminala, potrebno je koristiti nohup:
nohup bash lab02-3.sh &