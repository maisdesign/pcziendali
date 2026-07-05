@echo off
REM install-software.bat
REM Installa via winget il software (7-Zip, Chrome, Docker, VSCode, ecc.).
REM Stesso elenco software sia per il PC lavoro che per quello di casa.
REM Doppio click: comparira' una richiesta UAC, accetta per procedere.

powershell -NoProfile -ExecutionPolicy Bypass -Command "Start-Process powershell -ArgumentList '-NoProfile -NoExit -ExecutionPolicy Bypass -File \"%~dp0install-software.ps1\"' -Verb RunAs"
