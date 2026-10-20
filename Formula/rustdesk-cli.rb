class RustdeskCli < Formula
  desc "Headless RustDesk client CLI (no GUI, no official binary)"
  homepage "https://github.com/4nkitd/rustdesk-cli"
  version "0.2.0"
  license "AGPL-3.0"

  on_macos do
    on_arm do
      url "https://github.com/4nkitd/rustdesk-cli/releases/download/v0.2.0/rdcli-darwin-arm64"
      sha256 "26667b5a97d04e2a75826f89e31933f9eda1fcdebd0486add84dcb32277975d6"
    end
    on_intel do
      url "https://github.com/4nkitd/rustdesk-cli/releases/download/v0.2.0/rdcli-darwin-amd64"
      sha256 "d6aba92ac00c1902d540298c9bfd62d62b0b998baf0cb9d80701bb5f0f2ee328"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/4nkitd/rustdesk-cli/releases/download/v0.2.0/rdcli-linux-arm64"
      sha256 "4549eb26eec98895a140763a8222b7ee2dd6f26af6e68ac5f84f6eef2f221878"
    end
    on_intel do
      url "https://github.com/4nkitd/rustdesk-cli/releases/download/v0.2.0/rdcli-linux-amd64"
      sha256 "bb7378807a7dc120ce62ddc8c6363c7f99acf16d98f4b721e3c2d9f1180e66eb"
    end
  end

  resource "licenses" do
    url "https://github.com/4nkitd/rustdesk-cli/releases/download/v0.2.0/rdcli-licenses.tar.gz"
    sha256 "7cb037d8beb486a10591be6424f0e373b5ee3ea087461cf9aec296c5c4716878"
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
    resource("licenses").stage do
      (pkgshare/"licenses").install Dir["*"]
    end
  end

  test do
    assert_equal "rdcli v#{version}", shell_output("#{bin}/rdcli version").strip
    assert_path_exists pkgshare/"licenses/THIRD_PARTY_NOTICES.md"
  end
end
