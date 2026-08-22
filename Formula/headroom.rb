class Headroom < Formula
  desc "macOS Menu Bar AI Subscription Usage Tracker (Rust + GPUI)"
  homepage "https://github.com/4nkitd/headroom"
  url "https://github.com/4nkitd/headroom/releases/download/v0.3.1/headroom-v0.3.1-macos-arm64.zip",
      headers: ["User-Agent: Mozilla/5.0"]
  sha256 "cf092c9ddf7ff41a8c359592e8546fcc15e257f8397a8c48f7bbf5fdf5b26c5f"
  version "0.3.1"
  depends_on :macos

  def install
    bin.install "headroom"
  end

  test do
    assert_predicate bin/"headroom", :exist?
  end
end
