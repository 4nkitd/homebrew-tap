class Headroom < Formula
  desc "macOS Menu Bar AI Subscription Usage Tracker (Rust + GPUI)"
  homepage "https://github.com/4nkitd/headroom"
  url "https://github.com/4nkitd/headroom/releases/download/v0.5.0/headroom-v0.5.0-macos-arm64.zip",
      headers: ["User-Agent: Mozilla/5.0"]
  sha256 "db3c3ee7d7119620ecf18d7515c98668e9b95b2d4b9b07daeb5a37de0ead847e"
  depends_on :macos

  def install
    bin.install "Contents/MacOS/headroom"
  end

  test do
    assert_match "headroom 0.5.0", shell_output("#{bin}/headroom --version")
  end
end
