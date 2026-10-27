# Cask del tap mccasor/homebrew-agent-office: version e sha256 li aggiorna scripts/release.mjs.
cask "agent-office" do
  version "0.7.4"
  sha256 "a33e278574a0359ceb80efb84c9f6ebab87f320d620f2da93807c239d88c5478"

  url "https://github.com/mccasor/homebrew-agent-office/releases/download/v#{version}/Agent-Office_#{version}_universal.dmg"
  name "Agent Office"
  desc "Pixel-art office showing your Claude Code agents at work, in the menu bar"
  homepage "https://github.com/mccasor/homebrew-agent-office"

  # il server dell'ufficio gira con Node
  depends_on formula: "node"
  depends_on :macos

  app "Agent Office.app"

  # firma ad-hoc, non notarizzata: senza la quarantena macOS la apre senza chiedere conferma
  # e la registra tra le applicazioni (LaunchServices): l'app lo rifà comunque a ogni avvio
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Agent Office.app"], must_succeed: false
    run "/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister",
        args: ["-f", "-R", "{{appdir}}/Agent Office.app"], must_succeed: false
  end

  uninstall quit: "app.agent-office.menubar"

  zap trash: [
    "~/.agent-office",
    "~/Library/Caches/app.agent-office.menubar",
    "~/Library/LaunchAgents/app.agent-office.menubar.plist",
    "~/Library/WebKit/app.agent-office.menubar",
  ]

  caveats <<~EOS
    Dal menu dell'icona: Impostazioni -> "Installa gli hook di Claude Code" per lo stato in tempo reale
    (permessi e domande) e "Avvia al login" per averla sempre nella menu bar.
    Prima di disinstallare puoi togliere gli hook da Impostazioni -> "Rimuovi gli hook di Claude Code".
  EOS
end
