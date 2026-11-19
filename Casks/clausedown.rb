cask "clausedown" do
  version "0.10.1"
  sha256 "bee01534b83aec5027922e0f2f15afb7ffba45123403eaf2e620a9d441ec01e8"

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
