cask "codebase" do
  version "0.1.3"
  sha256 "72f0d81a3eb4887f807ada3301dad13df1d9f85cf2ec044910cfbf57299028d0"

  url "https://github.com/AndrewVos/Codebase/releases/download/v#{version}/codebase-#{version}-mac.dmg",
      verified: "github.com/AndrewVos/Codebase/"
  name "Codebase"
  desc "Desktop repository viewer for GitHub and Bitbucket organisations"
  homepage "https://github.com/AndrewVos/Codebase"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates false
  depends_on macos: ">= :monterey"

  app "Codebase.app"

  uninstall quit: "dev.voss.codebase"

  zap trash: [
    "~/Library/Application Support/dev.voss.codebase",
    "~/Library/Caches/dev.voss.codebase",
    "~/Library/Logs/Codebase",
    "~/Library/Preferences/dev.voss.codebase.plist",
    "~/Library/Saved Application State/dev.voss.codebase.savedState",
  ]

  caveats <<~EOS
    This build is not notarized yet. If macOS blocks launch, run:

      xattr -dr com.apple.quarantine /Applications/Codebase.app
  EOS
end
