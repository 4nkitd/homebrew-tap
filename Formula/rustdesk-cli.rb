class RustdeskCli < Formula
  desc "Headless RustDesk client CLI (no GUI, no official binary)"
  homepage "https://github.com/4nkitd/rustdesk-cli"
  version "0.1.0"
  license "AGPL-3.0"

  on_macos do
    on_arm do
      url "https://github.com/4nkitd/rustdesk-cli/releases/download/v0.1.0/rdcli-darwin-arm64"
      sha256 "5f274f5250825d992d7d57008dd2fb838f9e87c28847f362be644f04832f8033"
    end
    on_intel do
      url "https://github.com/4nkitd/rustdesk-cli/releases/download/v0.1.0/rdcli-darwin-amd64"
      sha256 "db308de45b77e4feecaced58edc3f909d267e0c07713da28a790aef6bae70178"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/4nkitd/rustdesk-cli/releases/download/v0.1.0/rdcli-linux-arm64"
      sha256 "f2d7fe61b9b4bc02e2d60b934733df342779b459a4697d0098558458a881651a"
    end
    on_intel do
      url "https://github.com/4nkitd/rustdesk-cli/releases/download/v0.1.0/rdcli-linux-amd64"
      sha256 "7d553bc9e704e0723a54c28c097450c872552df38733d3b301a6883266714ec5"
    end
  end

  def install
    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "rdcli-darwin-arm64" => "rdcli"
      else
        bin.install "rdcli-darwin-amd64" => "rdcli"
      end
    else
      if Hardware::CPU.arm?
        bin.install "rdcli-linux-arm64" => "rdcli"
      else
        bin.install "rdcli-linux-amd64" => "rdcli"
      end
    end
  end

  test do
    assert_match "rdcli v", shell_output("#{bin}/rdcli version")
  end
end
