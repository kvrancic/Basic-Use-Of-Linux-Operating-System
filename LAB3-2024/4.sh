#!/bin/bash

#Pronadite sve Python datoteke na sustavu (hint: ekstenzija .py) i ispisite nazive svih funkcija iz njih (hint: kljucna rijec def).
egrep -Rhs --include='*.py' "^def " / | sed -r "s/def (.*)\(.*/\1/" 

#Pronadite sve C datoteke u sustavu (hint: ekstenzije .c i .h). Ispisite svepretprocesorske naredbe iz njih.
egrep -Rhs --include='*.c' --include='*.h' '^#' /


# Pronadite sve datoteke u sustavu koje sadrze niz include. Ispisite redni broj retka u kojemu se nalazi pronadeni niz.
egrep -Rsn "include" / | sed -r "s/(.*:[0-9]*):.*/\1/"