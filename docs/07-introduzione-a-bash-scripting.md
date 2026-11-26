# 07 – Introduzione alla programmazione Bash

## 1. Che cos'è uno script Bash

Uno script Bash è un file di testo che contiene una sequenza di comandi interpretati dalla shell Bash. Serve ad automatizzare attività ripetitive, organizzare controlli e ridurre gli errori dovuti all'esecuzione manuale.

Uno script non rende automaticamente sicuro un comando: se contiene un'operazione errata, può ripeterla rapidamente. Per questo è importante progettare controlli e conferme.

## 2. Shebang e primo script

La prima riga indica quale interprete utilizzare:

```bash
#!/usr/bin/env bash
```

Creare il file:

```bash
nano saluto.sh
```

Inserire:

```bash
#!/usr/bin/env bash

echo "Benvenuto nel corso Bash"
echo "Utente corrente: $(whoami)"
echo "Directory corrente: $(pwd)"
```

Eseguire senza modificare i permessi:

```bash
bash saluto.sh
```

In alternativa, dopo aver controllato il contenuto, renderlo eseguibile:

```bash
chmod u+x saluto.sh
./saluto.sh
```

## 3. Variabili

Una variabile memorizza un valore che può essere riutilizzato.

```bash
nome="Moussa"
corso="Kali Linux"
echo "Docente: $nome"
echo "Corso: $corso"
```

Non inserire spazi intorno a `=`. Le virgolette doppie permettono l'espansione delle variabili:

```bash
directory="$HOME/Documenti"
echo "$directory"
```

## 4. Input dell'utente – read

```bash
#!/usr/bin/env bash

read -r -p "Come ti chiami? " nome
printf 'Ciao, %s!\n' "$nome"
```

`read -r` legge l'input senza interpretare i backslash. `-p` mostra il messaggio di richiesta.

## 5. Condizioni – if

Le condizioni permettono di eseguire istruzioni differenti in base a un risultato.

```bash
#!/usr/bin/env bash

read -r -p "Inserisci un numero: " numero

if [[ "$numero" =~ ^[0-9]+$ ]]; then
    echo "Hai inserito un numero intero non negativo."
else
    echo "Input non valido."
fi
```

La regex `^[0-9]+$` verifica che l'intero input sia composto da una o più cifre. La validazione evita di trattare testo arbitrario come numero.

Controllo di esistenza:

```bash
file="appunti.txt"

if [[ -f "$file" ]]; then
    echo "Il file esiste."
else
    echo "Il file non esiste."
fi
```

- `-f`: esiste ed è un file regolare;
- `-d`: esiste ed è una directory;
- `-r`: è leggibile dall'utente;
- `-w`: è scrivibile dall'utente.

## 6. Cicli – for e while

Un ciclo `for` ripete un blocco per ogni elemento:

```bash
for nome in Anna Luca Marco; do
    echo "Studente: $nome"
done
```

Un ciclo `while` ripete finché la condizione resta vera:

```bash
contatore=1

while [[ "$contatore" -le 3 ]]; do
    echo "Esecuzione $contatore"
    ((contatore++))
done
```

## 7. Funzioni

Le funzioni raggruppano istruzioni riutilizzabili:

```bash
mostra_data() {
    echo "Data e ora:"
    date
}

mostra_data
```

Una funzione aiuta a evitare duplicazioni e rende il programma più leggibile.

## 8. Codici di uscita e gestione errori

Ogni comando restituisce un codice di uscita. Per convenzione, zero indica successo e un valore diverso da zero segnala un problema o una condizione particolare.

```bash
if grep -q "ERROR" app.log; then
    echo "Trovati errori nel log."
else
    echo "Nessuna riga ERROR trovata."
fi
```

`-q` evita di stampare le righe e usa il codice di uscita per indicare se la ricerca ha trovato corrispondenze.

## 9. Menu con case

```bash
#!/usr/bin/env bash

echo "1) Mostra data"
echo "2) Mostra utente"
echo "0) Esci"
read -r -p "Scelta: " scelta

case "$scelta" in
    1) date ;;
    2) whoami ;;
    0) echo "Arrivederci." ;;
    *) echo "Scelta non valida." ;;
esac
```

`case` è utile per menu numerici perché rende esplicite le alternative.

## 10. Esercizi

1. Creare uno script che mostra utente, data e directory corrente.
2. Chiedere il nome e salutare l'utente.
3. Chiedere un percorso e verificare se è una directory.
4. Stampare i numeri da 1 a 5 con un ciclo.
5. Creare una funzione che mostra la versione del kernel.
6. Creare un menu con due controlli informativi e un'opzione di uscita.

Non inserire nei primi esercizi comandi che eliminano file, modificano partizioni o arrestano servizi.
