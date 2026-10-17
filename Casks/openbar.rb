cask "openbar" do
  version "0.1.12"
  sha256 "6351873e628fa66013c990d08f5b25ae8207f42e499b27cc16e64ff0e17dd51c"

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
