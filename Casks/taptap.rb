cask "taptap" do
  version "0.1.0"
  sha256 "1792d2b934eb76dc06f92a7f564b0439f8c71f31b90d0833e64edc3d1c4f81a0"

  url "https://github.com/4nkitd/taptap/releases/download/v#{version}/TapTap-#{version}-macos-arm64.zip"
  name "TapTap"
  desc "Open-source MacBook tap gestures for macOS"
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
