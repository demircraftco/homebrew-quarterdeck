cask "quarterdeck" do
  version "0.6.0"
  sha256 "5cb71cb0943b04fb6378a787bf60483911b0d0aaa4374e3fbed40db1302d2445"

  url "https://github.com/demircraftco/homebrew-quarterdeck/releases/download/v#{version}/Quarterdeck-#{version}-arm64-mac.zip"
  name "Quarterdeck"
  desc "Run and supervise several Claude Code sessions side by side"
  homepage "https://github.com/demircraftco/homebrew-quarterdeck"

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Quarterdeck.app"

  # ~/Quarterdeck is the user's work and is never removed.
  zap trash: [
    "~/.quarterdeck",
    "~/Library/Application Support/quarterdeck",
  ]

  # An upgrade replaces the app on disk; a copy that is already running stays on the old version (issue #2).
  caveats <<~EOS
    Quarterdeck runs Claude Code, which you install and sign in to yourself:
      https://docs.anthropic.com/en/docs/claude-code
    After an upgrade: Quit and reopen Quarterdeck to load the new version.
  EOS
end
