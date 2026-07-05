============================================================
 CHIAVETTA WINDOWS 11 PRO - GUIDA RAPIDA
============================================================

CONTENUTO CHIAVETTA
--------------------
NOTA: le lettere di unita' (E:, F:, ...) possono cambiare a seconda
del PC/sessione in cui la colleghi. Riconosci le due partizioni
dall'ETICHETTA (visibile in Esplora File), non dalla lettera:

Partizione "WINDOWS" (creata con Rufus, immagine ufficiale Microsoft)
        -> File di avvio/installazione Windows 11 Pro standard.
           Il setup potrebbe chiederti l'edizione o un codice
           Product Key: vedi FASE 1 sotto per come gestirlo.

Partizione "DRIVERS"
        -> Driver per entrambi i PC + script di post-installazione
           drivers\Marco-casa\   driver PC di casa (ASRock B850 Steel Legend WiFi)
           drivers\Marco\        driver PC lavoro (Gigabyte B550M AORUS Elite AX)


============================================================
 FASE 1 - INSTALLAZIONE WINDOWS
============================================================
1. Riavvia il PC con la chiavetta collegata
2. Premi il tasto boot menu (ASRock: F11 - oppure Canc/F2 per
   entrare nel BIOS e scegliere il boot da USB manualmente)
3. Seleziona la chiavetta Lexar come dispositivo di avvio
4. Segui il setup di Windows. Se richiesta l'edizione: scegli Pro.
   Se richiesto un Product Key e vuoi saltarlo senza rischiare
   crash, usa la chiave generica pubblica Microsoft per Windows 11 Pro
   (NON e' pirateria, e' pubblicata ufficialmente da Microsoft per
   scenari di deployment - dopo l'installazione si sostituisce con
   la licenza vera o si attiva da sola con l'account Microsoft):
       VK7JG-NPHTM-C97JM-9MPGT-3V66T

ATTENZIONE: l'installazione formatta il disco di destinazione
scelto durante il setup. Assicurati di aver salvato/backuppato
tutto cio' che ti serve prima di procedere.


============================================================
 FASE 2 - DOPO IL PRIMO ACCESSO A WINDOWS
============================================================
Vai sulla partizione "DRIVERS" ed esegui gli script IN QUESTO ORDINE:

1. install-drivers.bat
   - Rileva automaticamente la scheda madre (ASRock B850 o
     Gigabyte B550M) e installa i driver corretti nell'ordine:
     chipset -> gpu -> audio -> ethernet -> wifi
   - Chiede permessi amministratore (UAC)
   - RIAVVIA il PC al termine

2. install-software.bat
   - Installa via winget: 7-Zip, Git, GitHub CLI, Chrome, VSCode,
     Postman, FileZilla, Notepad++, SourceTree, WizTree, Docker
     Desktop, Node.js, Google Cloud SDK, Claude, Codex CLI, Dolt,
     PowerToys, Python 3.13, SignalRGB, VLC, ChatGPT
   - Chiede permessi amministratore (UAC)
   - Alla fine mostra l'elenco di software da installare a mano
     (Antigravity IDE, Herd, iSpring, WP Local, McAfee, Microsoft
     365, Myinstants, Spring Tools Eclipse) e i comandi di
     configurazione Git/Docker/GitHub CLI da eseguire dopo

3. debloat.bat
   - Rimuove il bloatware di Windows (Xbox, Solitaire, OfficeHub,
     Teams consumer, Clipchamp, meteo/notizie Bing, ecc.)
   - Chiede permessi amministratore (UAC)

4. customize.bat
   - Barra applicazioni a sinistra, tema scuro, nasconde Widget/
     ricerca/Chat dalla taskbar
   - Esplora File: mostra estensioni file, file nascosti, apre
     su "Questo PC"
   - Monitor OFF dopo 3 minuti di inattivita', PC MAI in
     sospensione/ibernazione
   - NON serve amministratore

5. restore-env.bat
   - Ripristina le variabili d'ambiente personali (token GitHub,
     DoltHub, Turso, ecc.)
   - Contiene credenziali reali: presente SOLO su questa
     chiavetta, mai nel repo Git
   - NON serve amministratore


============================================================
 NOTE
============================================================
- Il BIOS puo' essere aggiornato dal sito ASRock/Gigabyte,
  ma e' opzionale: farlo solo se necessario
- Repo di riferimento con tutti gli script e i README dettagliati:
  https://github.com/maisdesign/pcziendali (branch marco-casa-setup)
