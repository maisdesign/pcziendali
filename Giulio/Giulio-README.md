# PC GIULIO - Setup Guide

## Hardware
- **Motherboard:** Gigabyte B650 Eagle AX
- **CPU:** AMD Ryzen 5 9600X (integrata Radeon)
- **GPU:** NVIDIA GeForce RTX 5060 Windforce OC 8GB
- **RAM:** Corsair Vengeance DDR5 32GB 6000 CL36
- **SSD:** Acer Predator GM7
- **PSU:** ThermalTake 850W
- **Cooler:** Thermalright PA120 SE ARGB
- **Case:** be quiet! Pure Base 501 Airflow
- **Tastiera:** (non specificata - installa driver se necessario)

## Software
✓ 7-zip, Chrome, Dolt, Filezilla, Git, GitHub CLI, McAfee, Microsoft 365, Node.js, Notepad++, WizTree, WP Local, Adobe Suite, Figma, Photopea, Claude, Codex

---

## Fase 1: Preparazione Hardware (Prima dell'installazione)

### 1.1 Scarica i driver
```
drivers/
├── chipset/          (Gigabyte B650 Eagle AX)
├── gpu/              (NVIDIA RTX 5060 - WHQL)
├── audio/            (Realtek)
├── ethernet/         (Realtek)
├── wifi/             (WiFi 6E)
├── chipset_amd/      (AMD AM5 chipset)
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
# Chipset AMD (esegui per primo - necessario per GPU)
.\drivers\chipset_amd\[amd-driver].exe

# Chipset Gigabyte
.\drivers\chipset\[driver-installer].exe

# GPU NVIDIA (scarica driver WHQL più recenti da nvidia.com)
.\drivers\gpu\[nvidia-installer].exe

# Audio
.\drivers\audio\[audio-installer].exe

# Ethernet/WiFi
.\drivers\ethernet\[driver].exe
.\drivers\wifi\[driver].exe
```

**IMPORTANTE:** L'ordine è critico. Fai i driver AMD chipset prima di NVIDIA.

### 2.3 Aggiornamenti Windows
1. Windows Update → Cerca aggiornamenti (potrebbero volerci 30-60 min)
2. Riavvia se richiesto
3. Ricontrollare Windows Update finché non ci sono più aggiornamenti

---

## Fase 3: Installazione Software (2-3 ore)

### 3.1 Esegui lo script automatico

Apri **PowerShell come Administrator**:

```powershell
# Abilita esecuzione script
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope CurrentUser

# Naviga alla cartella dello script
cd C:\path\to\Giulio-install.ps1

# Esegui
.\Giulio-install.ps1
```

Lo script installerà automaticamente:
- 7-zip, Git, GitHub CLI, Chrome
- FileZilla, Notepad++, WizTree
- Node.js, Adobe Creative Cloud, Figma

**Nota:** Adobe Suite richiede account aziendale durante installazione.

### 3.2 Installazione manuale

**Claude** (Desktop App)
- https://claude.ai → Download desktop app
- Accedi con il tuo account

**Codex**
- https://github.com/Codex-Nexus/codex
- Oppure scarica installer

**Dolt 1.86.6**
- https://github.com/dolthub/dolt/releases/tag/v1.86.6
- Scarica Windows installer (.msi)

**WP Local**
- https://localwp.com/
- Scarica installer Windows

**McAfee (Aziendale)**
- Scarica dal portale aziendale
- Installa con credenziali aziendali

**Microsoft 365**
- https://www.office.com → Account aziendale
- Installa da portale oppure installer offline

**Adobe Suite**
Lo script installa Creative Cloud, ma:
1. Apri **Adobe Creative Cloud**
2. Accedi con account aziendale
3. Scarica/aggiorna le app necessarie:
   - Photoshop
   - Illustrator
   - Lightroom
   - Premiere Pro / After Effects (se necessari)
   - Altre app secondo necessità

