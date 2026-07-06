# PC MARCO-CASA - Setup Guide

## Hardware
- **Motherboard:** ASRock B850 Steel Legend WiFi
- **CPU:** AMD Ryzen 7 9700X 8-Core
- **GPU integrata:** AMD Radeon Graphics (iGPU della CPU)
- **GPU dedicata:** AMD Radeon RX 9060 XT
- **Audio:** Realtek (integrato scheda madre)
- **Ethernet:** Realtek Gaming 2.5GbE
- **WiFi/Bluetooth:** MediaTek RZ717 WiFi 7
- **BIOS:** AMI, versione 3.30 rilevata (16/06/2025)

## Software
✓ 7-zip, Chrome, Docker Desktop, Dolt, Filezilla, Git, GitHub CLI, Google Cloud SDK, Herd, iSpring Free 8, McAfee, Microsoft 365, Myinstants App, Node.js, Notepad++, Postman, SourceTree, VSCode, WizTree, WP Local, Spring Tools Eclipse, Antigravity IDE, Claude, Codex

**Nota:** McAfee e Microsoft 365 qui sono licenze personali, non aziendali come su PC Marco (lavoro).

---

## Fase 1: Preparazione Hardware (Prima dell'installazione)

### 1.1 Scarica i driver
```
drivers/
├── chipset/          (AMD B850 - da asrock.com)
├── gpu/              (AMD Radeon iGPU + RX 9060 XT - driver unico da amd.com)
├── audio/            (Realtek - da asrock.com)
├── ethernet/         (Realtek 2.5GbE - da asrock.com)
├── wifi/             (MediaTek RZ717 WiFi 7 - da asrock.com)
└── bios/             (BIOS update - opzionale, solo se necessario)
```

Vedi `Marco-casa-drivers.csv` per i link diretti. Il sito ASRock ha una verifica
anti-bot (CAPTCHA): apri il link nel browser e scarica manualmente, non è
automatizzabile.

### 1.2 Preparazione USB
1. Scarica **Windows 11 Pro/Home ISO** da https://www.microsoft.com/it-it/software-download/windows11
2. Crea una **chiavetta USB avviabile** con:
   - Rufus (consigliato: permette di bypassare i requisiti TPM/account Microsoft se serve)
   - Oppure Media Creation Tool ufficiale Microsoft
3. Se usi una USB da 32GB+ per un'immagine di ~5-6GB, copia anche la cartella
   `drivers/` sullo spazio libero della stessa chiavetta (non serve una seconda USB)

---

## Fase 2: Installazione Windows (1-2 ore)

### 2.1 Boot e installazione
1. Bootare da USB di Windows 11
2. Seleziona l'SSD/NVMe come destinazione
3. **Durante il setup**, collegati con il tuo **Microsoft Account**
4. Scegli l'edizione desiderata (Pro se ti serve Hyper-V nativo; Docker Desktop
   funziona anche su Home tramite backend WSL2)

### 2.2 Post-installazione Windows
```powershell
# Apri PowerShell come Administrator e installa i driver
# Chipset (esegui per primo)
.\drivers\chipset\[driver-installer].exe

# GPU AMD (copre sia iGPU che RX 9060 XT)
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

Doppio click su **install-software.bat** (chiede i permessi di amministratore
e lancia lo script PowerShell), oppure manualmente:

```powershell
# Abilita esecuzione script
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope CurrentUser

# Naviga alla cartella dello script
cd C:\path\to\Marco-casa

# Esegui
.\install-software.ps1
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

**McAfee (personale)**
- Scarica dal tuo account McAfee personale

**Microsoft 365 (personale)**
- https://www.office.com → Account personale
- Installa da portale oppure installer offline

---

## Fase 4: Configurazione Post-installazione (30 min)

### 4.1 Git
```powershell
git config --global user.name "Marco"
git config --global user.email "marco@example.com"
git config --global core.editor "code"
```

### 4.2 Docker
Su Windows 11 Home, Docker Desktop usa il backend WSL2 (non serve Hyper-V/Pro):
```powershell
wsl --install
```
Su Windows 11 Pro, in alternativa puoi abilitare Hyper-V:
```powershell
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
- Su Home: verifica che WSL2 sia installato e aggiornato (`wsl --update`)
- Su Pro: controlla Impostazioni → Apps → App esecuzione e funzionalità → Hyper-V (deve essere ✓)

### Driver GPU non caricati
- Apri Device Manager (devmgmt.msc)
- Cerca "Unknown device" o "AMD Radeon" con ⚠️
- Click destro → Aggiorna driver → Sfoglia → drivers/gpu/

### ASRock B850 Steel Legend WiFi BIOS Update (se necessario)
- Scarica il BIOS più recente da: https://www.asrock.com/mb/AMD/B850%20Steel%20Legend%20WiFi/index.asp#BIOS
- Crea una chiavetta USB FAT32
- Estrai il file BIOS e rinomina secondo le istruzioni ASRock
- Entra in BIOS (F2 o Canc durante boot)
- Instant Flash → Seleziona file

---

## Checklist Finale

- [ ] Windows 11 installato
- [ ] Tutti i driver installati (chipset, GPU, audio, ethernet, wifi)
- [ ] Windows Update completato
- [ ] Software automatici installati
- [ ] Software manuali installati
- [ ] Git configurato
- [ ] Docker funzionante
- [ ] GitHub CLI autenticato
- [ ] VSCode Extensions installate

**Tempo totale stimato:** 3-4 ore
