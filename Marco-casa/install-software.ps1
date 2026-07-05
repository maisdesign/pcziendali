# ============================================================================
# PC MARCO-CASA - Install Script
# Windows 11 - Dev Workstation (Casa)
# ============================================================================
# Esegui come Administrator:
# Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope CurrentUser
# .\Marco-casa-install.ps1
# (oppure lancia Marco-casa-install.bat con doppio click)

# Funzione helper per installare con winget
function Install-Software {
    param(
        [string]$PackageId,
        [string]$Name,
        [string]$Source = ""
    )
    Write-Host "Installando $Name..." -ForegroundColor Cyan
    if ($Source) {
        winget install -e --id $PackageId --source $Source --accept-package-agreements --accept-source-agreements
    } else {
        winget install -e --id $PackageId --accept-package-agreements --accept-source-agreements
    }
}

Write-Host "╔════════════════════════════════════════════════════════════════╗" -ForegroundColor Green
Write-Host "║          INSTALLAZIONE SOFTWARE - PC MARCO-CASA                ║" -ForegroundColor Green
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
    @{id="Microsoft.VisualStudioCode"; name="Visual Studio Code"},
    @{id="Postman.Postman"; name="Postman"},
    @{id="FileZilla.FileZilla"; name="FileZilla"},
    @{id="Notepad++.Notepad++"; name="Notepad++"},
    @{id="SourceTree.SourceTree"; name="SourceTree"},
    @{id="WizTree"; name="WizTree"},
    @{id="Docker.DockerDesktop"; name="Docker Desktop"},
    @{id="Node.js.Node.js"; name="Node.js LTS"},
    @{id="Google.CloudSDK"; name="Google Cloud SDK"},
    @{id="Anthropic.Claude"; name="Claude"},
    @{id="OpenAI.Codex"; name="Codex CLI"},
    @{id="DoltHub.Dolt"; name="Dolt"},
    @{id="Microsoft.PowerToys"; name="PowerToys"},
    @{id="Python.Python.3.13"; name="Python 3.13"},
    @{id="WhirlwindFX.SignalRgb"; name="SignalRGB"},
    @{id="VideoLAN.VLC"; name="VLC"},
    @{id="9NT1R1C2HH7J"; name="ChatGPT"; source="msstore"}
)

foreach ($app in $software) {
    if ($app.source) {
        Install-Software -PackageId $app.id -Name $app.name -Source $app.source
    } else {
        Install-Software -PackageId $app.id -Name $app.name
    }
    Start-Sleep -Seconds 2
}

Write-Host ""
Write-Host "╔════════════════════════════════════════════════════════════════╗" -ForegroundColor Green
Write-Host "║         SOFTWARE DA INSTALLARE MANUALMENTE                     ║" -ForegroundColor Yellow
Write-Host "╚════════════════════════════════════════════════════════════════╝" -ForegroundColor Yellow

Write-Host ""
Write-Host "I seguenti software richiedono installazione manuale:" -ForegroundColor Cyan
Write-Host "  • Antigravity IDE"
Write-Host "  • Herd (Laravel) - https://herd.laravel.com"
Write-Host "  • iSpring Free 8"
Write-Host "  • WP Local"
Write-Host "  • McAfee (personale)"
Write-Host "  • Microsoft 365 (personale)"
Write-Host "  • Myinstants App"
Write-Host "  • Spring Tools Eclipse"
Write-Host ""

Write-Host "╔════════════════════════════════════════════════════════════════╗" -ForegroundColor Green
Write-Host "║         CONFIGURAZIONE POST-INSTALLAZIONE                     ║" -ForegroundColor Yellow
Write-Host "╚════════════════════════════════════════════════════════════════╝" -ForegroundColor Yellow

Write-Host ""
Write-Host "1. Configura Git:" -ForegroundColor Cyan
Write-Host "   git config --global user.name 'Marco'"
Write-Host "   git config --global user.email 'tua.email@example.com'"
Write-Host ""

Write-Host "2. Docker su Windows Home usa WSL2 (non serve Hyper-V):" -ForegroundColor Cyan
Write-Host "   wsl --install"
Write-Host "   (su Windows Pro, in alternativa: Enable-WindowsOptionalFeature -Online -FeatureName Hyper-V -All)"
Write-Host ""

Write-Host "3. Installa NVM per Node.js (opzionale):" -ForegroundColor Cyan
Write-Host "   https://github.com/coreybutler/nvm-windows"
Write-Host ""

Write-Host "4. Configura authentication GitHub/GitLab" -ForegroundColor Cyan
Write-Host ""

Write-Host "✓ Installazione completata!" -ForegroundColor Green