**Photopea** (Editor online - alternativa a Photoshop)
- https://www.photopea.com
- No installazione, accedi dal browser
- Crea shortcut: Salva link desktop come scorciatoia

---

## Fase 4: Configurazione Post-installazione (30 min)

### 4.1 Git
```powershell
git config --global user.name "Giulio"
git config --global user.email "giulio@example.com"
git config --global core.editor "code"
```

### 4.2 GitHub CLI
```powershell
gh auth login
# Seleziona: GitHub.com → HTTPS → Y per credenziali git
# Segui le istruzioni per autenticarti
```

### 4.3 NVIDIA Driver Update (consigliato)
Per avere i driver più recenti per RTX 5060:
1. Vai a https://www.nvidia.com/Download/driverDetails.aspx
2. Seleziona: Product: GeForce RTX 5060 → OS: Windows 11 → Lingua
3. Scarica il driver WHQL più recente
4. Esegui installer e segui istruzioni

### 4.4 Configura Figma
1. Crea account https://figma.com (o usa account aziendale)
2. Apri Figma app
3. Accedi
4. Installa plugin comuni:
   - Color Palette
   - Unsplash
   - Figma to HTML

### 4.5 Adobe Suite Setup
Dopo aver scaricato le app:
1. Apri Photoshop
2. File → Preferenze → Sincronizzazione
3. Abilita cloud sync per risorse
4. Sync Adobe libraries se necessari

---

## Troubleshooting

### NVIDIA Driver non installato
- Apri Device Manager (devmgmt.msc)
- Cerca "NVIDIA GeForce RTX 5060" (dovrebbe esserci)
- Se c'è "Unknown device": Click destro → Aggiorna driver
- Scarica il driver WHQL corretto da nvidia.com

### AMD Chipset driver mancante
- Gigabyte B650 richiede AMD AM5 chipset driver
- Scarica da: https://www.gigabyte.com/Motherboard/B650E-EAGLE-AX-rev-1x
- Installa PRIMA del driver NVIDIA

### Adobe Creative Cloud non avvia
- Assicurati di aver fatto login con account valido
- Prova: Adobe → Preferences → Logout, poi Login
- Se persiste: Disinstalla/reinstalla Adobe Creative Cloud

### Figma lento
- Assicurati GPU NVIDIA sia abilitata:
  - Figma settings → General → Hardware acceleration (ON)
- Verifica che NVIDIA Control Panel sia installato

### WiFi lento dopo installazione
- Aggiorna driver WiFi (Realtek):
  - Device Manager → Network adapters
  - Cerca il modello WiFi → Aggiorna driver
- Oppure scarica driver più recente da Gigabyte

---

## Performance Tips

### Per Photoshop/Adobe
```
Preferences → Performance:
- RAM allocation: 80-90% (max, circa 28GB su 32GB)
- Cache levels: 4
- Scratch disk: SSD veloce (l'NVMe Acer)
```

### Per Figma
- Abilita GPU acceleration
- Chiudi tab non utilizzati
- Prova modalità scura (meno consumo GPU)

### Per il sistema in generale
- Disabilita animazioni inutili: Impostazioni → Accesso facilitato → Schermo
- Usa SSD per scratch disk di Adobe (al posto di HDD)
- Monitora temperatura GPU: https://www.techpowerup.com/gpuz/ (RTX 5060 dovrebbe stare sotto 75°C)

---

## Checklist Finale

- [ ] Windows 11 Pro installato
- [ ] Tutti i driver AMD installati (chipset)
- [ ] NVIDIA RTX 5060 driver installato
- [ ] Tutti gli altri driver installati
- [ ] Windows Update completato
- [ ] Software automatici installati
- [ ] Software manuali installati
- [ ] Adobe Suite scaricato e funzionante
- [ ] Git configurato
- [ ] GitHub CLI autenticato
- [ ] Figma funzionante

**Tempo totale stimato:** 4-5 ore

