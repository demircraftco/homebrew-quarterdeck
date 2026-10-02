cask "quarterdeck" do
  version "0.1.2"
  sha256 "e6368411c7c3b95371c82d32841d8169f00dec080c4afb6360c99e28da133f23"

  url "https://github.com/demircraftco/homebrew-quarterdeck/releases/download/v#{version}/Quarterdeck-#{version}-arm64-mac.zip"
  name "Quarterdeck"
  desc "Run and supervise several Claude Code sessions side by side"
  homepage "https://github.com/demircraftco/homebrew-quarterdeck"

  depends_on arch: :arm64

  app "Quarterdeck.app"

  # ~/Quarterdeck is the user's work and is never removed.
  zap trash: [
    "~/.quarterdeck",
    "~/Library/Application Support/quarterdeck",
  ]
end
