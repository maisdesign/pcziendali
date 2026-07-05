# ============================================================================
# Installazione automatica driver - da eseguire dopo il primo accesso a Windows
# Rileva la scheda madre e installa i driver corrispondenti da drivers\<PC>\
# Ordine: chipset -> gpu -> audio -> ethernet -> wifi (bios escluso, manuale)
# ============================================================================
# Esegui come Administrator, oppure lancia install-drivers.bat con doppio click.

$scriptRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$order = @("chipset", "gpu", "audio", "ethernet", "wifi")

Write-Host "=== Installazione automatica driver ===" -ForegroundColor Green
Write-Host ""

# --- 1. Rilevo la scheda madre e scelgo il set di driver ---
$board = (Get-CimInstance Win32_BaseBoard).Product
Write-Host "Scheda madre rilevata: $board"

$driverSet = $null
if ($board -like "*B850*") {
    $driverSet = "Marco-casa"
} elseif ($board -like "*B550M*") {
    $driverSet = "Marco"
}

if (-not $driverSet) {
    Write-Host ""
    Write-Host "Scheda madre non riconosciuta automaticamente. Scegli il set di driver:" -ForegroundColor Yellow
    Write-Host "  1) Marco-casa (ASRock B850 Steel Legend WiFi)"
    Write-Host "  2) Marco (Gigabyte B550M AORUS Elite AX)"
    $choice = Read-Host "Inserisci 1 o 2"
    $driverSet = if ($choice -eq "2") { "Marco" } else { "Marco-casa" }
}

$driversRoot = Join-Path $scriptRoot "drivers\$driverSet"
Write-Host "Uso il set di driver: $driverSet ($driversRoot)" -ForegroundColor Cyan

if (-not (Test-Path $driversRoot)) {
    Write-Host "ERRORE: cartella driver non trovata: $driversRoot" -ForegroundColor Red
    exit 1
}

# --- 2. Installo ogni categoria nell'ordine corretto ---
foreach ($category in $order) {
    $catPath = Join-Path $driversRoot $category
    if (-not (Test-Path $catPath)) {
        Write-Host "[$category] cartella non trovata, salto." -ForegroundColor Yellow
        continue
    }

    Write-Host ""
    Write-Host "=== [$category] ===" -ForegroundColor Green

    # Cerco un installer (setup.exe / install.exe) nelle sottocartelle estratte
    $installer = Get-ChildItem $catPath -Recurse -Include "setup.exe","install.exe" -ErrorAction SilentlyContinue | Select-Object -First 1

    if ($installer) {
        Write-Host "Eseguo installer: $($installer.FullName)" -ForegroundColor Cyan
        Write-Host "(segui la procedura guidata che si apre, poi chiudila per continuare)"
        Start-Process -FilePath $installer.FullName -Wait
    } else {
        # Nessun installer trovato: provo con pnputil sui file .inf (driver puri)
        $infFiles = Get-ChildItem $catPath -Recurse -Filter "*.inf" -ErrorAction SilentlyContinue
        if ($infFiles) {
            Write-Host "Nessun setup.exe, installo $($infFiles.Count) driver .inf con pnputil..." -ForegroundColor Cyan
            pnputil.exe /add-driver "$catPath\*.inf" /subdirs /install
        } else {
            Write-Host "Nessun installer o .inf trovato in $catPath, salto." -ForegroundColor Yellow
        }
    }
}

Write-Host ""
Write-Host "=== Installazione driver completata ===" -ForegroundColor Green
Write-Host "Riavvia il PC per applicare tutte le modifiche." -ForegroundColor Yellow
