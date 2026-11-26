# 08 – Progetto finale: Daily Advanced Toolkit per Kali Linux

## 1. Obiettivo del progetto

Realizzare un programma Bash interattivo che raccolga in un unico menu le principali verifiche di manutenzione e diagnostica di Kali Linux.

Il progetto didattico sarà sviluppato in piccoli incrementi: prima il menu, poi i controlli informativi, quindi i moduli di rete, archiviazione, processi e manutenzione. Le operazioni che modificano il sistema saranno aggiunte solo dopo aver progettato conferme, controlli dei privilegi e gestione degli errori.

## 2. Requisiti funzionali

Il toolkit dovrà offrire voci distinte:

1. Informazioni generali sul sistema.
2. CPU e memoria.
3. Spazio disco e filesystem.
4. Interfacce e configurazione di rete.
5. Test di connettività.
6. Processi e servizi.
7. Consultazione dei log.
8. Aggiornamento pacchetti (fase successiva, con riepilogo e conferma).
9. Pulizia pacchetti (fase successiva, con riepilogo e conferma).
0. Uscita.

## 3. Requisiti di qualità

- Menu chiaro e navigabile.
- Funzioni separate per ogni attività.
- Controllo della presenza dei comandi esterni.
- Messaggi di errore comprensibili.
- Nessuna operazione distruttiva eseguita automaticamente.
- Nessuna password o credenziale salvata nei log.
- Compatibilità dichiarata: Kali installato, VM o WSL2.
- Codice commentato e semplice da estendere.

## 4. Regole di sicurezza del progetto

Il menu iniziale deve essere di sola lettura. Per le azioni che modificano il sistema:
- mostrare esattamente cosa verrà eseguito;
- richiedere una conferma esplicita;
- controllare che l'utente abbia i privilegi necessari;
- non usare conferme automatiche come `-y` durante la fase didattica;
- gestire gli errori e registrare solo informazioni non sensibili;
- offrire istruzioni per interrompere o ripristinare quando possibile.

## 5. Architettura suggerita

```text
scripts/
├── diagnostica/
│   └── info_sistema.sh
└── toolkit/
    ├── daily_toolkit.sh
    └── modules/
        ├── sistema.sh
        ├── rete.sh
        ├── storage.sh
        ├── processi.sh
        └── pacchetti.sh
```

Per mantenere il progetto semplice, si può iniziare con un singolo file e separarlo in moduli quando le funzioni aumentano.

## 6. Roadmap

### Fase 1 – Menu e navigazione
- stampa del titolo;
- opzioni numeriche;
- ciclo che mantiene il menu attivo;
- uscita pulita.

### Fase 2 – Diagnostica non invasiva
- informazioni sistema;
- memoria e CPU;
- spazio disco;
- rete;
- processi e servizi.

### Fase 3 – Report
- data e ora;
- riepilogo dei controlli;
- salvataggio facoltativo in un file scelto dall'utente;
- protezione dei dati sensibili.

### Fase 4 – Manutenzione assistita
- controllo aggiornamenti;
- visualizzazione del piano APT;
- conferma manuale;
- gestione degli errori.

### Fase 5 – Test e documentazione
- test in VM;
- verifica su installazione pulita;
- verifica dei comandi mancanti;
- revisione delle autorizzazioni;
- documentazione per studenti.

## 7. Criteri di completamento

Il progetto è completato quando ogni voce del menu:
- ha una spiegazione didattica;
- funziona in un ambiente di test supportato;
- gestisce l'assenza dei comandi necessari;
- mostra un risultato interpretabile;
- non esegue modifiche non dichiarate;
- è coperta da almeno un test pratico.
