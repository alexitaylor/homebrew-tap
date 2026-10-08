# Homebrew Cask template for Prettify (macOS desktop app).
#
# This is the SOURCE OF TRUTH. CI (release.yml -> bump-homebrew) fills in the
# version and the two per-arch SHA-256 placeholders, then writes the result to
# Casks/prettify.rb in the public tap repo (alexitaylor/homebrew-tap).
# (The placeholder tokens are intentionally not spelled out in this comment so
# the sed substitution can't mangle it.)
#
# Users install with:
#   brew install --cask alexitaylor/tap/prettify
#
# The app is signed + notarized, so it installs without quarantine prompts.
cask "prettify" do
  version "0.12.0"

  on_arm do
    sha256 "6c9dc2c0a4046690bd17c2959b2500bf322170bb06d33ec9cd42c57dfb7229e9"
    url "https://github.com/alexitaylor/prettify-releases/releases/download/v#{version}/Prettify_#{version}_aarch64.dmg"
  end
  on_intel do
    sha256 "a5eabae0bb5822567818b5cbc95dc06a9293a88793497903a493529943c39713"
    url "https://github.com/alexitaylor/prettify-releases/releases/download/v#{version}/Prettify_#{version}_x64.dmg"
  end

  name "Prettify"
  desc "Multi-format data viewer and editor (JSON, YAML, CSV, XML, Mermaid)"
  homepage "https://prettify.app"

  # Prettify ships its own in-app updater, but brew-installed copies should let
  # `brew upgrade` own updates. (Detecting install source to suppress the in-app
  # updater is a future refinement.)
  auto_updates true

  app "Prettify.app"

  # Link the bundled CLI onto the PATH so `prettify` works from a terminal.
  binary "#{appdir}/Prettify.app/Contents/Resources/bin/prettify"

  zap trash: [
    "~/Library/Application Support/com.bluesunrise.prettify",
    "~/Library/Caches/com.bluesunrise.prettify",
    "~/Library/Preferences/com.bluesunrise.prettify.plist",
    "~/Library/Saved Application State/com.bluesunrise.prettify.savedState",
    "~/Library/WebKit/com.bluesunrise.prettify",
  ]
end
