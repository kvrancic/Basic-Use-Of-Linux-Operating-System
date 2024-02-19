#!/bin/bash 

# Prva skripta u petlji nasumicno odabire i salje jedan od tri proizvoljno odabrana signala svake sekunde drugoj skripti:

sensorPid=$(ps ax -o pid,command | grep "[b]ash signal_receiver.sh$" | awk '{print $1}')

while true; do
    sleep 1
    sigval=$((1 + RANDOM % 3))

    case $sigval in
        1)
            kill -s SIGUSR1 $sensorPid
            ;;
        2)
            kill -s SIGUSR2 $sensorPid
            ;;
        3)
            kill -s SIGTERM $sensorPid
            ;;
    esac
done
