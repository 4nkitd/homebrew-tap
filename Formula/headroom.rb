class Headroom < Formula
  desc "macOS Menu Bar AI Subscription Usage Tracker (Rust + GPUI)"
  homepage "https://github.com/4nkitd/headroom"
  url "https://github.com/4nkitd/headroom/releases/download/v0.4.0/headroom-v0.4.0-macos-arm64.zip",
      headers: ["User-Agent: Mozilla/5.0"]
  sha256 "0a008101b58118f41271da440e90ece4961fc697ad819d16407d83872211fd4c"
  depends_on :macos

  def install
    bin.install "Headroom.app/Contents/MacOS/headroom"
  end

  test do
    assert_match "headroom 0.4.0", shell_output("#{bin}/headroom --version")
  end
end
