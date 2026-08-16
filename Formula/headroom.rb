class Headroom < Formula
  desc "macOS Menu Bar AI Subscription Usage Tracker (Rust + GPUI)"
  homepage "https://github.com/4nkitd/headroom"
  url "https://github.com/4nkitd/headroom/releases/download/v0.3.0/headroom-v0.3.0-macos-arm64.zip",
      headers: ["User-Agent: Mozilla/5.0"]
  sha256 "5eccf204ec0234c0c7d07c55f185de787417d90347b0db51a3d317b697b8a4f9"
  version "0.3.0"
  depends_on :macos

  def install
    bin.install "headroom"
  end

  test do
    assert_predicate bin/"headroom", :exist?
  end
end
