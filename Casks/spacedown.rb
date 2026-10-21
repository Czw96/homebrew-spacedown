cask "spacedown" do
  version "1.0.2"
  sha256 "0b83c6d71887c2fb48509ccf3bcf86327cfbb9bf9076a2ad92c0a5399b2c4ac1"

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
