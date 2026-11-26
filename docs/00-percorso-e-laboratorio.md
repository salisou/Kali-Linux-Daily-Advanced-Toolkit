# 00 – Percorso del corso e preparazione del laboratorio

## 1. A chi è rivolto

Il corso è pensato per studenti che desiderano imparare a utilizzare Kali Linux come sistema Linux da amministrare e diagnosticare. Non è necessario conoscere già Bash: i concetti vengono introdotti gradualmente.

## 2. Cosa impareremo

Il percorso non consiste nel memorizzare una lista di comandi. Impareremo a formulare una domanda diagnostica, scegliere il comando adatto, leggere il risultato e decidere il passo successivo.

Esempio: se il computer sembra lento, non iniziamo a cancellare file. Prima osserviamo carico, memoria, processi e spazio disponibile:

```bash
uptime
free -h
ps aux --sort=-%cpu | head
df -h
```

Questi comandi raccolgono informazioni; non terminano processi e non eliminano dati.

## 3. Ambiente consigliato

Per i laboratori che modificano il sistema è preferibile una macchina virtuale Kali con snapshot. Uno snapshot permette di tornare a uno stato precedente in caso di errore.

Prima del laboratorio annotare:
- versione di Kali;
- ambiente: macchina virtuale, installazione fisica o WSL2;
- utente corrente;
- data e obiettivo dell'esercitazione.

Comandi di verifica:

```bash
cat /etc/os-release
uname -r
whoami
hostname
pwd
```

### Differenze tra VM, installazione fisica e WSL2

- **Macchina virtuale:** offre isolamento e snapshot; alcune periferiche e funzioni hardware possono essere virtualizzate.
- **Installazione fisica:** consente accesso diretto all'hardware; richiede maggiore prudenza.
- **WSL2:** è un ambiente Linux integrato in Windows, ma non equivale a una macchina Kali avviata direttamente. Alcuni controlli hardware, servizi e funzioni di rete possono comportarsi diversamente.

## 4. Regole prima di eseguire un comando

1. Leggere il comando e la relativa pagina manuale.
2. Capire se è di sola lettura o se modifica il sistema.
3. Verificare se richiede `sudo`.
4. Controllare con attenzione percorsi, dispositivi e nomi dei servizi.
5. Non eseguire comandi copiati da fonti non verificate.
6. Fare un backup o uno snapshot prima delle operazioni invasive.

Per consultare la documentazione:

```bash
man comando
comando --help
```

Esempi:

```bash
man df
df --help
```

Premere `q` per uscire da `man`.

## 5. Come usare il repository

Seguire l'ordine dei moduli. Ogni modulo contiene spiegazioni, esempi e attività pratiche. Le cartelle `exercises/`, `labs/` e `solutions/` separano gli esercizi, i laboratori guidati e le relative soluzioni.

## 6. Verifica iniziale

Eseguire:

```bash
whoami
pwd
hostnamectl
cat /etc/os-release
df -h
free -h
```

Annotare:
- nome dell'utente;
- directory corrente;
- nome e versione del sistema;
- spazio disponibile nella partizione principale;
- memoria totale e disponibile.

## 7. Domande di autovalutazione

1. Perché è utile usare una VM per i laboratori di manutenzione?
2. Qual è la differenza tra un comando di sola lettura e uno che modifica il sistema?
3. A cosa serve `man`?
4. Perché WSL2 non va considerato sempre equivalente a Kali installato direttamente?
5. Perché è importante controllare il percorso prima di usare un comando di eliminazione?

## 8. Soluzioni sintetiche

1. Permette isolamento e ripristino tramite snapshot.
2. Il primo osserva; il secondo cambia file, configurazioni, servizi o stato del sistema.
3. Mostra il manuale del comando.
4. Hardware, servizi e rete possono essere gestiti diversamente.
5. Un percorso errato può causare perdita di dati.
