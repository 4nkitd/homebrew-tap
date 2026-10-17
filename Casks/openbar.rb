cask "openbar" do
  version "0.1.11"
  sha256 "10cefd6daf7f016d403876eb769013cb3048ea745d3c62234bb2a2ed7599fd56"

  url "https://github.com/4nkitd/openbar/releases/download/v#{version}/OpenBar-#{version}-macos-arm64.zip"
  name "OpenBar"
  desc "AI coding quota monitor with per-account usage bars"
  homepage "https://github.com/4nkitd/openbar"

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "OpenBar.app"

  uninstall quit: "in.4nkitd.openbar"

  zap trash: [
    "~/Library/Application Support/OpenBar",
    "~/Library/Preferences/in.4nkitd.openbar.plist",
    "~/Library/Saved Application State/in.4nkitd.openbar.savedState",
  ]
end
