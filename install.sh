#!/bin/bash
# Spacedown 安装脚本（未公证的 ad-hoc 版本，安装后会自动去掉隔离属性）。
#
# 用法：
#   curl -fsSL https://raw.githubusercontent.com/Czw96/homebrew-spacedown/main/install.sh | bash
#   bash install.sh 1.0.1        # 指定版本
#
# 做的事：查最新版本 → 下载 dmg → 校验 sha256 → 拷进 /Applications → 清 quarantine → 启动一次。
set -euo pipefail

REPO="Czw96/homebrew-spacedown"
APP="/Applications/Spacedown.app"

log() { printf '\033[1m==>\033[0m %s\n' "$*"; }
die() { printf 'error: %s\n' "$*" >&2; exit 1; }

json() { /usr/bin/python3 -c "$1"; }

VERSION="${1:-}"
if [[ -z "$VERSION" ]]; then
    log "查询最新版本"
    VERSION=$(curl -fsSL "https://api.github.com/repos/$REPO/releases/latest" \
        | json 'import json,sys; print(json.load(sys.stdin)["tag_name"].lstrip("v"))')
fi

DMG_URL="https://github.com/$REPO/releases/download/v${VERSION}/Spacedown-${VERSION}.dmg"
TMP=$(mktemp -d)
MOUNT="$TMP/mnt"
trap 'hdiutil detach "$MOUNT" >/dev/null 2>&1 || true; rm -rf "$TMP"' EXIT

if [[ -n "${SPACEDOWN_DMG:-}" ]]; then
    # 离线/自测用：直接给一份本地 dmg
    log "使用本地 dmg：$SPACEDOWN_DMG"
    cp "$SPACEDOWN_DMG" "$TMP/Spacedown.dmg"
else
    log "下载 Spacedown ${VERSION}"
    curl -fL --progress-bar --http1.1 --retry 3 "$DMG_URL" -o "$TMP/Spacedown.dmg"

    # GitHub 会给每个资产算 digest，用它校验，避免下到半截或被替换
    EXPECTED=$(curl -fsSL "https://api.github.com/repos/$REPO/releases/tags/v${VERSION}" \
        | json 'import json,sys
assets = json.load(sys.stdin)["assets"]
dmg = next(a for a in assets if a["name"].endswith(".dmg"))
print((dmg.get("digest") or "").replace("sha256:", ""))')

    if [[ -n "$EXPECTED" ]]; then
        ACTUAL=$(shasum -a 256 "$TMP/Spacedown.dmg" | awk '{print $1}')
        [[ "$EXPECTED" == "$ACTUAL" ]] \
            || die "sha256 不匹配（期望 $EXPECTED，实际 $ACTUAL）"
        log "sha256 校验通过"
    fi
fi

log "安装到 /Applications"
mkdir -p "$MOUNT"
hdiutil attach -nobrowse -readonly -mountpoint "$MOUNT" "$TMP/Spacedown.dmg" >/dev/null
rm -rf "$APP"
cp -R "$MOUNT/Spacedown.app" /Applications/
hdiutil detach "$MOUNT" >/dev/null 2>&1 || true

# 未公证版本：不清掉隔离属性，Gatekeeper 会拦首次打开
xattr -dr com.apple.quarantine "$APP" 2>/dev/null || true

log "启动一次（系统才会登记 Quick Look 扩展）"
open -a "$APP" || true

cat <<'TIP'

装好了。接下来：
1. 菜单「显示 → 接管 Markdown 空格预览」
2. 想让双击 .md 也用它：⌘, 打开设置 →「设为 .md 默认打开方式」
TIP
