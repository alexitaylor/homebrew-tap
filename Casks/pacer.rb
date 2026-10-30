# Homebrew cask for Pacer. scripts/release.sh fills in the version and the SHA-256 of
# Pacer.zip, then pushes the result to Casks/pacer.rb in alexitaylor/homebrew-tap.
#
# Users install with:
#   brew install --cask alexitaylor/tap/pacer
cask "pacer" do
  version "0.1.0-202610300744"
  sha256 "196ade87557cdcf5884df77c4937703945fc80cd686ad2360cba91e8d9f4027b"

  url "https://github.com/alexitaylor/pacer-releases/releases/download/v#{version}/Pacer.zip"
  name "Pacer"
  desc "Autocomplete popover for the terminal"
  homepage "https://pacer.sh"

  depends_on arch: :arm64
  depends_on macos: ">= :ventura"

  app "Pacer.app"
  binary "#{appdir}/Pacer.app/Contents/MacOS/pacer"

  # `brew upgrade` swaps the bundle under the running app. Restart it only when it is
  # running, so a first install does not start Pacer before `pacer setup`.
  postflight do
    system_command "/bin/sh",
                   args: ["-c", 'pgrep -xq pacer-desktop && "$0" restart || true',
                          "#{appdir}/Pacer.app/Contents/MacOS/pacer"]
  end

  zap trash: [
    "~/Library/Application Support/pacer",
    "~/Library/Caches/io.github.alexitaylor.pacer",
    "~/Library/LaunchAgents/io.github.alexitaylor.pacer.launcher.plist",
    "~/Library/WebKit/io.github.alexitaylor.pacer",
  ]

  caveats <<~EOS
    Run `pacer setup` to add the zsh hooks and start Pacer. Then allow Pacer in
    System Settings > Privacy & Security > Accessibility, and open a new terminal tab.

    Before `brew uninstall --cask pacer`, run `pacer uninstall` to remove the zsh hooks.
  EOS
end
