cask "openbar" do
  version "0.1.13"
  sha256 "1b4720ac3523e39f208b0a926f914009a00a9264b5f39a0a99849eed916bed9e"

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
