cask "spacedown" do
  version "1.0.3"
  sha256 "722fe229ba0263a6ccfab0e703837a19ef7551cccb28dd689fc4257d474b035e"

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
