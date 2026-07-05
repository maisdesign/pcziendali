@echo off
REM Marco-casa-install.bat
REM Doppio click per lanciare Marco-casa-install.ps1 come amministratore.
REM Comparira' una richiesta UAC: accetta per procedere.

powershell -NoProfile -ExecutionPolicy Bypass -Command "Start-Process powershell -ArgumentList '-NoProfile -NoExit -ExecutionPolicy Bypass -File \"%~dp0Marco-casa-install.ps1\"' -Verb RunAs"
