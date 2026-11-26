# Kali Linux – Daily Advanced Toolkit

Percorso didattico pratico per imparare ad amministrare, mantenere, diagnosticare e proteggere un sistema Kali Linux. Il corso parte dalle basi del terminale e conduce alla progettazione di un toolkit interattivo scritto in Bash.

> **Autore e docente:** Docente Moussa Salisou  
> **Sistema di riferimento:** Kali Linux (installazione nativa o macchina virtuale). Alcuni laboratori possono essere adattati a Kali su WSL2, quando le funzionalità del sistema lo consentono.

## Obiettivi formativi

Al termine del percorso lo studente sarà in grado di:

- usare il terminale Bash e interpretare i comandi Linux;
- leggere informazioni su sistema, hardware, rete, dischi, processi e servizi;
- aggiornare Kali e gestire pacchetti in modo consapevole;
- eseguire controlli diagnostici senza modificare inutilmente il sistema;
- riconoscere i comandi che richiedono privilegi amministrativi;
- creare script Bash leggibili, controllati e riutilizzabili;
- sviluppare un toolkit con menu, controlli, log e conferme per le operazioni delicate.

## Metodo didattico

Ogni argomento segue una struttura costante:

1. **Che cos'è:** definizione del comando o del componente.
2. **A cosa serve:** problema pratico che permette di affrontare.
3. **Perché si usa:** motivazione e contesto operativo.
4. **Sintassi:** struttura generale e parametri.
5. **Esecuzione guidata:** comando spiegato elemento per elemento.
6. **Esempi:** casi semplici, intermedi e realistici.
7. **Output:** risultato atteso e interpretazione.
8. **Attenzione:** privilegi, limiti, rischi e precauzioni.
9. **Esercizi:** attività da svolgere e verificare.

Non copiare comandi senza averne compreso l'effetto. Prima di eseguire operazioni che modificano il sistema, leggere la spiegazione e creare, se si lavora in VM, uno snapshot.

## Programma del corso

| Modulo | Argomento | Risultato |
|---|---|---|
| 00 | Percorso e preparazione del laboratorio | Ambiente di studio pronto |
| 01 | Terminale Linux e Bash | Uso consapevole dei comandi |
| 02 | Aggiornamento e gestione pacchetti | Manutenzione di APT |
| 03 | Rete e connettività | Diagnostica di rete |
| 04 | Dischi, filesystem e spazio | Controlli di archiviazione |
| 05 | Processi, servizi e avvio | Analisi dei componenti attivi |
| 06 | Sicurezza e manutenzione responsabile | Controlli di base |
| 07 | Script Bash | Automazione controllata |
| 08 | Daily Advanced Toolkit | Progetto finale integrato |

## Struttura del repository

```text
Kali-Linux-Daily-Advanced-Toolkit/
├── README.md
├── CONTRIBUTING.md
├── .gitignore
├── docs/
│   ├── 00-percorso-e-laboratorio.md
│   ├── 01-fondamenti-terminal-bash.md
│   ├── 02-aggiornamento-e-pacchetti.md
│   ├── 03-rete-e-diagnostica.md
│   ├── 04-dischi-filesystem-e-spazio.md
│   ├── 05-processi-servizi-e-avvio.md
│   └── 06-sicurezza-e-buone-pratiche.md
├── scripts/
│   └── diagnostica/
│       └── info_sistema.sh
├── exercises/
│   └── README.md
├── labs/
│   └── README.md
└── solutions/
    └── README.md
```

## Avvio rapido

Aprire il terminale e verificare l'ambiente:

```bash
whoami
pwd
cat /etc/os-release
uname -a
```

Per leggere il primo modulo:

```bash
less docs/01-fondamenti-terminal-bash.md
```

Per eseguire lo script dimostrativo dopo averlo esaminato:

```bash
bash scripts/diagnostica/info_sistema.sh
```

Lo script iniziale è di sola lettura: raccoglie informazioni e non installa pacchetti né modifica configurazioni.

## Requisiti

- Kali Linux aggiornato, preferibilmente in macchina virtuale per i laboratori;
- account utente con accesso a `sudo` per gli esercizi amministrativi;
- terminale Bash;
- connessione Internet per gli argomenti relativi ai repository e agli aggiornamenti;
- snapshot o backup prima delle attività che modificano il sistema.

## Sicurezza e uso responsabile

Questo repository è destinato alla formazione, all'amministrazione dei propri sistemi e a laboratori autorizzati. Le attività di rete devono essere svolte esclusivamente su dispositivi, reti e ambienti per i quali si dispone di autorizzazione.

I comandi di diagnostica sono distinti da quelli di modifica. Operazioni come aggiornamento completo, rimozione di pacchetti, modifica del firewall, smontaggio di filesystem e riparazione dei dischi saranno introdotte solo dopo averne spiegato gli effetti e le precauzioni.

## Stato del progetto

Il corso viene sviluppato progressivamente. I moduli e gli script saranno ampliati con ulteriori esempi, output commentati, esercizi e soluzioni.

## Riferimenti ufficiali

- [Documentazione ufficiale Kali Linux](https://www.kali.org/docs/)
- [Kali Linux – gestione dei repository](https://www.kali.org/docs/general-use/kali-linux-sources-list-repositories/)
- [GNU Bash Reference Manual](https://www.gnu.org/software/bash/manual/)
- [Manual pages Linux](https://man7.org/linux/man-pages/)

---

© 2026 – Tutti i diritti riservati – Docente Moussa Salisou
