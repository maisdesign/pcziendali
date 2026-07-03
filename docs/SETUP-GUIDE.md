# PC Ziendali - Setup Completo

Repository con script e guide per l'installazione rapida di due PC aziendali:
- **PC Marco**: Dev Workstation (AMD Ryzen 5 5600G)
- **PC Giulio**: Design Workstation (RTX 5060 + Ryzen 5 9600X)

---

## 📋 Struttura Repository

```
pcziendali/
├── Marco/
│   ├── Marco-README.md          (LEGGERE PRIMA)
│   ├── Marco-install.ps1        (Script automatico)
│   ├── Marco-drivers.csv        (Lista driver da scaricare)
│   └── drivers/                 (Cartella driver - popolare manualmente)
│       ├── chipset/
│       ├── gpu/
│       ├── audio/
│       └── ethernet/
│
├── Giulio/
│   ├── Giulio-README.md         (LEGGERE PRIMA)
│   ├── Giulio-install.ps1       (Script automatico)
│   ├── Giulio-drivers.csv       (Lista driver da scaricare)
│   └── drivers/                 (Cartella driver - popolare manualmente)
│       ├── chipset/
│       ├── gpu/
│       ├── audio/
│       └── ethernet/
│
└── docs/
    ├── QUICK-START.md           (Questa guida)
    └── TROUBLESHOOTING.md       (Problemi comuni)
```

---

## 🚀 Quick Start

### Fase 1: Preparazione (30 min)

1. **Clona il repository**
   ```bash
   git clone https://github.com/maisdesign/pcziendali.git
   cd pcziendali
   ```

2. **Scarica i driver necessari**
   - Apri `Marco/Marco-drivers.csv` (oppure `Giulio/Giulio-drivers.csv`)
   - Per ogni riga, visita il link e scarica il driver
   - Metti i file nella cartella `drivers/` corrispondente
   
   **Esempio per Marco:**
   ```
   Marco/drivers/
   ├── chipset/
   │   └── GigaByte_B550M_Chipset_Driver_*.exe
   ├── gpu/
   │   └── AMD_Radeon_GPU_Driver_*.exe
   ├── audio/
   │   └── Realtek_Audio_*.exe
   └── ethernet/
       └── Intel_LAN_*.exe
   ```

3. **Preparazione hardware**
   - Collega l'NVMe alla stazione di montaggio via USB
   - Verifica connessione USB funzionante

4. **Crea USB avviabile**
   - Scarica **Windows 11 Pro ISO**
   - Crea chiavetta USB con Media Creation Tool (Microsoft)
   - Verifica che il boot via USB funzioni

### Fase 2: Installazione Windows (2 ore)

1. **Avvia Windows Installer** dall'USB
2. **Seleziona l'NVMe** come destinazione
3. **Accedi con Microsoft Account** (importante per la licenza)
4. **Attendi il boot iniziale** (potrebbe volerci 10-15 min)

### Fase 3: Installazione Driver (30-45 min)

Apri **PowerShell come Administrator**:

```powershell
# Vai alla cartella driver
cd C:\path\to\pcziendali\Marco\drivers

# Installa i driver in ordine
cd chipset && .\[driver-exe] && cd ..
cd gpu && .\[driver-exe] && cd ..
cd audio && .\[driver-exe] && cd ..
cd ethernet && .\[driver-exe] && cd ..
```

**Nota per Giulio:** Installa AMD chipset PRIMA di NVIDIA!

### Fase 4: Windows Update (1-2 ore)

```powershell
# Cerca e installa tutti gli aggiornamenti
Impostazioni → Windows Update → Verifica aggiornamenti
# Riavvia quando richiesto
# Ricontrolla finché non ci sono altri aggiornamenti
```

### Fase 5: Software Automatico (30-45 min)

```powershell
# Abilita esecuzione script
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope CurrentUser

# Naviga alla cartella e esegui lo script
cd C:\path\to\pcziendali\Marco\
.\Marco-install.ps1

# Oppure per Giulio
.\Giulio-install.ps1
```

