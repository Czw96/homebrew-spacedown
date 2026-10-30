cask "spacedown" do
  version "1.0.13"
  sha256 "af4dc4a1b5818e0f0cb71c8a6aa62559183e77be8de288d4b7c96229ebc87f9c"

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
