#!/usr/bin/env bash
#
# info_sistema.sh
# Script didattico di diagnostica non invasiva per Kali Linux.
# Non installa pacchetti, non elimina file e non modifica configurazioni.
#
# Esecuzione:
#   bash scripts/diagnostica/info_sistema.sh
#
# Nota:
#   Alcune informazioni possono non essere disponibili in WSL2 o VM.

set -u

titolo() {
    printf '\n%s\n' "=================================================="
    printf '%s\n' "$1"
    printf '%s\n' "=================================================="
}

mostra_comando() {
    local descrizione="$1"
    shift

    printf '\n--- %s ---\n' "$descrizione"

    if command -v "$1" >/dev/null 2>&1; then
        "$@" 2>&1 || printf 'Il comando ha restituito un codice diverso da zero.\n'
    else
        printf 'Comando non disponibile: %s\n' "$1"
    fi
}

titolo "KALI LINUX - DIAGNOSTICA DI BASE"

printf 'Data e ora: '
date

printf 'Utente: '
whoami

printf 'Hostname: '
hostname

titolo "INFORMAZIONI SUL SISTEMA"
mostra_comando "Distribuzione Linux" cat /etc/os-release
mostra_comando "Kernel" uname -a
mostra_comando "Architettura" uname -m

titolo "CPU E MEMORIA"
mostra_comando "Informazioni CPU" lscpu
mostra_comando "Memoria RAM" free -h

titolo "SPAZIO E DISPOSITIVI"
mostra_comando "Filesystem montati" df -h
mostra_comando "Dischi e partizioni" lsblk -f

titolo "RETE"
mostra_comando "Interfacce e indirizzi" ip -br addr
mostra_comando "Tabella di routing" ip route

titolo "PROCESSI"
mostra_comando "Processi con maggiore uso CPU" ps aux --sort=-%cpu
printf '\nVisualizzazione limitata alle prime 10 righe del risultato precedente non applicata: consultare ps manualmente per filtri specifici.\n'

titolo "FINE DEL CONTROLLO"
printf '%s\n' "Controllo completato. Nessuna configurazione è stata modificata."
