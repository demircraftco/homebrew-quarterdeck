cask "quarterdeck" do
  version "0.4.0"
  sha256 "aed760611d2f53186060521866236eec9d394b93993673779b311a6e7a4434be"

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
