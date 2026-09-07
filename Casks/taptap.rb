cask "taptap" do
  version "0.1.2"
  sha256 "73b29540e5b435dca3ad46f8696824c3518a1a3e385804064707c7f2c96faa6b"

  url "https://github.com/4nkitd/taptap/releases/download/v#{version}/TapTap-#{version}-macos-arm64.zip"
  name "TapTap"
  desc "Open-source MacBook tap gesture controls"
  homepage "https://github.com/4nkitd/taptap"

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "TapTap.app"

  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "{{appdir}}/TapTap.app"],
        base: :staged_path,
        sudo: false
  end

  zap trash: [
    "~/Library/Preferences/com.4nkitd.taptap.plist",
    "~/Library/Saved Application State/com.4nkitd.taptap.savedState",
  ]
end
