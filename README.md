# Agent Office for Homebrew

Agent Office shows your Claude Code agents at work in a small 3D office, with an icon in the macOS menu bar:

- **green**: Claude is working;
- **red**: Claude is waiting for your input;
- **gray**: no active session.

## Installation

```sh
brew install --cask mccasor/agent-office/agent-office
```

Homebrew also installs Node, which the office server needs. The app is ad-hoc signed and not notarized: the cask removes the quarantine attribute, so macOS opens it without asking for confirmation.

After installing, from the icon's menu:

- **Settings → Claude Code hooks → Install**: enables real-time status, including permission requests;
- **Settings → Open at login**: keeps the icon in the menu bar at all times.

## Upgrade and uninstall

```sh
brew upgrade --cask agent-office
brew uninstall --cask agent-office          # app
brew uninstall --zap --cask agent-office    # app, data and launch at login
```

Before uninstalling you can remove the hooks from **Settings → Claude Code hooks → Remove**. If they stay behind, they don't cause errors.
