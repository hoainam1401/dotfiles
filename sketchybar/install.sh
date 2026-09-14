#!/usr/bin/env bash
set -euo pipefail

SOURCE_DIR="$(cd "$(dirname "$0")" && pwd)"
TARGET_DIR="$HOME/.config/sketchybar"
STAMP="$(date +%Y%m%d-%H%M%S)"

if ! command -v brew >/dev/null 2>&1; then
  echo "Homebrew is required: https://brew.sh"
  exit 1
fi

brew list --formula sketchybar >/dev/null 2>&1 || brew install sketchybar
brew list --formula nowplaying-cli >/dev/null 2>&1 || brew install nowplaying-cli
brew list --cask font-hack-nerd-font >/dev/null 2>&1 || brew install --cask font-hack-nerd-font

if [ -d "$TARGET_DIR" ]; then
  cp -R "$TARGET_DIR" "$TARGET_DIR.backup-$STAMP"
  echo "Backed up existing config to $TARGET_DIR.backup-$STAMP"
fi

mkdir -p "$TARGET_DIR/plugins"
cp "$SOURCE_DIR/sketchybarrc" "$SOURCE_DIR/colors.sh" "$TARGET_DIR/"
cp "$SOURCE_DIR"/plugins/*.sh "$TARGET_DIR/plugins/"
chmod +x "$TARGET_DIR/sketchybarrc" "$TARGET_DIR"/plugins/*.sh
chmod 755 "$TARGET_DIR" "$TARGET_DIR/plugins"
chmod 644 "$TARGET_DIR/colors.sh"

# ZIP downloads can carry quarantine metadata. It is unnecessary for these
# plain-text local scripts and can prevent SketchyBar from running them.
xattr -dr com.apple.quarantine "$TARGET_DIR" 2>/dev/null || true

# Reserve vertical space for SketchyBar in the supplied AeroSpace setup.
# A backup is made before changing the existing top gap.
AEROSPACE_CONFIG="$HOME/.aerospace.toml"
if [ -f "$AEROSPACE_CONFIG" ] && grep -q '^[[:space:]]*outer\.top[[:space:]]*=' "$AEROSPACE_CONFIG"; then
  cp "$AEROSPACE_CONFIG" "$AEROSPACE_CONFIG.backup-$STAMP"
  sed -i '' -E 's|^[[:space:]]*outer\.top[[:space:]]*=.*|    outer.top = [{ monitor."Built-in Retina Display" = 9 }, 45]|' "$AEROSPACE_CONFIG"
  echo "Applied monitor-aware gaps: MacBook 9 px, external 45 px"
  echo "AeroSpace backup: $AEROSPACE_CONFIG.backup-$STAMP"
fi

brew services restart sketchybar
aerospace reload-config 2>/dev/null || true

echo
echo "SketchyBar installed. Now merge aerospace.toml into ~/.aerospace.toml,"
echo "remove the old Übersicht callbacks, then run: aerospace reload-config"
