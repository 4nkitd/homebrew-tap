cask "try-googlebook-os" do
  version "0.1.0-alpha.1"
  sha256 "98416c9cd9318e828d6db731fe41a34994185be63fecd7812d8b13bdf33aed3f"

  url "https://github.com/4nkitd/try-googlebook-os/releases/download/v#{version}/TryGooglebookOS-#{version}-arm64.dmg"
  name "Try Googlebook OS"
  desc "Experimental Googlebook OS VM setup launcher for Apple Silicon"
  homepage "https://github.com/4nkitd/try-googlebook-os"

  depends_on arch: :arm64
  depends_on macos: ">= :tahoe"
  depends_on formula: "uv"

  app "Try Googlebook OS.app"

  uninstall quit: "in.dagar.try-googlebook-os"

  caveats <<~EOS
    First launch prepares the VM locally in Terminal. Budget about 9 GB of
    downloads and 60 GB free disk, plus Xcode and Android developer tools.
    This alpha is ad-hoc signed, not notarized. Physical USB, real Bluetooth
    and camera support are disabled pending security and hardware validation.
    VM data in ~/.local/share/try-googlebook-os is retained on uninstall.
  EOS
end
