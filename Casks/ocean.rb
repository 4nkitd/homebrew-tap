cask "ocean" do
  version "1.1.0"
  sha256 "5eaf82a2eb3a74059a74b5b3c750dab7f235989b491d0c8e0417ac4d8ee3ce55"

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
