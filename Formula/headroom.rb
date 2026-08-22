class Headroom < Formula
  desc "macOS Menu Bar AI Subscription Usage Tracker (Rust + GPUI)"
  homepage "https://github.com/4nkitd/headroom"
  url "https://github.com/4nkitd/headroom/releases/download/v0.3.3/headroom-v0.3.3-macos-arm64.zip",
      headers: ["User-Agent: Mozilla/5.0"]
  sha256 "7ac68ea94032d75ca2200e74eea573561f150cb6f372d15704ecd1424103164c"
  version "0.3.3"
  depends_on :macos

  def install
    bin.install "headroom"
  end

  test do
    assert_predicate bin/"headroom", :exist?
  end
end
