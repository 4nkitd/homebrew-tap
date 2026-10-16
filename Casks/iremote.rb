cask "iremote" do
  version "0.2.0"
  sha256 "12d1eeecf689ad128132863b07cc51b28982e331f90c0b3374be074f3698491c"

  url "https://github.com/4nkitd/iremote/releases/download/v#{version}/iRemote-#{version}-macos-arm64.zip"
  name "iRemote"
  desc "Menu bar remote and keyboard for Google TV and Android TV"
  homepage "https://github.com/4nkitd/iremote"

  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "iRemote.app"

  zap trash: [
    "~/Library/Application Support/iRemote",
    "~/Library/Preferences/in.4nkitd.iremote.plist",
    "~/Library/Saved Application State/in.4nkitd.iremote.savedState",
  ]

  caveats do
    <<~EOS
      This alpha is ad-hoc signed and is not notarised by Apple.
      macOS may block the first launch. If you trust this release, use
      System Settings > Privacy & Security > Open Anyway when offered.
      This cask does not bypass Gatekeeper or remove quarantine attributes.

      iRemote lives in the menu bar, not the Dock. Your TV must be on the
      same local network. Normal uninstall keeps pairing data; --zap removes it.
    EOS
  end
end
