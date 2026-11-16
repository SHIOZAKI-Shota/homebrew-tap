cask "clausedown" do
  version "0.9.1"
  sha256 "604dae8c9211c8c9e509a0af32c12498d06a12c31b410c0833b110c43c88b43d"

  url "https://github.com/SHIOZAKI-Shota/ClauseDown/releases/download/v#{version}/ClauseDown-#{version}-arm64.dmg",
      verified: "github.com/SHIOZAKI-Shota/ClauseDown/"
  name "ClauseDown"
  desc "Editor for legal documents written in Markdown and managed with Git"
  homepage "https://shiozaki-shota.github.io/ClauseDown/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "ClauseDown.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/ClauseDown.app"]
  end

  zap trash: [
    "~/Library/Application Support/clausedown",
    "~/Library/Preferences/com.clausedown.app.plist",
    "~/Library/Saved Application State/com.clausedown.app.savedState",
  ]
end
