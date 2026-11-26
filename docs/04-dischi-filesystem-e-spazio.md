# 04 – Dischi, filesystem e spazio disponibile

## 1. Concetti fondamentali

Un disco è un dispositivo di archiviazione. Una partizione è una suddivisione logica del dispositivo. Un filesystem organizza file e directory all'interno di una partizione o di un volume. Un punto di mount è la directory attraverso cui il filesystem viene reso accessibile.

Prima di intervenire su un disco bisogna identificare con precisione dispositivo, partizioni, filesystem e punti di mount.

## 2. Spazio dei filesystem montati – df

`df` significa *disk free*. Mostra lo spazio utilizzato e disponibile nei filesystem montati.

```bash
df -h
df -h /
df -T
```

- `-h`: dimensioni leggibili;
- `/`: limita la verifica al filesystem che contiene la directory radice;
- `-T`: include il tipo di filesystem.

Esempio: se `Use%` è al 95%, lo spazio disponibile è limitato. Prima di eliminare dati, identificare quali directory occupano spazio.

## 3. Dimensione di directory – du

`du` stima lo spazio occupato da file e directory.

```bash
du -sh ~/Downloads
du -h --max-depth=1 ~
sudo du -xhd1 /var
```

- `-s`: totale sintetico;
- `-h`: formato leggibile;
- `--max-depth=1`: mostra un livello di directory;
- `-x`: resta nello stesso filesystem;
- `-d1`: profondità pari a un livello.

Per ordinare le directory più grandi:

```bash
du -h --max-depth=1 ~ | sort -h
du -h --max-depth=1 ~ | sort -hr
```

Il secondo esempio mette in alto i valori più grandi. L'accesso a directory di sistema può richiedere `sudo`.

## 4. Identificare dischi e partizioni – lsblk

`lsblk` elenca dispositivi a blocchi e relazioni tra dischi, partizioni e mount point.

```bash
lsblk
lsblk -f
lsblk -o NAME,SIZE,TYPE,FSTYPE,MOUNTPOINTS
```

Non confondere il nome del dispositivo con il punto di mount. Un dispositivo come `/dev/sda` può contenere più partizioni, per esempio `/dev/sda1`.

## 5. Spazio occupato da inode – df -i

Oltre ai byte, i filesystem gestiscono inode, strutture che rappresentano i metadati dei file.

```bash
df -i
```

Un filesystem può esaurire gli inode anche se mostra ancora spazio in byte. È possibile incontrare questo problema quando esistono moltissimi file piccoli.

## 6. Verificare i mount – findmnt

```bash
findmnt
findmnt /
findmnt -T /var/log
```

Questo permette di capire quale filesystem contiene un determinato percorso.

## 7. Controlli di integrità: attenzione a fsck

`fsck` è una famiglia di strumenti per verificare e, in alcuni casi, riparare filesystem. Non deve essere eseguito indiscriminatamente su una partizione montata in uso. Il comando e le opzioni dipendono dal tipo di filesystem.

Prima di un laboratorio su `fsck`:
1. identificare il dispositivo con `lsblk -f`;
2. consultare il manuale specifico;
3. effettuare un backup;
4. lavorare su una VM o su un disco di prova;
5. assicurarsi che la partizione sia smontata quando richiesto.

Non eseguire `fsck` su `/` montato come normale esercizio.

## 8. Laboratorio di sola lettura

Eseguire:

```bash
df -h
df -T
df -i
lsblk -f
findmnt
du -h --max-depth=1 ~ | sort -hr
```

Rispondere:
- Quale filesystem contiene la directory radice?
- Quanto spazio è disponibile?
- Quali directory della home occupano più spazio?
- Quali dispositivi e partizioni sono presenti?
- Qual è la differenza tra spazio in byte e inode?

## 9. Regola importante

Non cancellare file di sistema solo perché sembrano grandi. Prima identificare il file, il programma che lo usa e la funzione che svolge. Le operazioni di riparazione e formattazione saranno trattate in un laboratorio separato, con dispositivi virtuali usa-e-getta.
