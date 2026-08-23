cask "mordo" do
  version "1.2.0"
  sha256 "a4cc550e7f348e07d72ac2e0fcc9837d9fd5c2ee0e5030867233dde921e8ca76"

  url "https://github.com/4nkitd/mordo/releases/download/v#{version}/Mordo-#{version}.dmg"
  name "Mordo"
  desc "Soundboard driven by an 18-key numpad"
  homepage "https://github.com/4nkitd/mordo"

  depends_on macos: :big_sur

  app "Mordo.app"

  # Mordo is ad-hoc signed, not notarised. Quarantine + Apple silicon makes
  # Gatekeeper SIGKILL the app on launch, so clear the flag so install works.
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
