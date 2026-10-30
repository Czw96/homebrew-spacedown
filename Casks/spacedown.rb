cask "spacedown" do
  version "1.0.15"
  sha256 "9f057935420ff713d049f56d8e4d3889b317101bd612bfb735bf9e4d3d47b696"

  url "https://github.com/Czw96/homebrew-spacedown/releases/download/v#{version}/Spacedown-#{version}.dmg"
  name "Spacedown"
  desc "Markdown Quick Look preview and read-only multi-tab viewer"
  homepage "https://github.com/Czw96/Spacedown"

  depends_on macos: :ventura

  app "Spacedown.app"

  zap trash: [
    "/tmp/spacedown-debug.log",
    "~/Library/Caches/cn.29dev.Spacedown",
    "~/Library/Containers/cn.29dev.Spacedown.QuickLookPreview",
    "~/Library/HTTPStorages/cn.29dev.Spacedown",
    "~/Library/Preferences/cn.29dev.Spacedown.plist",
    "~/Library/Saved Application State/cn.29dev.Spacedown.savedState",
  ]
end
