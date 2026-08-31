class Koko < Formula
  desc "High-Performance Standalone Text-To-Speech CLI & Server for macOS"
  homepage "https://github.com/4nkitd/koko"
  url "https://github.com/4nkitd/koko/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  license "MIT"

  depends_on "go" => :build
  depends_on :macos

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "main.go"
  end

  test do
    assert_match "koko version 0.1.0", shell_output("#{bin}/koko --version")
  end
end
