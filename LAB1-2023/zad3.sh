echo -n "Upisi godinu za koju te zanima koliko puta se dogodio petak 13.:" 
read godina;
petkovi=$(ncal $godina | grep "^Fr" | grep -c "13")
echo "U godini $godina, petak 13. se dogodio $petkovi puta."