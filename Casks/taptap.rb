cask "taptap" do
  version "0.1.1"
  sha256 "f6e407d8d57168cebbed2fec567d403b0e030672e4a35f4b7e25584f8f97fbbe"

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
