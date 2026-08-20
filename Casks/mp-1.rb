cask "mp-1" do
  version "0.1.0"
  sha256 "9280256f8ddf83e0773e108b09a5c41b11abf07296eff2fac8b2bfa8544337ea"

  url "https://github.com/4nkitd/mp-1/releases/download/v#{version}/MP-1-#{version}.dmg"
  name "MP-1"
  desc "Field-audio mini player with a real six-band parametric EQ"
  homepage "https://github.com/4nkitd/mp-1"

  depends_on macos: ">= :big_sur"

  app "MP-1.app"

  zap trash: [
    "~/Library/Application Support/MP-1",
    "~/Library/Saved Application State/dev.mp1.MP1.savedState",
  ]
end
