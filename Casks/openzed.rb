cask "openzed" do
  version "0.1.0-alpha.1"
  sha256 "7487ef07ca0e3b516cf99cf67aad6d1b3b9ccaac755794ac74ae1bbbb6d1e3ad"

  url "https://github.com/4nkitd/openzed/releases/download/v#{version}/OpenZed-#{version}-macos-arm64.zip"
  name "OpenZed"
  desc "OpenCode-first editor built on Zed"
  homepage "https://github.com/4nkitd/openzed"

  depends_on arch: :arm64
  depends_on formula: "node"
  depends_on :macos

  app "OpenZed.app"
  binary "#{appdir}/OpenZed.app/Contents/MacOS/cli", target: "openzed"

  caveats <<~EOS
    This alpha is ad-hoc signed, not Apple-notarized.
    If macOS blocks launch, review it in System Settings > Privacy & Security.

    Install and configure OpenCode v2 separately. This release was tested with
    OpenCode 2.0.22. Node.js and OpenCode must be on your shell's PATH.

    To retain the development profile, quit OpenZed and run:
      open /Applications/OpenZed.app --args --user-data-dir "$HOME/.oczed"
  EOS
end
