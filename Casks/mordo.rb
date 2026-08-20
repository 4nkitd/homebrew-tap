cask "mordo" do
  version "1.0.0"
  sha256 "c773b5af1480e9e4a559e211db5c2f7d2f5686cdf96f39594c07842199772437"

  url "https://github.com/4nkitd/mordo/releases/download/v#{version}/Mordo-#{version}.dmg"
  name "Mordo"
  desc "Soundboard driven by an 18-key numpad"
  homepage "https://github.com/4nkitd/mordo"

  depends_on macos: ">= :big_sur"

  app "Mordo.app"

  zap trash: [
    "~/Library/Application Support/Mordo",
    "~/Library/Saved Application State/dev.mordo.Mordo.savedState",
  ]
end
