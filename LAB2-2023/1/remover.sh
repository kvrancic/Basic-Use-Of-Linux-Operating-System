# !/bin/bash 

for user in $(cat Studenti.txt)
do
    sudo deluser --remove-home "${user}"
done
