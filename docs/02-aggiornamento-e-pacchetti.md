# 02 – Aggiornamento di Kali e gestione dei pacchetti

## 1. Che cos'è APT

APT (*Advanced Package Tool*) è il sistema di gestione dei pacchetti utilizzato da Kali Linux, distribuzione basata su Debian. Permette di consultare gli indici dei repository, installare programmi, aggiornarli e rimuoverli gestendo le dipendenze.

Un pacchetto è un archivio software installabile che contiene file, metadati e informazioni sulle dipendenze.

## 2. Repository e indici: due concetti diversi

Il repository è una sorgente da cui vengono distribuiti i pacchetti. Gli indici locali descrivono quali versioni sono disponibili.

```bash
sudo apt update
```

Questo comando **non aggiorna direttamente tutti i programmi**: scarica e aggiorna gli indici dei pacchetti disponibili.

Per installare gli aggiornamenti disponibili:

```bash
sudo apt upgrade
```

Per un aggiornamento più completo, che può installare o rimuovere pacchetti per risolvere le dipendenze:

```bash
sudo apt full-upgrade
```

Prima di confermare, leggere il riepilogo di ciò che APT intende installare, aggiornare o rimuovere. Non aggiungere automaticamente `-y` durante l'apprendimento: la conferma permette di controllare il piano.

## 3. Esempio guidato di aggiornamento

```bash
sudo apt update
apt list --upgradable
sudo apt upgrade
```

1. `apt update` aggiorna gli indici.
2. `apt list --upgradable` mostra i pacchetti aggiornabili.
3. `apt upgrade` propone l'aggiornamento e richiede conferma.

## 4. Cercare e installare un pacchetto

Cercare:

```bash
apt search htop
apt show htop
```

Installare:

```bash
sudo apt install htop
```

Verificare:

```bash
htop
```

Uscire da htop con `q`.

Rimuovere il programma mantenendo, in genere, i file di configurazione:

```bash
sudo apt remove htop
```

Rimuovere anche i file di configurazione gestiti dal pacchetto:

```bash
sudo apt purge htop
```

La rimozione di configurazioni può rendere necessario riconfigurare il programma in una futura installazione.

## 5. Dipendenze e pulizia

`apt autoremove` propone la rimozione di pacchetti installati automaticamente che non risultano più necessari:

```bash
sudo apt autoremove
```

Leggere sempre la lista prima di confermare.

`apt clean` elimina gli archivi dei pacchetti scaricati nella cache:

```bash
sudo apt clean
```

`apt autoclean` rimuove dalla cache gli archivi non più scaricabili:

```bash
sudo apt autoclean
```

Questi comandi non sono equivalenti: non cancellano indiscriminatamente i file personali dell'utente.

## 6. Informazioni su un pacchetto

```bash
dpkg -l htop
dpkg -s htop
apt policy htop
```

- `dpkg -l`: elenca i pacchetti corrispondenti;
- `dpkg -s`: mostra lo stato e i metadati del pacchetto;
- `apt policy`: mostra versione installata e candidate disponibili.

## 7. Cosa evitare

- Non mescolare repository di Ubuntu, Debian e Kali senza una precisa ragione e competenza.
- Non sostituire alla cieca i file delle sorgenti APT.
- Non interrompere un aggiornamento in corso.
- Non accettare una rimozione massiva senza capirne le conseguenze.
- Non eseguire comandi di aggiornamento automatico in script non testati.

La documentazione ufficiale Kali raccomanda di mantenere le sorgenti coerenti con Kali e di non aggiungere repository di altre distribuzioni: una configurazione incompatibile può compromettere il sistema.

## 8. Laboratorio

1. Visualizzare le informazioni del sistema.
2. Aggiornare gli indici.
3. Cercare il pacchetto `curl`.
4. Visualizzare i dettagli del pacchetto.
5. Controllare se esistono aggiornamenti disponibili.
6. Installare `htop`, avviarlo e uscire.
7. Rimuovere `htop) solo se non serve più.

Comandi di riferimento:

```bash
cat /etc/os-release
sudo apt update
apt search curl
apt show curl
apt list --upgradable
sudo apt install htop
htop
sudo apt remove htop
```

## 9. Domande

1. Qual è la differenza tra `apt update` e `apt upgrade`?
2. Che cosa può accadere durante `full-upgrade`?
3. Perché bisogna leggere la lista di `autoremove`?
4. Che differenza c'è tra `remove` e `purge`?
5. Perché non bisogna aggiungere repository casuali a Kali?
