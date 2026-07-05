@echo off
REM install-drivers.bat
REM Da eseguire dopo il primo accesso a Windows per installare i driver.
REM Doppio click: comparira' una richiesta UAC, accetta per procedere.

powershell -NoProfile -ExecutionPolicy Bypass -Command "Start-Process powershell -ArgumentList '-NoProfile -NoExit -ExecutionPolicy Bypass -File \"%~dp0install-drivers.ps1\"' -Verb RunAs"
