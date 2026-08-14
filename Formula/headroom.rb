class Headroom < Formula
  desc "macOS Menu Bar AI Subscription Usage Tracker (Rust + GPUI)"
  homepage "https://github.com/4nkitd/headroom"
  url "https://github.com/4nkitd/headroom/releases/download/v0.1.0/headroom-v0.1.0-macos-arm64.zip"
  sha256 "11ed84c6eff935833dde87b191d0fd9251c912db8a68d6807bfb9fe15191f537"
  version "0.1.0"
  depends_on :macos

  def install
    bin.install "headroom"
  end

  test do
    assert_predicate bin/"headroom", :exist?
  end
end
