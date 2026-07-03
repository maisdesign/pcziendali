# Troubleshooting

Problemi comuni raccolti dai README di Marco e Giulio.

## Generali

### Windows Home invece di Pro
Docker/Hyper-V non si possono abilitare su Windows Home. Verifica in **Impostazioni → Sistema → Informazioni** che l'edizione sia Pro; se serve, effettua l'upgrade prima di procedere.

### La licenza Windows non risulta attivata
Assicurati di aver effettuato l'accesso con il **Microsoft Account aziendale** durante il setup, non con un account locale.

### Mancano driver dopo l'installazione
Esegui prima **Windows Update** per intero (anche più cicli, finché non compaiono più aggiornamenti): molti driver di base (audio, rete) vengono forniti da lì prima ancora dei pacchetti dedicati in `drivers/`.

---

## PC Marco (Dev Workstation)

### Docker non funziona
- Controlla: **Impostazioni → App → Funzionalità facoltative di Windows → Hyper-V** deve essere attivo
- Se non disponibile: disabilita/riabilita Hyper-V e riavvia

### Driver GPU non caricati
- Apri Device Manager (`devmgmt.msc`)
- Cerca "Unknown device" o "AMD Radeon" con l'icona di avviso ⚠️
- Click destro → Aggiorna driver → Sfoglia → `Marco/drivers/gpu/`

### Aggiornamento BIOS Gigabyte B550M (solo se necessario)
- Scarica il BIOS più recente da gigabyte.com (pagina B550M AORUS Elite AX)
- Crea una chiavetta USB FAT32, estrai il file BIOS e rinominalo `GIGABYTE.BIN`
- Entra nel BIOS (F2 al boot) → Q-Flash → seleziona il file

---

## PC Giulio (Design Workstation)

### Driver NVIDIA non installato
- Apri Device Manager (`devmgmt.msc`) e verifica che compaia "NVIDIA GeForce RTX 5060"
- Se compare come "Unknown device": click destro → Aggiorna driver, usando il pacchetto WHQL scaricato da nvidia.com

### Driver chipset AMD mancante
- La scheda Gigabyte B650 richiede il driver chipset AM5
- **Va installato prima del driver NVIDIA** — se invertito l'ordine può causare crash della GPU
- Scarica da gigabyte.com (pagina B650E Eagle AX)

### Adobe Creative Cloud non si avvia
- Verifica di aver effettuato il login con un account aziendale valido
- Prova: Adobe → Preferences → Logout, poi Login
- Se persiste: disinstalla e reinstalla Creative Cloud

### Figma lento
- Attiva l'accelerazione hardware: Figma → Settings → General → Hardware acceleration (ON)
- Verifica che il pannello di controllo NVIDIA sia installato

### WiFi lento dopo l'installazione
- Aggiorna il driver WiFi da Device Manager → Network adapters, oppure scaricalo da gigabyte.com
