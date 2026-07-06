# Reinstallazione multi-cli (PC nuovo)

`multi-cli` permette di lanciare più istanze isolate degli stessi strumenti AI
(Claude Code, Codex, Gemini CLI, Cursor, ...), ognuna con auth/config/sessioni
separate. Repo upstream: <https://github.com/Spielewoy/multi-codex>.

> ⚠️ **Segreti**: le auth dei profili NON stanno in questo repo. Si ripristinano
> sul PC nuovo con re-login, oppure importando gli archivi `.zip` dei profili
> che trovi **solo sulla chiavetta** (mai su GitHub).

## 1. Installazione

PowerShell (installer ufficiale, aggiunge `~/MultiCliProfiles/bin` al PATH e
installa `jq` in automatico):

```powershell
irm https://raw.githubusercontent.com/Spielewoy/multi-codex/main/scripts/install.ps1 | iex
```

In alternativa, installazione locale da clone:

```powershell
git clone https://github.com/Spielewoy/multi-codex.git
cd multi-codex
.\scripts\install.ps1 -Local
```

**Dopo l'installazione riavvia il terminale** perché il PATH abbia effetto.
Verifica con `multi-cli --help` (e il comando di diagnostica elencato lì).

## 2. Profili da ricreare

Su questo PC erano configurati 4 profili:

| Tool | Profilo | Isolamento |
|------|---------|------------|
| claude-cli  | `lavoro`     | `CLAUDE_CONFIG_DIR` |
| codex       | `lavoro`     | `CODEX_HOME` |
| codex       | `personale`  | `CODEX_HOME` |
| gemini-cli  | `lavoro`     | `GEMINI_CLI_HOME` |

## 3. Ripristino auth — due strade

**A) Re-login (più semplice, nessun file da portarsi dietro)**
Crea ogni profilo e autenticati di nuovo, es.:

```powershell
multi-cli claude-cli lavoro      # crea/avvia il profilo, poi fai login
multi-cli codex lavoro
multi-cli codex personale
multi-cli gemini-cli lavoro
```

**B) Import dagli archivi sulla chiavetta (mantiene auth e sessioni)**
Se sulla chiavetta è presente la cartella `multi-cli-profiles-export\` con i
`.zip` dei profili, importali:

```powershell
multi-cli import <percorso>\claude-cli_lavoro.zip claude-cli/lavoro
multi-cli import <percorso>\codex_lavoro.zip      codex/lavoro
multi-cli import <percorso>\codex_personale.zip   codex/personale
multi-cli import <percorso>\gemini-cli_lavoro.zip gemini-cli/lavoro
```

> Gli export si generano sul PC vecchio con `multi-cli export <tool>/<name>`
> (produce `.zip` su Windows). Contengono credenziali: **solo sulla chiavetta**.

## 4. Verifica

- `multi-cli --help` / diagnostica: profile storage presente e `bin` nel PATH
- Avvia un profilo e conferma che l'auth sia valida (nessun re-login richiesto
  se hai importato l'archivio).
