# Cask del tap mccasor/homebrew-agent-office: version e sha256 li aggiorna scripts/release.mjs.
cask "agent-office" do
  version "0.4.0"
  sha256 "729930d8c03532f8f4ee85e21b053563ef3f50e1906560b33b7460f7ab4a65eb"

  url "https://github.com/mccasor/homebrew-agent-office/releases/download/v#{version}/Agent-Office_#{version}_universal.dmg"
  name "Agent Office"
  desc "Ufficio 3D con gli agenti di Claude Code al lavoro, nella menu bar"
  homepage "https://github.com/mccasor/homebrew-agent-office"

  depends_on macos: ">= :big_sur"
  # il server dell'ufficio gira con Node
  depends_on formula: "node"

  app "Agent Office.app"

  # firma ad-hoc, non notarizzata: senza la quarantena macOS la apre senza chiedere conferma
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Agent Office.app"]
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
