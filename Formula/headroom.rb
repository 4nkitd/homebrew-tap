class Headroom < Formula
  desc "macOS Menu Bar AI Subscription Usage Tracker (Rust + GPUI)"
  homepage "https://github.com/4nkitd/headroom"
  url "https://github.com/4nkitd/headroom/releases/download/v0.3.4/headroom-v0.3.4-macos-arm64.zip",
      headers: ["User-Agent: Mozilla/5.0"]
  sha256 "9b43cf1d5e3d6c4d5c546957e7b4a394f46315de73dde744a117c14312c000d9"
  version "0.3.4"
  depends_on :macos

  def install
    bin.install "headroom"
  end

  test do
    assert_predicate bin/"headroom", :exist?
  end
end
