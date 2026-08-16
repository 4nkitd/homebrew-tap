cask "ocean" do
  version "1.0.0"
  sha256 "810756bdbe593b78ea35fe1cd7c2e9d6b711db69e695ad83dfd28a2e512b2aaf"

  url "https://github.com/4nkitd/ocean/releases/download/v#{version}/Ocean-#{version}.dmg"
  name "Ocean"
  desc "Native macOS desktop client for opencode"
  homepage "https://github.com/4nkitd/ocean"

  app "Ocean.app"

  zap trash: [
    "~/Library/Application Support/Ocean",
    "~/.config/opencode/ocean_credentials.json",
  ]
end
