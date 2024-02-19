#!/bin/bash

# Slično kao i za posiljateljA.sh, ali obrnuti smjer
touch /tmp/vokitokiA.txt /tmp/vokitokiB.txt

tail -f /tmp/vokitokiA.txt &
TAIL_PID=$!

cat > /tmp/vokitokiB.txt

kill $TAIL_PID
