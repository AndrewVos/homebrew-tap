cask "codebase" do
  version "0.1.1"
  sha256 "8040123acfe52626b00e33eb9beb4bfa8244bdf588af0cdd19182fcd86edc79c"

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
