# ============================================================================
# Debloat Windows 11 - da eseguire UNA VOLTA dopo il primo accesso
# (l'immagine e' stata creata senza debloat offline per un bug DISM:
#  HRESULT=0x80070057 su Get-ProvisionedAppxPackages contro un WIM montato.
#  Questo script fa lo stesso lavoro online, dove il bug non si presenta.)
# ============================================================================
# Esegui come Administrator, oppure lancia debloat.bat con doppio click.

$bloatPatterns = @(
    "*549981C3F5F10*",        # Cortana
    "*BingNews*",
    "*BingWeather*",
    "*BingFinance*",
    "*GamingApp*",
    "*XboxApp*",
    "*Xbox.TCUI*",
    "*XboxGameOverlay*",
    "*XboxGamingOverlay*",
    "*XboxSpeechToTextOverlay*",
    "*XboxIdentityProvider*",
    "*MicrosoftSolitaireCollection*",
    "*MixedReality.Portal*",
    "*Microsoft3DViewer*",
    "*3DBuilder*",
    "*Print3D*",
    "*MicrosoftOfficeHub*",
    "*Microsoft.People*",
    "*WindowsFeedbackHub*",
    "*GetHelp*",
    "*Getstarted*",
    "*YourPhone*",
    "*ZuneMusic*",
    "*ZuneVideo*",
    "*WindowsMaps*",
    "*Microsoft.Todos*",
    "*PowerAutomateDesktop*",
    "*MicrosoftTeams*",
    "*MSTeams*",
    "*Clipchamp*",
    "*Microsoft.Family*",
    "*OutlookForWindows*",
    "*MicrosoftJournal*",
    "*BingSearch*"
)

Write-Host "=== Debloat Windows 11 ===" -ForegroundColor Green
Write-Host ""

$removed = @()
foreach ($pattern in $bloatPatterns) {
    # Rimuove il pacchetto per tutti gli utenti esistenti
    $installed = Get-AppxPackage -AllUsers | Where-Object { $_.Name -like $pattern }
    foreach ($pkg in $installed) {
        try {
            Write-Host "Rimuovo (utenti): $($pkg.Name)" -ForegroundColor Cyan
            Remove-AppxPackage -Package $pkg.PackageFullName -AllUsers -ErrorAction Stop
            $removed += $pkg.Name
        } catch {
            Write-Host "  (skip, errore: $_)" -ForegroundColor Yellow
        }
    }

    # Rimuove il provisioning cosi' non si reinstalla per nuovi utenti
    $provisioned = Get-AppxProvisionedPackage -Online | Where-Object { $_.PackageName -like $pattern }
    foreach ($prov in $provisioned) {
        try {
            Write-Host "Rimuovo (provisioned): $($prov.PackageName)" -ForegroundColor Cyan
            Remove-AppxProvisionedPackage -Online -PackageName $prov.PackageName -ErrorAction Stop | Out-Null
            $removed += $prov.PackageName
        } catch {
            Write-Host "  (skip, errore: $_)" -ForegroundColor Yellow
        }
    }
}

Write-Host ""
Write-Host "Totale rimosso: $($removed.Count) pacchetti" -ForegroundColor Green
Write-Host "Fatto. Puoi chiudere questa finestra." -ForegroundColor Green
