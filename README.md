# homebrew-spacedown

Homebrew tap for [Spacedown](https://github.com/Czw96/Spacedown) —— macOS 上的 Markdown
速览工具：Finder 里按空格出渲染页，外加一个只读多标签查看器。

两种方式，装出来是同一个 App —— 都用本仓库 Release 里那份 dmg。
源码仓库保持私有；Cask 与产物放在同一个公开仓库，少一个要同步的地方。

### 方式一：Homebrew Cask（可升级、可干净卸载）

```bash
brew tap czw96/spacedown
brew trust czw96/spacedown   # 第三方 tap 首次需要显式信任（Homebrew 的安全机制）
brew install --cask spacedown
```

> `brew search spacedown` 找不到它也是同一个原因：未信任的 tap 不会被搜索索引，
> `brew info` 会直接报 `Refusing to load cask ... from untrusted tap`。

```bash
brew upgrade --cask spacedown            # 升级
brew uninstall --cask --zap spacedown    # 卸载：偏好、QL 沙箱容器、缓存一并清掉
```

### 方式二：直接下载 dmg

1. 打开 [Releases](https://github.com/Czw96/homebrew-spacedown/releases)，下载 `Spacedown-<版本>.dmg`
2. 双击挂载，把 `Spacedown` 拖进「应用程序」

### 首次启动后（两种方式都要做一次）

1. **先启动一次 Spacedown** —— 系统只在宿主 App 运行过之后才登记它的 Quick Look 扩展
2. 菜单「**显示 → 接管 Markdown 空格预览**」，等几秒（后台跑 `pluginkit` 选举）

> ⚠️ 当前是 ad-hoc 签名（未公证），首次打开会被 Gatekeeper 拦（提示「Apple 无法验证…」）：
> 点「完成」→ **系统设置 → 隐私与安全性** → 拉到底 →「仍要打开」→ 输入密码。
> 或者终端执行 `xattr -dr com.apple.quarantine /Applications/Spacedown.app`。
> macOS 15 起**「右键 → 打开」已不再有效**。
