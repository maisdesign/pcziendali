@echo off
REM customize.bat
REM Applica la personalizzazione Windows (taskbar, tema, Esplora File).
REM Non servono permessi amministratore.

powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0customize.ps1"
