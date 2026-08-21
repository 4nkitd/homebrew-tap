cask "mordo" do
  version "1.1.0"
  sha256 "59e58f583c0bf41af6fc9684a7400a663e8e6aac24f0cf053e03753247fe1179"

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
