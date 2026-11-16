cask "clausedown" do
  version "0.9.0"
  sha256 "6f7dfb6687e7e055448160425d30c17d359eb258bcff4c35bef7634f4ed4e2d4"

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
