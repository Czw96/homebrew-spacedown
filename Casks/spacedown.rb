cask "spacedown" do
  version "1.0"
  sha256 "a6174a135360bdc682cab2c8456bf90d523ca4e4b7936d260629f6289c0821f1"

  url "https://github.com/Czw96/Spacedown/releases/download/v#{version}/Spacedown-#{version}.dmg"
  name "Spacedown"
  desc "Markdown Quick Look preview and read-only multi-tab viewer"
  homepage "https://github.com/Czw96/Spacedown"

  depends_on macos: ">= :ventura"

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
