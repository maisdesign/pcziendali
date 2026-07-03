# PC MARCO - Setup Guide

## Hardware
- **Motherboard:** Gigabyte B550M AORUS Elite AX
- **CPU:** AMD Ryzen 5 5600G (integrata Radeon)
- **RAM:** Corsair Vengeance LPX 32GB DDR4-3200
- **SSD:** Acer Predator GM7
- **PSU:** ThermalTake 750W
- **Case:** be quiet! Pure Base 501 Airflow
- **Tastiera:** Logitech G213 Prodigy

## Software
✓ 7-zip, Chrome, Docker Desktop, Dolt, Filezilla, Git, GitHub CLI, Google Cloud SDK, Herd, iSpring Free 8, McAfee, Microsoft 365, Myinstants App, Node.js, Notepad++, Postman, SourceTree, VSCode, WizTree, WP Local, Spring Tools Eclipse, Antigravity IDE, Claude, Codex

---

## Fase 1: Preparazione Hardware (Prima dell'installazione)

### 1.1 Scarica i driver
```
drivers/
├── chipset/          (Gigabyte B550M AORUS Elite AX)
├── gpu/              (AMD Radeon integrata - 5600G)
├── audio/            (Realtek)
├── ethernet/         (Intel/Realtek)
├── wifi/             (Intel WiFi 6)
└── bios/             (BIOS update - opzionale)
```

### 1.2 Preparazione USB
1. Scarica **Windows 11 Pro ISO** da https://www.microsoft.com/en-us/software-download/windows11
2. Crea una **chiavetta USB avviabile** con:
   - Media Creation Tool (ufficiale Microsoft)
   - Oppure Rufus / Balena Etcher
3. Metti i **driver in una cartella** sulla chiavetta (o su un'altra chiavetta)

---

## Fase 2: Installazione Windows (1-2 ore)

### 2.1 Boot e installazione
1. Collega l'NVMe Acer al PC via USB-C (o adattatore USB)
2. Bootare da USB di Windows 11
3. Seleziona l'NVMe come destinazione
4. **Durante il setup**, collegarti con il tuo **Microsoft Account** (importante per la licenza)
5. Scegli Windows 11 **Pro** (non Home)

### 2.2 Post-installazione Windows
```powershell
# Apri PowerShell come Administrator e installa i driver
# Chipset (esegui per primo)
.\drivers\chipset\[driver-installer].exe

# GPU AMD
.\drivers\gpu\[amd-installer].exe

# Audio
.\drivers\audio\[audio-installer].exe

# Ethernet/WiFi
.\drivers\ethernet\[driver].exe
.\drivers\wifi\[driver].exe
```

### 2.3 Aggiornamenti Windows
1. Windows Update → Cerca aggiornamenti (potrebbero volerci 30-60 min)
2. Riavvia se richiesto
3. Ricontrollare Windows Update finché non ci sono più aggiornamenti

---

## Fase 3: Installazione Software (1-2 ore)

### 3.1 Esegui lo script automatico

Apri **PowerShell come Administrator**:

```powershell
# Abilita esecuzione script
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope CurrentUser

# Naviga alla cartella dello script
cd C:\path\to\Marco-install.ps1

# Esegui
.\Marco-install.ps1
```

Lo script installerà automaticamente:
- 7-zip, Git, GitHub CLI, Chrome, VSCode, Postman
- FileZilla, Notepad++, SourceTree, WizTree
- Docker Desktop, Node.js, Google Cloud SDK

**Nota:** Alcuni software richiedono installazione manuale (vedi sotto).

### 3.2 Installazione manuale

**Claude** (Desktop App)
- https://claude.ai → Download desktop app
- Accedi con il tuo account

**Codex**
- https://github.com/Codex-Nexus/codex
- Oppure tramite Visual Studio Code Extension

**Dolt 1.86.6**
- https://github.com/dolthub/dolt/releases/tag/v1.86.6
- Scarica Windows installer (.msi)

**Herd (Laravel)**
- https://herd.laravel.com/
- Scarica per Windows
- Durante setup, abilita il domain locale

**iSpring Free 8**
- https://www.ispringsolutions.com/ispring-presenter
- Installa come al solito

**WP Local**
- https://localwp.com/
- Scarica installer Windows

**Spring Tools Eclipse**
- https://spring.io/tools
- Scarica per Windows

**MyInstants App**
- https://www.myinstants.com/ → Crea shortcut desktop
- O scarica da Microsoft Store

**McAfee (Aziendale)**
- Scarica dal portale aziendale
- Installa con le credenziali aziendali

**Microsoft 365**
- https://www.office.com → Account aziendale
- Installa da portale oppure installer offline

---

## Fase 4: Configurazione Post-installazione (30 min)

### 4.1 Git
```powershell
git config --global user.name "Marco"
git config --global user.email "marco@example.com"
git config --global core.editor "code"
```

### 4.2 Docker (richiede riavvio)
```powershell
# Abilita Hyper-V
Enable-WindowsOptionalFeature -Online -FeatureName Hyper-V -All
```
Riavvia il PC quando richiesto.

### 4.3 NVM (Node Version Manager - opzionale)
Se vuoi gestire più versioni di Node.js:
- https://github.com/coreybutler/nvm-windows
- Installa nvm-windows
```powershell
nvm install 18.0.0
nvm use 18.0.0
```

### 4.4 GitHub CLI
```powershell
gh auth login
# Seleziona: GitHub.com → HTTPS → Y per credenziali git
# Segui le istruzioni per autenticarti
```

### 4.5 VSCode Extensions (opzionale)
Apri VSCode e installa:
- Docker
- REST Client
- Prettier
- ESLint
- GitLens

---

## Troubleshooting

### Docker non funziona
- Controlla: Impostazioni → Apps → App esecuzione e funzionalità → Hyper-V (deve essere ✓)
- Se non disponibile: Disabilita/abilita Hyper-V e riavvia

### Driver GPU non caricati
- Apri Device Manager (devmgmt.msc)
- Cerca "Unknown device" o "AMD Radeon" con ⚠️
- Click destro → Aggiorna driver → Sfoglia → drivers/gpu/

### Gigabyte B550M BIOS Update (se necessario)
- Scarica il BIOS più recente da: https://www.gigabyte.com/Motherboard/B550M-AORUS-ELITE-AX-rev-1x
- Crea una chiavetta USB FAT32
- Estrai il file BIOS e rinomina in `GIGABYTE.BIN`
- Entra in BIOS (F2 durante boot)
- Qualcomm → BIOS Flash → Seleziona file

---

## Checklist Finale

- [ ] Windows 11 Pro installato
- [ ] Tutti i driver installati
- [ ] Windows Update completato
- [ ] Software automatici installati
- [ ] Software manuali installati
- [ ] Git configurato
- [ ] Docker funzionante
- [ ] GitHub CLI autenticato
- [ ] VSCode Extensions installate

**Tempo totale stimato:** 3-4 ore

