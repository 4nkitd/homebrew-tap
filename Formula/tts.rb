class Tts < Formula
  desc "High-Performance Standalone Text-To-Speech CLI for macOS"
  homepage "https://github.com/4nkitd/tts"
  url "https://github.com/4nkitd/tts/archive/refs/tags/v0.0.1.tar.gz"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  license "MIT"

  depends_on "go" => :build
  depends_on :macos

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "main.go"
  end

  test do
    assert_match "tts version 0.0.1", shell_output("#{bin}/tts --version")
  end
end
