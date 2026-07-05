@echo off
REM debloat.bat
REM Da eseguire UNA VOLTA dopo il primo accesso a Windows, per rimuovere il bloatware.
REM Doppio click: comparira' una richiesta UAC, accetta per procedere.

powershell -NoProfile -ExecutionPolicy Bypass -Command "Start-Process powershell -ArgumentList '-NoProfile -NoExit -ExecutionPolicy Bypass -File \"%~dp0debloat.ps1\"' -Verb RunAs"
