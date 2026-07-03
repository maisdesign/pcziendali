# Quick Start

Checklist rapida per l'installazione di un PC. Per i dettagli completi vedi [SETUP-GUIDE.md](SETUP-GUIDE.md) e il README specifico (`Marco/Marco-README.md` o `Giulio/Giulio-README.md`).

## 1. Preparazione
- [ ] Clona il repo: `git clone https://github.com/maisdesign/pcziendali.git`
- [ ] Apri `Marco/Marco-drivers.csv` (o `Giulio/Giulio-drivers.csv`) e scarica ogni driver dal link indicato
- [ ] Metti ogni driver scaricato nella relativa sottocartella `drivers/` (es. `Marco/drivers/chipset/`)
- [ ] Crea una USB avviabile con Windows 11 Pro (Media Creation Tool)

## 2. Installazione Windows
- [ ] Installa Windows 11 **Pro** sull'NVMe, accedendo con l'account Microsoft aziendale

## 3. Driver (manuale)
- [ ] Installa i driver da `drivers/` **nell'ordine** indicato nel README specifico
  - Per Giulio: chipset AMD **prima** del driver NVIDIA (vedi [TROUBLESHOOTING.md](TROUBLESHOOTING.md))
- [ ] Windows Update finché non risultano più aggiornamenti disponibili

## 4. Software (automatico)
- [ ] PowerShell come Administrator:
  ```powershell
  Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope CurrentUser
  cd Marco   # oppure Giulio
  .\Marco-install.ps1   # oppure .\Giulio-install.ps1
  ```
  Lo script installa via `winget` solo il software elencato nel README; **non installa driver**.

## 5. Software manuale
- [ ] Segui la sezione "Installazione manuale" del README specifico (Claude, Codex, Dolt, Adobe/Herd, ecc.)

## 6. Configurazione finale
- [ ] `git config --global user.name` / `user.email`
- [ ] `gh auth login`
- [ ] Docker (solo Marco): abilita Hyper-V e riavvia

Per problemi durante una qualsiasi di queste fasi, vedi [TROUBLESHOOTING.md](TROUBLESHOOTING.md).
