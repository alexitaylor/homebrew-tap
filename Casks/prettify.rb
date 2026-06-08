# Homebrew Cask template for Prettify (macOS desktop app).
#
# This is the SOURCE OF TRUTH. CI (release.yml -> bump-homebrew) renders it by
# substituting 0.1.0 / c30e59173f04dfc3edaf7a5fae22084e9383a24b4b26801e14e7dcf66afa198e / 6de7f886bb59b77ff2c5a77573ffd5859fbcf88d3a4a8cd0ef7fab19ef8ba8d9 and writes the result to
# Casks/prettify.rb in the public tap repo (alexitaylor/homebrew-tap).
#
# Users install with:
#   brew install --cask alexitaylor/tap/prettify
#
# The app is signed + notarized, so it installs without quarantine prompts.
cask "prettify" do
  version "0.1.0"

  on_arm do
    sha256 "c30e59173f04dfc3edaf7a5fae22084e9383a24b4b26801e14e7dcf66afa198e"
    url "https://github.com/alexitaylor/prettify-releases/releases/download/v#{version}/Prettify_#{version}_aarch64.dmg"
  end
  on_intel do
    sha256 "6de7f886bb59b77ff2c5a77573ffd5859fbcf88d3a4a8cd0ef7fab19ef8ba8d9"
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
