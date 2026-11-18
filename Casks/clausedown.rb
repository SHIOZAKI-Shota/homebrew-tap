cask "clausedown" do
  version "0.10.0"
  sha256 "31e8ac7efb36c68f0994a611267231eca7b88654599fbd8112a045a864e9a958"

  url "https://github.com/SHIOZAKI-Shota/ClauseDown/releases/download/v#{version}/ClauseDown-#{version}-arm64.dmg",
      verified: "github.com/SHIOZAKI-Shota/ClauseDown/"
  name "ClauseDown"
  desc "Editor for legal documents written in Markdown and managed with Git"
  homepage "https://clausedown.app/"

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
