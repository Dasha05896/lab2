#!/bin/bash

while true; do
    curl -u dasha05896:Dasha27022005 -s http://localhost   # Надсилає запит до локального сервера
    sleep $((5 + RANDOM % 6))  # Випадковий інтервал від 5 до 10 секунд
done
