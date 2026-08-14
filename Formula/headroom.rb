class Headroom < Formula
  desc "macOS Menu Bar AI Subscription Usage Tracker (Rust + GPUI)"
  homepage "https://github.com/4nkitd/headroom"
  url "https://github.com/4nkitd/headroom/releases/download/v0.1.0/headroom-v0.1.0-macos-arm64.zip"
  sha256 "275fdee4646853938f0ef645405aee92fdefd6d6a64bc97a02294572230e563f"
  version "0.1.0"
  depends_on :macos

  def install
    bin.install "headroom"
  end

  test do
    assert_predicate bin/"headroom", :exist?
  end
end
