# Agent Office per Homebrew

Agent Office mostra gli agenti di Claude Code al lavoro in un piccolo ufficio 3D, con un'icona nella menu bar di macOS:

- **verde**: Claude sta lavorando;
- **rosso**: Claude aspetta un tuo input;
- **grigio**: nessuna sessione attiva.

## Installazione

```sh
brew install --cask mccasor/agent-office/agent-office
```

Homebrew installa anche Node, che serve al server dell'ufficio. L'app è firmata ad-hoc e non notarizzata: il cask le toglie la quarantena, così macOS la apre senza chiedere conferma.

Dopo l'installazione, nel menu dell'icona:

- **Impostazioni → Installa gli hook di Claude Code**: abilita lo stato in tempo reale, comprese le richieste di permesso;
- **Impostazioni → Avvia al login**: tiene l'icona sempre nella menu bar.

## Aggiornamento e disinstallazione

```sh
brew upgrade --cask agent-office
brew uninstall --cask agent-office          # app
brew uninstall --zap --cask agent-office    # app, dati e avvio al login
```

Prima di disinstallare puoi togliere gli hook da **Impostazioni → Rimuovi gli hook di Claude Code**. Se restano, non danno errori.
