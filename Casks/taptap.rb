cask "taptap" do
  version "0.1.3"
  sha256 "6d20478814be7881d8c37cb669c73a2dc57be966d9b14c1df7eff522cd9f8b03"

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
