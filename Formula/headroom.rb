class Headroom < Formula
  desc "macOS Menu Bar AI Subscription Usage Tracker (Rust + GPUI)"
  homepage "https://github.com/4nkitd/headroom"
  url "https://github.com/4nkitd/headroom/releases/download/v0.3.2/headroom-v0.3.2-macos-arm64.zip",
      headers: ["User-Agent: Mozilla/5.0"]
  sha256 "db2635e33d8ce2f4f6b92b5b3254c787f70c28576ea0381e43a1c0c93aa22649"
  version "0.3.2"
  depends_on :macos

  def install
    bin.install "headroom"
  end

  test do
    assert_predicate bin/"headroom", :exist?
  end
end
