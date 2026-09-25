#!/bin/bash

# Uso totale della CPU = 100 − idle
#top= mostra l'uso della CPU
# -bn1 - b sta per batch(non interattivo) n1 fa una sola rilevazione
#sed - estrae il numero che precede id, cioè la percentuale di CPU inattiva.
#bc - fa la sottrazione 100 - idle, perché bash da solo non gestisce i decimali.

echo ""
echo "===== USO CPU ====="
# ... codice della CPU ...
echo ""
cpu_id=$(LC_ALL=C top -bn1 | grep "Cpu(s)" | sed 's/.*, \(.*\) id.*/\1/') #LC_ALL=C vuol dire lingua neutra, bc adesso legge il punto
cpu_usage=$(echo "100 - $cpu_id" | bc)

echo "Uso totale CPU: ${cpu_usage}%"
echo ""

echo "===== USO MEMORIA (RAM) ====="
# ... codice della RAM ...
echo ""
Used=$(free -m |grep Mem | awk '{print $3}')
Free=$(free -m |grep Mem | awk '{print $4}')
Total=$(free -m |grep Mem | awk '{print $2}')
Cache=$(free -m |grep Mem | awk '{print $6}')

Mem_usage=$(awk -v used="$Used" -v total="$Total" 'BEGIN {printf "%.2f", (used / total) * 100}') #percentuale usata = usata ÷ totale × 100
echo "Memoria in uso RAM: ${Used}MB (${Mem_usage}%)"

Mem_Free=$(awk -v used="$Free" -v total="$Total" 'BEGIN {printf "%.2f", (used / total) * 100}') #percentuale Libera = libera ÷ totale × 100
echo "Memoria libera RAM: ${Free}MB  (${Mem_Free}%)"

FreeConCache=$((Free + Cache))

Mem_Cache=$(awk  -v Libera="$FreeConCache" -v Totale="$Total" 'BEGIN {printf "%.2f", (Libera /  Totale) * 100 }') #percentuale libera con cache = FreeConCache / Total × 100
echo "Memoria libera con cache RAM: ${FreeConCache}MB (${Mem_Cache}%)"
echo ""


echo "===== USO DISCO ====="
# ... codice del disco ...
echo ""
size=$(df -h / |tail -n 1| awk '{print $2}')
total=$(df -m / |tail -n 1| awk '{print $2}')
echo "Total Size: ${size}"

usato=$(df -h / |tail -n 1| awk '{print $3}')
used=$(df -m / |tail -n 1| awk '{print  $3}')

disponibile=$(df -h / |tail -n 1| awk '{print $4}')
avail=$(df -m / | tail -n 1 | awk '{print $4}')

 
avail_pct=$(awk -v avail="$avail" -v total="$total" 'BEGIN {printf "%.2f", (avail / total) * 100}')
echo "Disco disponibile: ${disponibile} (${avail_pct}%)"

used_pct=$(awk -v used="$used" -v total="$total" 'BEGIN {printf "%.2f", (used / total) * 100}')
echo "Disco usato: ${usato} (${used_pct}%)"
echo ""



echo "===== TOP 5 PROCESSI PER CPU ====="
top5processi=$(ps aux --sort=-%cpu | head -n 6)
echo "${top5processi}"
echo ""


echo "===== TOP 5 PROCESSI PER MEM ====="
top5processi=$(ps aux --sort=-%mem | head -n 6)
echo "${top5processi}"
echo  ""

echo "===== UTENTI CONNESSI ====="
utenti=$(who | wc -l)
echo "Utenti connessi: ${utenti}"
