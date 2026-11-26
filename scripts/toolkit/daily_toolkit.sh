#!/usr/bin/env bash
#
# Daily Advanced Toolkit - versione didattica iniziale per Kali Linux
# Tutte le voci di questa versione sono controlli di sola lettura.
#
# Avvio:
#   bash scripts/toolkit/daily_toolkit.sh
#
# Questo programma non installa software, non cancella file e non modifica
# servizi, firewall, partizioni o configurazioni di rete.

set -u

pausa() {
    printf '\n'
    read -r -p "Premi INVIO per tornare al menu..." _
}

titolo() {
    clear
    printf '%s\n' "=================================================="
    printf '%s\n' "       KALI LINUX - DAILY ADVANCED TOOLKIT"
    printf '%s\n' "=================================================="
}

esegui_controllo() {
    local descrizione="$1"
    shift

    printf '\n--- %s ---\n' "$descrizione"

    if ! command -v "$1" >/dev/null 2>&1; then
        printf 'Errore: comando non disponibile: %s\n' "$1"
        return 1
    fi

    "$@"
}

menu_sistema() {
    titolo
    esegui_controllo "Distribuzione" cat /etc/os-release
    esegui_controllo "Kernel" uname -r
    esegui_controllo "Hostname" hostname
    pausa
}

menu_risorse() {
    titolo
    esegui_controllo "CPU" lscpu
    esegui_controllo "Memoria" free -h
    pausa
}

menu_storage() {
    titolo
    esegui_controllo "Spazio filesystem" df -h
    esegui_controllo "Dischi e filesystem" lsblk -f
    pausa
}

menu_rete() {
    titolo
    esegui_controllo "Interfacce e indirizzi" ip -br addr
    esegui_controllo "Tabella di routing" ip route
    pausa
}

menu_processi() {
    titolo
    esegui_controllo "Processi con maggiore uso CPU" ps aux --sort=-%cpu
    printf '\nNota: elenco completo. Per approfondire usare man ps.\n'
    pausa
}

menu_log() {
    titolo
    if command -v journalctl >/dev/null 2>&1; then
        journalctl -b -n 30 --no-pager
    else
        printf '%s\n' "journalctl non è disponibile in questo ambiente."
    fi
    pausa
}

mostra_menu() {
    titolo
    cat <<'MENU'
1) Informazioni generali sul sistema
2) CPU e memoria
3) Dischi e spazio disponibile
4) Rete e interfacce
5) Processi
6) Ultimi messaggi del journal
0) Esci

Questa versione esegue esclusivamente controlli informativi.
MENU
}

main() {
    local scelta

    while true; do
        mostra_menu
        read -r -p "Seleziona un'opzione: " scelta

        case "$scelta" in
            1) menu_sistema ;;
            2) menu_risorse ;;
            3) menu_storage ;;
            4) menu_rete ;;
            5) menu_processi ;;
            6) menu_log ;;
            0)
                printf '%s\n' "Chiusura del toolkit. Nessuna modifica è stata eseguita."
                break
                ;;
            *)
                printf '\n%s\n' "Scelta non valida. Inserisci un numero tra 0 e 6."
                pausa
                ;;
        esac
    done
}

main
