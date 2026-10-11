cask "openbar" do
  version "0.1.10"
  sha256 "b205043ae32626c6dec588c6a9d55d241cb733b5182ed6f286deb35d3e256620"

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
