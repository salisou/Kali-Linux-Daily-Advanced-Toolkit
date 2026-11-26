# 05 – Processi, servizi e avvio del sistema

## 1. Processo e servizio: differenza

Un processo è un programma in esecuzione, identificato da un PID (*Process ID*). Un servizio è un componente che fornisce una funzione al sistema o ad altri programmi e spesso viene gestito da un sistema di init, come systemd.

Non tutti i processi sono servizi e non tutti i servizi sono sempre attivi.

## 2. Elencare i processi – ps

```bash
ps
ps aux
ps aux --sort=-%cpu | head
ps aux --sort=-%mem | head
```

- `ps`: mostra i processi associati al terminale;
- `ps aux`: elenco più ampio dei processi;
- `--sort=-%cpu`: ordina per utilizzo CPU decrescente;
- `--sort=-%mem`: ordina per memoria decrescente;
- `head`: limita la visualizzazione alle prime righe.

Le percentuali sono istantanee o medie secondo le metriche dello strumento: non interpretarle senza contesto.

## 3. Monitoraggio interattivo – top e htop

```bash
top
```

`top` aggiorna periodicamente le informazioni sui processi. Premere `q` per uscire.

`htop` offre un'interfaccia interattiva più comoda:

```bash
sudo apt install htop
htop
```

L'installazione richiede una modifica del sistema e va eseguita solo dopo aver compreso il processo APT.

## 4. Identificare un processo – pgrep e pidof

```bash
pgrep -a ssh
pidof systemd
```

`pgrep` cerca processi in base al nome o ad altri criteri. `-a` mostra anche la riga di comando. `pidof` restituisce i PID associati a un eseguibile.

## 5. Segnali e terminazione: kill

`kill` invia un segnale a un processo. Non significa sempre terminare immediatamente.

```bash
kill -l
```

Per i laboratori iniziali, osservare i processi e non terminare processi di sistema. Un segnale come `SIGTERM` chiede al processo di terminare in modo ordinato; `SIGKILL` forza la terminazione e non permette al processo di gestire la chiusura. Usarlo senza necessità può causare perdita di dati o stati incoerenti.

## 6. Gestione servizi – systemctl

`systemctl` interagisce con systemd per controllare servizi e unità.

Consultare lo stato:

```bash
systemctl status ssh
systemctl is-active ssh
systemctl is-enabled ssh
```

- `status`: stato dettagliato e ultime righe di log;
- `is-active`: verifica se è attivo;
- `is-enabled`: verifica se è abilitato all'avvio.

Elencare servizi:

```bash
systemctl list-units --type=service
systemctl list-unit-files --type=service
```

Le unità caricate e i file di unità disponibili sono due elenchi differenti.

## 7. Avvio e arresto di servizi

I comandi seguenti modificano lo stato del sistema. Usarli solo su un servizio noto e in un laboratorio controllato:

```bash
sudo systemctl start nome-servizio
sudo systemctl stop nome-servizio
sudo systemctl restart nome-servizio
```

Per abilitare o disabilitare l'avvio automatico:

```bash
sudo systemctl enable nome-servizio
sudo systemctl disable nome-servizio
```

Prima di usare questi comandi, verificare il nome corretto e capire quale applicazione dipende dal servizio.

## 8. Log di sistema – journalctl

`journalctl` consulta il journal di systemd.

```bash
journalctl -b
journalctl -b -p warning
journalctl -u ssh
journalctl -n 50
journalctl -f
```

- `-b`: avvio corrente;
- `-p warning`: priorità warning e più gravi;
- `-u ssh`: log relativi all'unità indicata;
- `-n 50`: ultime 50 righe;
- `-f`: segue i nuovi messaggi.

Uscire dalla visualizzazione continua con `Ctrl+C`.

## 9. Laboratorio

1. Visualizzare i processi.
2. Trovare i processi che utilizzano più CPU.
3. Trovare quelli che utilizzano più memoria.
4. Verificare lo stato di un servizio presente nel proprio sistema.
5. Visualizzare gli ultimi messaggi del journal.
6. Spiegare la differenza tra processo e servizio.

Comandi:

```bash
ps aux
ps aux --sort=-%cpu | head
ps aux --sort=-%mem | head
systemctl list-units --type=service
journalctl -b -n 30
```

Non arrestare servizi di rete, sessione grafica o sistema durante questo laboratorio.
