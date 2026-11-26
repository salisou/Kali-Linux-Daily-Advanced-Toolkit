# 06 – Sicurezza di base e buone pratiche di amministrazione

## 1. Obiettivo

La sicurezza di un sistema non dipende da un singolo comando. È il risultato di aggiornamenti, account correttamente gestiti, servizi necessari, permessi appropriati, firewall configurato e monitoraggio.

Questo modulo introduce controlli informativi e principi di amministrazione. Le modifiche saranno affrontate in laboratori dedicati.

## 2. Identità e privilegi

```bash
whoami
id
groups
sudo -l
```

- `whoami`: utente effettivo;
- `id`: UID, GID e gruppi;
- `groups`: gruppi dell'utente;
- `sudo -l`: privilegi sudo concessi all'utente corrente.

Non condividere output che contengono informazioni sensibili senza averli controllati.

## 3. Permessi di file

```bash
ls -l
stat file.txt
```

I permessi Linux distinguono proprietario, gruppo e altri utenti. Le lettere più comuni sono:
- `r`: lettura;
- `w`: scrittura;
- `x`: esecuzione o attraversamento di una directory.

Esempio di lettura:

```text
-rw-r--r-- 1 moussa moussa 1200 Nov 26 10:00 appunti.txt
```

Il proprietario può leggere e scrivere; gruppo e altri possono leggere. Non modificare permessi di sistema senza sapere quali applicazioni dipendono da quei file.

## 4. Aggiornamenti e software

Mantenere il sistema aggiornato riduce l'esposizione a vulnerabilità già corrette, ma gli aggiornamenti devono essere pianificati e verificati. Consultare il modulo 02 prima di usare APT.

Non installare script da Internet eseguendoli direttamente con privilegi root senza averne verificato provenienza e contenuto.

## 5. Servizi in ascolto

```bash
ss -tuln
systemctl --type=service --state=running
```

Questi comandi aiutano a individuare servizi e porte attivi. Una porta aperta non equivale automaticamente a una vulnerabilità: occorre capire il processo, l'indirizzo di ascolto, il firewall e il contesto di rete.

## 6. Firewall: osservare prima di modificare

Kali può usare differenti strumenti e backend firewall. Prima di cambiare regole, identificare cosa è installato e in uso:

```bash
command -v ufw
command -v nft
sudo nft list ruleset
```

L'ultimo comando può richiedere privilegi amministrativi e mostra le regole nftables, se presenti. Non applicare regole trovate online senza capirne l'effetto: si può perdere l'accesso remoto o bloccare servizi necessari.

## 7. Log e audit

```bash
journalctl -p warning -b
last
lastlog
```

La disponibilità e il contenuto di questi strumenti dipendono dalla configurazione del sistema. I log possono contenere nomi utente, indirizzi IP e altri dati sensibili: proteggerli e condividerli solo quando necessario.

## 8. Backup e ripristino

Prima di manutenzione importante:
- salvare documenti e configurazioni;
- verificare che il backup sia leggibile;
- conservare una copia separata dal sistema;
- usare snapshot per i laboratori virtuali;
- documentare le modifiche effettuate.

Uno snapshot non sostituisce un backup indipendente.

## 9. Uso responsabile degli strumenti di rete

Le verifiche di rete e sicurezza devono riguardare sistemi propri o per i quali si dispone di autorizzazione esplicita. Questo corso privilegia amministrazione, diagnosi e laboratori isolati. Non effettuare scansioni o tentativi di accesso su reti di terzi.

## 10. Checklist di controllo non invasiva

```bash
whoami
id
sudo -l
ss -tuln
systemctl --type=service --state=running
journalctl -p warning -b -n 30
df -h
```

Annotare i risultati, distinguendo:
- osservazioni;
- anomalie da approfondire;
- modifiche effettivamente eseguite.

## 11. Domande

1. Perché non bisogna usare sempre `sudo`?
2. Che cosa indicano i permessi `rwx`?
3. Una porta in ascolto è sempre una vulnerabilità?
4. Perché è rischioso eseguire script non verificati come root?
5. Perché uno snapshot non sostituisce un backup?
