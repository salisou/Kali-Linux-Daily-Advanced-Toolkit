# 03 – Rete e diagnostica della connettività

## 1. Obiettivo

La diagnostica di rete consiste nel verificare, in modo ordinato, se il sistema possiede un'interfaccia attiva, un indirizzo IP, una route predefinita, accesso a un host remoto e risoluzione DNS.

Non tutti i problemi di rete sono uguali: un'interfaccia senza indirizzo IP è un problema diverso da un DNS non funzionante.

## 2. Visualizzare le interfacce – ip

`ip` è lo strumento moderno per visualizzare e gestire interfacce, indirizzi e routing.

```bash
ip addr
ip -br addr
ip link
```

- `ip addr`: mostra interfacce e indirizzi;
- `ip -br addr`: formato sintetico;
- `ip link`: mostra lo stato dei collegamenti.

Esempio: se un'interfaccia mostra `UP` ma non possiede un indirizzo IPv4, il collegamento può essere attivo senza che sia stata completata la configurazione IP.

Per osservare soltanto le route:

```bash
ip route
```

La riga `default via ...` indica la route predefinita, cioè il percorso usato per destinazioni non coperte da route più specifiche.

## 3. Verificare la raggiungibilità – ping

`ping` invia richieste ICMP Echo Request e attende le risposte.

```bash
ping -c 4 1.1.1.1
ping -c 4 8.8.8.8
ping -c 4 google.com
```

- `-c 4`: invia quattro richieste e poi termina;
- un indirizzo IP permette di testare la raggiungibilità senza dipendere dal DNS;
- un nome host verifica anche la risoluzione DNS.

Interpretazione:
- risposta: il destinatario o un dispositivo intermedio ha risposto;
- `Destination Host Unreachable`: il sistema o un router segnala che la destinazione non è raggiungibile;
- `100% packet loss`: nessuna risposta ricevuta, ma non dimostra da solo che Internet sia assente: ICMP potrebbe essere filtrato.

## 4. Verificare DNS – getent e nslookup

Il DNS traduce nomi come `kali.org` in indirizzi IP.

```bash
getent hosts kali.org
nslookup kali.org
```

`getent` usa il sistema di risoluzione configurato sul sistema. `nslookup` interroga il servizio DNS.

Se il ping verso un IP funziona ma quello verso un nome non funziona, è opportuno indagare la risoluzione DNS. Non è una prova assoluta: possono esserci anche filtri o problemi specifici del servizio.

Se `nslookup` non è installato, il pacchetto che lo fornisce è normalmente `dnsutils`:

```bash
sudo apt install dnsutils
```

## 5. Tracciare il percorso – traceroute

`traceroute` prova a mostrare i router attraversati dai pacchetti verso una destinazione.

```bash
traceroute kali.org
```

Se il comando non è disponibile:

```bash
sudo apt install traceroute
```

Alcuni router non rispondono ai pacchetti usati dal traceroute. Gli asterischi non indicano necessariamente un guasto.

## 6. Consultare socket e porte – ss

`ss` mostra socket e connessioni di rete.

```bash
ss -tuln
ss -tun
ss -lnt
```

- `-t`: TCP;
- `-u`: UDP;
- `-l`: socket in ascolto;
- `-n`: mostra numeri invece di risolvere nomi di servizio.

Esempio: `ss -lnt` permette di vedere le porte TCP in ascolto. Una porta in ascolto non significa automaticamente che sia accessibile dall'esterno: firewall, indirizzo di bind e rete influenzano l'accessibilità.

## 7. Informazioni sul percorso e sul DNS

```bash
ip route
cat /etc/resolv.conf
hostname -I
```

`/etc/resolv.conf` può essere gestito automaticamente da NetworkManager, systemd-resolved o altri componenti. Non modificarlo senza aver capito chi lo gestisce.

## 8. Procedura diagnostica ordinata

Quando una pagina web non si apre, seguire questa sequenza:

```bash
ip -br addr
ip route
ping -c 4 1.1.1.1
getent hosts kali.org
ping -c 4 kali.org
```

1. L'interfaccia ha un indirizzo?
2. Esiste una route predefinita?
3. Un IP pubblico risponde?
4. Il nome viene risolto?
5. Il nome risolto è raggiungibile?

Annotare i risultati prima di cambiare configurazioni.

## 9. Laboratorio autorizzato

Usare esclusivamente la propria macchina e destinazioni pubbliche che consentono test di connettività. Non effettuare scansioni di reti di terzi.

Esercizi:
1. Identificare il nome dell'interfaccia attiva.
2. Visualizzare l'indirizzo IP.
3. Individuare la route predefinita.
4. Eseguire quattro ping verso un IP.
5. Risolvere il nome `kali.org`.
6. Elencare le porte TCP in ascolto.
7. Spiegare perché il mancato ping non prova da solo l'assenza di connettività.

## 10. Nota su Kali in WSL2

In WSL2 la rete è virtualizzata e può essere gestita da Windows. L'output di interfacce, route, DNS e servizi può differire da una macchina Kali installata direttamente o in VM. Indicare sempre l'ambiente in cui è stata eseguita la prova.
