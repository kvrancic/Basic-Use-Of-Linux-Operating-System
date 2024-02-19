#!/bin/bash

# Dio 1: Razvrstavanje Downloads direktorija
cd /tmp/OKOSL/downloads
for file in *; do
    if [[ "$file" == *_* ]]; then
        subject=${file%%_*}
        mkdir -p "../$subject"
        mv "$file" "../$subject/"
    else
        # ako ne postoji direktorij razonoda napravi ga
        if [[ ! -d ../razonoda ]]; then
            mkdir -p ../razonoda
        fi
        mv "$file" ../razonoda/
    fi
done

# Dio 2: Razvrstavanje direktorija "razonoda"
cd ../razonoda
for file in *; do
    case "$file" in
        *.pdf | *.epub)
            mkdir -p knjige
            mv "$file" knjige/ ;;
        *.jpg | *.jpeg)
            mkdir -p slike
            mv "$file" slike/ ;;
        *.mp3)
            mkdir -p muzika
            mv "$file" muzika/ ;;
    esac
done