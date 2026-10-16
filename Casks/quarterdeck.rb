cask "quarterdeck" do
  version "0.3.1"
  sha256 "24cfd41c1d0f447520879747e47e6eb07e05a2f3fbbf49b16d0ce2d682d83484"

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
