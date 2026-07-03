# ============================================================================
# PC GIULIO - Install Script
# Windows 11 Pro - Designer Workstation
# ============================================================================
# Esegui come Administrator: 
# Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope CurrentUser
# .\Giulio-install.ps1

# Funzione helper per installare con winget
function Install-Software {
    param(
        [string]$PackageId,
        [string]$Name
    )
    Write-Host "Installando $Name..." -ForegroundColor Cyan
    winget install -e --id $PackageId --accept-package-agreements --accept-source-agreements
}

Write-Host "╔════════════════════════════════════════════════════════════════╗" -ForegroundColor Green
Write-Host "║          INSTALLAZIONE SOFTWARE - PC GIULIO (GRAFICO)         ║" -ForegroundColor Green
Write-Host "╚════════════════════════════════════════════════════════════════╝" -ForegroundColor Green
Write-Host ""

# Aggiorna winget
Write-Host "Aggiornando Windows Package Manager..." -ForegroundColor Yellow
winget upgrade --all

# ============================================================================
# SOFTWARE INSTALLATION
# ============================================================================

$software = @(
    @{id="7zip.7zip"; name="7-Zip"},
    @{id="Git.Git"; name="Git"},
    @{id="GitHub.cli"; name="GitHub CLI"},
    @{id="Google.Chrome"; name="Google Chrome"},
    @{id="FileZilla.FileZilla"; name="FileZilla"},
    @{id="Notepad++.Notepad++"; name="Notepad++"},
    @{id="WizTree"; name="WizTree"},
    @{id="Node.js.Node.js"; name="Node.js LTS"},
    @{id="Adobe.CreativeCloud"; name="Adobe Creative Cloud"},
    @{id="Figma.Figma"; name="Figma"},
)

foreach ($app in $software) {
    Install-Software -PackageId $app.id -Name $app.name
    Start-Sleep -Seconds 2
}

Write-Host ""
Write-Host "╔════════════════════════════════════════════════════════════════╗" -ForegroundColor Green
Write-Host "║         SOFTWARE DA INSTALLARE MANUALMENTE                     ║" -ForegroundColor Yellow
Write-Host "╚════════════════════════════════════════════════════════════════╝" -ForegroundColor Yellow

Write-Host ""
Write-Host "I seguenti software richiedono installazione manuale:" -ForegroundColor Cyan
Write-Host "  • Claude (desktop app)"
Write-Host "  • Codex"
Write-Host "  • Dolt 1.86.6 (da GitHub releases)"
Write-Host "  • WP Local"
Write-Host "  • McAfee (aziendale)"
Write-Host "  • Microsoft 365"
Write-Host "  • Photopea (web app: https://www.photopea.com)"
Write-Host ""

Write-Host "╔════════════════════════════════════════════════════════════════╗" -ForegroundColor Green
Write-Host "║         CONFIGURAZIONE POST-INSTALLAZIONE                     ║" -ForegroundColor Yellow
Write-Host "╚════════════════════════════════════════════════════════════════╝" -ForegroundColor Yellow

Write-Host ""
Write-Host "1. Installa Adobe Suite:" -ForegroundColor Cyan
Write-Host "   - Apri Adobe Creative Cloud"
Write-Host "   - Accedi con account aziendale"
Write-Host "   - Scarica/aggiorna le app necessarie (Photoshop, Illustrator, etc.)"
Write-Host ""

Write-Host "2. Configura Git:" -ForegroundColor Cyan
Write-Host "   git config --global user.name 'Giulio'"
Write-Host "   git config --global user.email 'tua.email@example.com'"
Write-Host ""

Write-Host "3. Configura authentication GitHub" -ForegroundColor Cyan
Write-Host ""

Write-Host "✓ Installazione completata!" -ForegroundColor Green
