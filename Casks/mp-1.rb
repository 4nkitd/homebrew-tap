cask "mp-1" do
  version "0.1.2"
  sha256 "b056d42e02f07b28eb0d03df4fe142ce7f552450c6a579f62fc06e2cffb2de84"

  url "https://github.com/4nkitd/mp-1/releases/download/v#{version}/MP-1-#{version}.dmg"
  name "MP-1"
  desc "Field-audio mini player with a real six-band parametric EQ"
  homepage "https://github.com/4nkitd/mp-1"

  depends_on macos: :big_sur

  app "MP-1.app"

  # MP-1 is ad-hoc signed, not notarised. On Apple silicon that combination
  # plus the quarantine flag makes Gatekeeper SIGKILL the app on launch, so a
  # plain `brew install` would leave a binary that dies instantly. Clearing the
  # flag here is the same thing the release notes ask users to do by hand.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/MP-1.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/MP-1",
    "~/Library/Saved Application State/dev.mp1.MP1.savedState",
  ]
end
