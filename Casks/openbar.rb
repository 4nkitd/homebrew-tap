cask "openbar" do
  version "0.1.8"
  sha256 "e46c806fdf66cafdcb06f1119a5cda7a447da03b6c599d528f51f68063bf93aa"

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
