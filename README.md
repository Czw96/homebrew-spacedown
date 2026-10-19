# homebrew-spacedown

Homebrew tap for [Spacedown](https://github.com/Czw96/Spacedown) —— macOS 上的 Markdown
速览工具：Finder 里按空格出渲染页，外加一个只读多标签查看器。

```bash
brew tap czw96/spacedown
brew install --cask spacedown
```

升级与卸载：

```bash
brew upgrade --cask spacedown
brew uninstall --cask --zap spacedown   # --zap 会清掉偏好、QL 沙箱容器与缓存
```

装完先启动一次 Spacedown（系统才会登记它的 Quick Look 扩展），再用菜单
「显示 → 接管 Markdown 空格预览」。
