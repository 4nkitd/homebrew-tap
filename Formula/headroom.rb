class Headroom < Formula
  desc "macOS Menu Bar AI Subscription Usage Tracker (Rust + GPUI)"
  homepage "https://github.com/4nkitd/headroom"
  url "https://github.com/4nkitd/headroom/releases/download/v0.2.0/headroom-v0.2.0-macos-arm64.zip",
      headers: ["User-Agent: Mozilla/5.0"]
  sha256 "31f143f4522e82fb8095cfe93adc0ed85dbaee9ab85e123fa3402bb7f1791fd7"
  version "0.2.0"
  depends_on :macos

  def install
    bin.install "headroom"
  end

  test do
    assert_predicate bin/"headroom", :exist?
  end
end
