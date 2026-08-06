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
  version "0.6.0"

  on_arm do
    sha256 "006102d7971540b36d06356d064c6d3e6bbdc640e4af9a36e77cdce8a3237946"
    url "https://github.com/alexitaylor/prettify-releases/releases/download/v#{version}/Prettify_#{version}_aarch64.dmg"
  end
  on_intel do
    sha256 "95a01881359eb71e5cf6802d6efa1832a0d90693b3c0ffcc813fc2a9016bbe1a"
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

  zap trash: [
    "~/Library/Application Support/com.bluesunrise.prettify",
    "~/Library/Caches/com.bluesunrise.prettify",
    "~/Library/Preferences/com.bluesunrise.prettify.plist",
    "~/Library/Saved Application State/com.bluesunrise.prettify.savedState",
    "~/Library/WebKit/com.bluesunrise.prettify",
  ]
end
