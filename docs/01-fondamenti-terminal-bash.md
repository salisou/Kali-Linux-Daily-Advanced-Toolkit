# 01 – Fondamenti del terminale Linux e Bash

## 1. Che cos'è il terminale

Il terminale è un'interfaccia testuale attraverso cui l'utente comunica con il sistema operativo. Invece di selezionare un'icona, scriviamo un comando e leggiamo la risposta.

La shell è il programma che interpreta i comandi. In questo corso useremo principalmente **Bash**, una delle shell più diffuse nei sistemi Linux.

## 2. Struttura generale di un comando

La forma più comune è:

```bash
comando [opzioni] [argomenti]
```

- **comando:** programma o istruzione da eseguire;
- **opzione:** modifica il comportamento del comando;
- **argomento:** indica su quale file, directory o oggetto lavorare.

Esempio:

```bash
ls -lah /var/log
```

- `ls` elenca i contenuti;
- `-l` richiede il formato dettagliato;
- `-a` include i file nascosti;
- `-h` rende le dimensioni più leggibili;
- `/var/log` è la directory da esaminare.

Le opzioni brevi possono spesso essere combinate. L'ordine degli argomenti può essere importante: consultare sempre `man`.

## 3. Dove mi trovo? – pwd

### Che cos'è e a cosa serve

`pwd` significa *print working directory*. Mostra il percorso assoluto della directory corrente. È utile per sapere dove si sta lavorando prima di creare, spostare o eliminare file.

```bash
pwd
```

Esempio di risultato:

```text
/home/moussa
```

Il risultato indica che la directory corrente è `moussa`, contenuta in `/home`.

## 4. Elencare file e directory – ls

`ls` mostra il contenuto di una directory.

Esempi:

```bash
ls
ls -l
ls -a
ls -lh
ls -lah /etc
```

- `ls`: elenco essenziale;
- `ls -l`: dettagli come permessi, proprietario, dimensione e data;
- `ls -a`: include nomi nascosti, che iniziano con un punto;
- `ls -lh`: dimensioni in formato leggibile;
- `ls -lah /etc`: combina le opzioni e analizza `/etc`.

Per ordinare per data di modifica:

```bash
ls -lt
ls -ltr
```

`-t` ordina per data; `-r` inverte l'ordine.

## 5. Cambiare directory – cd

`cd` significa *change directory*.

```bash
cd /etc
cd /var/log
cd ..
cd ~
cd -
```

- `cd /etc`: entra in `/etc`;
- `cd ..`: sale alla directory superiore;
- `cd ~`: torna alla home dell'utente;
- `cd -`: torna alla directory precedente.

La differenza tra percorso assoluto e relativo:
- assoluto: inizia da `/`, per esempio `/var/log`;
- relativo: viene interpretato rispetto alla directory corrente, per esempio `Documenti`.

## 6. Creare directory e file – mkdir e touch

`mkdir` crea directory:

```bash
mkdir laboratorio
mkdir -p corso/modulo1/esempi
```

Con `-p` vengono create anche le directory intermedie mancanti.

`touch` crea un file vuoto se non esiste:

```bash
touch appunti.txt
touch esempio1.txt esempio2.txt
```

Se il file esiste già, `touch` aggiorna normalmente i suoi timestamp: non è un comando per cancellare il contenuto.

## 7. Leggere file – cat, less, head e tail

`cat` stampa il contenuto:

```bash
cat appunti.txt
cat /etc/os-release
```

`less` permette di leggere file lunghi senza riversarli tutti sul terminale:

```bash
less /var/log/syslog
```

Se il file non esiste, il comando segnala un errore. In alcune installazioni il log di sistema può essere consultabile tramite journal invece che tramite `/var/log/syslog`.

`head` mostra le prime righe:

```bash
head appunti.txt
head -n 20 appunti.txt
```

`tail` mostra le ultime righe:

```bash
tail appunti.txt
tail -n 30 appunti.txt
tail -f /var/log/syslog
```

Con `-f` il terminale continua a mostrare le nuove righe aggiunte al file. Interrompere con `Ctrl+C`.

## 8. Copiare, spostare e rinominare – cp e mv

`cp` copia:

```bash
cp origine.txt copia.txt
cp -i origine.txt copia.txt
cp -r progetto/ progetto_backup/
```

- `-i` chiede conferma prima di sovrascrivere;
- `-r` copia ricorsivamente una directory.

`mv` sposta o rinomina:

```bash
mv appunti.txt documenti/
mv vecchio_nome.txt nuovo_nome.txt
```

