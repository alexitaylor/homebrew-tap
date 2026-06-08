# Prettify Homebrew Tap

Homebrew [cask](https://docs.brew.sh/Cask-Cookbook) for **[Prettify](https://prettify.app)**, a fast multi-format data viewer and editor for JSON, YAML, CSV, XML, and Mermaid.

## Install

```sh
brew install --cask alexitaylor/tap/prettify
```

That single command taps this repo and installs the app. The macOS build is Developer ID-signed and notarized, so it installs cleanly with no quarantine prompts.

Upgrade later:

```sh
brew upgrade --cask prettify
```

Uninstall:

```sh
brew uninstall --cask prettify
```

## What this repo is

This tap contains a single cask (`Casks/prettify.rb`) that points at the signed `.dmg` builds hosted in **[prettify-releases](https://github.com/alexitaylor/prettify-releases)**. It holds no binaries, and the cask is bumped automatically by CI on each release.

Prefer a direct download, or on Windows / Linux? See the [releases](https://github.com/alexitaylor/prettify-releases/releases/latest).

## Links

- Website: https://prettify.app
- All downloads: https://github.com/alexitaylor/prettify-releases/releases
