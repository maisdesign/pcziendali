# ============================================================================
# Personalizzazione Windows 11 - taskbar, tema, Esplora File
# Non richiede permessi amministratore (chiavi solo per l'utente corrente).
# ============================================================================
# Esegui: .\customize.ps1  (oppure lancia customize.bat con doppio click)

Write-Host "=== Personalizzazione Windows ===" -ForegroundColor Green

$advanced = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
$personalize = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize"
$search = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search"

# --- Taskbar: allineamento a sinistra (stile Windows 10) ---
Write-Host "Taskbar: allineamento a sinistra..." -ForegroundColor Cyan
Set-ItemProperty -Path $advanced -Name "TaskbarAl" -Value 0 -Type DWord

# --- Tema: scuro ---
Write-Host "Tema: scuro..." -ForegroundColor Cyan
Set-ItemProperty -Path $personalize -Name "AppsUseLightTheme" -Value 0 -Type DWord
Set-ItemProperty -Path $personalize -Name "SystemUsesLightTheme" -Value 0 -Type DWord

# --- Taskbar: nascondi Widget ---
Write-Host "Taskbar: nascondo Widget..." -ForegroundColor Cyan
Set-ItemProperty -Path $advanced -Name "TaskbarDa" -Value 0 -Type DWord

# --- Taskbar: nascondi casella di ricerca ---
Write-Host "Taskbar: nascondo casella di ricerca..." -ForegroundColor Cyan
if (-not (Test-Path $search)) { New-Item -Path $search -Force | Out-Null }
Set-ItemProperty -Path $search -Name "SearchboxTaskbarMode" -Value 0 -Type DWord

# --- Taskbar: nascondi icona Chat/Teams (se presente in questa build) ---
Write-Host "Taskbar: nascondo icona Chat..." -ForegroundColor Cyan
Set-ItemProperty -Path $advanced -Name "TaskbarMn" -Value 0 -Type DWord -ErrorAction SilentlyContinue

# --- Esplora File: mostra estensioni file ---
Write-Host "Esplora File: mostro estensioni file..." -ForegroundColor Cyan
Set-ItemProperty -Path $advanced -Name "HideFileExt" -Value 0 -Type DWord

# --- Esplora File: mostra file/cartelle nascosti ---
Write-Host "Esplora File: mostro file nascosti..." -ForegroundColor Cyan
Set-ItemProperty -Path $advanced -Name "Hidden" -Value 1 -Type DWord

# --- Esplora File: apri su "Questo PC" invece di Accesso rapido ---
Write-Host "Esplora File: apertura su Questo PC..." -ForegroundColor Cyan
Set-ItemProperty -Path $advanced -Name "LaunchTo" -Value 1 -Type DWord

Write-Host ""
Write-Host "Riavvio Esplora risorse per applicare le modifiche..." -ForegroundColor Yellow
Stop-Process -Name explorer -Force
Start-Sleep -Seconds 2
Start-Process explorer.exe

Write-Host ""
Write-Host "✓ Personalizzazione completata!" -ForegroundColor Green
Write-Host "  (Nota: la barra delle applicazioni in Windows 11 puo' stare solo in basso," -ForegroundColor DarkGray
Write-Host "   Microsoft ha rimosso l'opzione per spostarla in alto/lato rispetto a Windows 10)" -ForegroundColor DarkGray