### Fase 6: Software Manuale (1-2 ore)

Leggi il README specifico (Marco-README.md o Giulio-README.md) per:
- Installazione Claude, Codex, Dolt
- Setup Adobe Creative Cloud (Giulio)
- Setup Herd, WP Local (Marco)
- Altre app specifiche

### Fase 7: Configurazione (30 min)

```powershell
# Git
git config --global user.name "Marco"
git config --global user.email "marco@example.com"

# GitHub CLI
gh auth login

# Docker (Marco) - richiede riavvio
Enable-WindowsOptionalFeature -Online -FeatureName Hyper-V -All
```

---

## 📊 Timeline Totale

| Fase | Tempo | Chi | Note |
|------|-------|-----|------|
| Preparazione | 30 min | Tu | Scaricamento driver |
| Windows Install | 30 min | Automatico | Boot + setup |
| Driver Install | 45 min | PowerShell | Script + riavvii |
| Windows Update | 1-2 ore | Automatico | Potrebbe volerci parecchio |
| Software Auto | 30 min | Script PS | Winget installa tutto |
| Software Manuale | 1-2 ore | Tu | Seguire README specifico |
| Configurazione | 30 min | PowerShell | Git, GitHub, Docker, etc. |
| **TOTALE** | **4-5 ore** | Misto | Per singolo PC |

---

## ⚠️ Cose Importanti

### Errori Comuni
1. **Usare Home invece di Pro**: Windows non abiliterà Docker/Hyper-V
2. **Non installare AMD driver prima di NVIDIA** (Giulio): Causa crash GPU
3. **Non aggiornare Windows**: Mancano driver cruciali
4. **Non autenticarsi con Microsoft Account**: La licenza non segue

### Se qualcosa non funziona
1. Vedi `docs/TROUBLESHOOTING.md`
2. Controlla il README specifico (Marco-README.md o Giulio-README.md)
3. Se ancora non funziona, apri un issue su GitHub

---

## 🔧 Post-Installation Maintenance

### Aggiornamenti Driver (mensile)
```powershell
# NVIDIA (Giulio)
https://www.nvidia.com/Download/driverDetails.aspx

# AMD (Marco)
https://www.amd.com/en/support

# Gigabyte/Intel
https://www.gigabyte.com/
```

### Windows Update
Impostazioni → Windows Update → Verifica aggiornamenti (mensilmente)

### Cleanup
```powershell
# Pulisci file temporanei (dopo installazione)
Cleanmgr

# O manualmente
rm -r C:\Users\[username]\Downloads\*.exe
rm -r C:\Users\[username]\AppData\Local\Temp\*
```

---

## 📞 Support

Per problemi:
1. **Leggi il README** corrispondente (Marco o Giulio)
2. **Controlla TROUBLESHOOTING.md**
3. **Cerca il problema online** (errore esatto)
4. **Apri issue** su questo repo

---

## 📝 Checklist Finale

### PC Marco
- [ ] Windows 11 Pro con account Microsoft
- [ ] Driver chipset B550M installati
- [ ] Driver GPU AMD installati
- [ ] Windows Update completato
- [ ] Script PowerShell eseguito
- [ ] Git/GitHub configurato
- [ ] Docker funzionante (Hyper-V abilitato)
- [ ] VSCode + estensioni
- [ ] Software manuali installati

### PC Giulio
- [ ] Windows 11 Pro con account Microsoft
- [ ] Driver chipset AMD AM5 installati
- [ ] Driver GPU NVIDIA RTX 5060 installati
- [ ] Windows Update completato
- [ ] Script PowerShell eseguito
- [ ] Git/GitHub configurato
- [ ] Adobe Creative Cloud scaricato
- [ ] Figma funzionante
- [ ] Software manuali installati

---

**Ultima modifica**: Luglio 2026  
**Versione**: 1.0
