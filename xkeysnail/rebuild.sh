#!/bin/bash
# Auto-rebuild xkeysnail-git after Python upgrade
set -e

LOGFILE="/tmp/xkeysnail-rebuild.log"
PKGBUILD_DIR="$(find /home -maxdepth 3 -path "*/xkeysnail-git-aur/PKGBUILD" -printf "%h" -quit 2>/dev/null)"

if [[ -z "$PKGBUILD_DIR" ]]; then
    echo "[$(date)] ERROR: Cannot find xkeysnail-git-aur PKGBUILD directory" | tee "$LOGFILE"
    exit 1
fi

OWNER=$(stat -c '%U' "$PKGBUILD_DIR")

echo "[$(date)] Rebuilding xkeysnail-git from $PKGBUILD_DIR ..." | tee "$LOGFILE"

cd "$PKGBUILD_DIR"
rm -rf src pkg *.pkg.tar.zst

sudo -u "$OWNER" makepkg -sf --noconfirm 2>&1 | tee -a "$LOGFILE"
pacman -U --noconfirm "$PKGBUILD_DIR"/*.pkg.tar.zst 2>&1 | tee -a "$LOGFILE"

echo "[$(date)] xkeysnail-git rebuild complete." | tee -a "$LOGFILE"
