# homebrew-spacedown

Homebrew tap for [Spacedown](https://github.com/Czw96/Spacedown) —— macOS 上的 Markdown
速览工具：Finder 里按空格出渲染页，外加一个只读多标签查看器。

```bash
brew tap czw96/spacedown
brew trust czw96/spacedown   # 第三方 tap 首次需要显式信任（Homebrew 的安全机制）
brew install --cask spacedown
```

> `brew search spacedown` 找不到它也是同一个原因：未信任的 tap 不会被搜索索引，
> `brew info` 会直接报 `Refusing to load cask ... from untrusted tap`。

升级与卸载：

```bash
brew upgrade --cask spacedown
brew uninstall --cask --zap spacedown   # --zap 会清掉偏好、QL 沙箱容器与缓存
```

首次打开若被 Gatekeeper 拦（未公证）：系统设置 → 隐私与安全性 →「仍要打开」，
或 `xattr -dr com.apple.quarantine /Applications/Spacedown.app`。

装完先启动一次 Spacedown（系统才会登记它的 Quick Look 扩展），再用菜单
「显示 → 接管 Markdown 空格预览」。