Attenzione: se la destinazione esiste, il comportamento può comportare la sostituzione del file. Verificare prima i percorsi e usare le opzioni interattive quando appropriate.

## 9. Eliminare – rm e rmdir

Questi comandi modificano il filesystem e richiedono particolare attenzione.

`rmdir` elimina una directory vuota:

```bash
rmdir directory_vuota
```

`rm` elimina file:

```bash
rm -i prova.txt
```

L'opzione `-i` chiede conferma. Non usare opzioni ricorsive o forzate su percorsi non verificati. In questo corso gli esempi distruttivi verranno svolti solo su file di prova creati appositamente.

## 10. Cercare file e testo – find e grep

`find` cerca file e directory:

```bash
find . -name "appunti.txt"
find /var/log -type f -name "*.log"
find . -type d -name "backup"
```

- `.` indica la directory corrente;
- `-type f` limita ai file;
- `-type d` limita alle directory;
- `-name` specifica il nome da cercare.

`grep` cerca testo:

```bash
grep "ERROR" system.log
grep -i "error" system.log
grep -n "ERROR" system.log
grep -in "error" system.log
```

- `-i`: ignora maiuscole/minuscole;
- `-n`: mostra il numero di riga.

Per cercare in più file:

```bash
grep -n "ERROR" *.log
grep -Rni "failed" /var/log
```

La ricerca ricorsiva in directory di sistema può richiedere permessi e produrre molti risultati.

## 11. Ordinare e contare – sort e uniq

`sort` ordina le righe:

```bash
sort nomi.txt
sort -r nomi.txt
sort -n numeri.txt
```

- `-r`: ordine inverso;
- `-n`: ordinamento numerico.

`uniq` individua righe duplicate adiacenti. Per questo spesso si combina con `sort`:

```bash
sort nomi.txt | uniq
sort nomi.txt | uniq -c
sort nomi.txt | uniq -c | sort -nr
```

L'ultimo esempio conta le occorrenze e ordina i conteggi dal più alto al più basso.

Esempio di contenuto di `nomi.txt`:

```text
Luca
Anna
Luca
Marco
Anna
Luca
```

Comando:

```bash
sort nomi.txt | uniq -c | sort -nr
```

Risultato indicativo:

```text
3 Luca
2 Anna
1 Marco
```

## 12. Pipe e redirezione

La pipe `|` passa l'output di un comando come input al successivo.

```bash
ps aux | less
```

La redirezione `>` scrive l'output in un file, sovrascrivendolo:

```bash
ls -lah > elenco.txt
```

La redirezione `>>` aggiunge in fondo:

```bash
date >> registro.txt
```

Per salvare anche gli errori:

```bash
comando > risultato.txt 2> errori.txt
comando > completo.txt 2>&1
```

Non usare `>` su file importanti senza averne verificato la destinazione: può azzerarne il contenuto.

## 13. Privilegi amministrativi – sudo

`sudo` esegue un comando con privilegi elevati, se l'utente è autorizzato.

```bash
sudo apt update
sudo systemctl status ssh
```

Non significa che ogni comando debba essere eseguito con `sudo`. Usare privilegi elevati solo quando sono necessari e comprendere sempre l'effetto dell'operazione.

## 14. Aiuto e codici di uscita

```bash
man ls
ls --help
echo $?
```

`$?` contiene il codice di uscita dell'ultimo comando:
- `0`: esecuzione conclusa con successo, secondo le regole del programma;
- diverso da `0`: è stato segnalato un errore o una condizione particolare.

## 15. Esercizi

1. Mostrare la directory corrente.
2. Creare `corso_bash/esempi` in un solo comando.
3. Creare tre file vuoti nella directory `esempi`.
4. Elencare anche i file nascosti in formato dettagliato.
5. Cercare la parola `ERROR` in un file di log mostrando i numeri di riga.
6. Ordinare un file di nomi e contare le occorrenze.
7. Salvare l'elenco dei file in `elenco.txt` senza mostrarlo sul terminale.
8. Spiegare la differenza tra `>` e `>>`.

### Soluzioni

```bash
pwd
mkdir -p corso_bash/esempi
touch corso_bash/esempi/file1.txt corso_bash/esempi/file2.txt corso_bash/esempi/file3.txt
ls -lah
grep -n "ERROR" system.log
sort nomi.txt | uniq -c
ls -lah > elenco.txt
```

`>` sovrascrive il file di destinazione; `>>` aggiunge il testo in fondo.
