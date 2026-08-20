cask "mordo" do
  version "1.0.0"
  sha256 "c773b5af1480e9e4a559e211db5c2f7d2f5686cdf96f39594c07842199772437"

  url "https://github.com/4nkitd/mordo/releases/download/v#{version}/Mordo-#{version}.dmg"
  name "Mordo"
  desc "Soundboard driven by an 18-key numpad"
  homepage "https://github.com/4nkitd/mordo"

  depends_on macos: :big_sur

  app "Mordo.app"

  # Mordo is ad-hoc signed, not notarised. On Apple silicon that combination
  # plus the quarantine flag makes Gatekeeper SIGKILL the app on launch, so a
  # plain `brew install` would leave a binary that dies instantly. Clearing the
  # flag here is the same thing the README asks users to do by hand.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Mordo.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/Mordo",
    "~/Library/Saved Application State/dev.mordo.Mordo.savedState",
  ]
end
