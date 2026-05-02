#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
DIST_DIR="$ROOT_DIR/dist"

rm -rf "$DIST_DIR"
mkdir -p "$DIST_DIR"

TMP_DIR="$(mktemp -d)"
trap 'rm -rf "$TMP_DIR"' EXIT

mkdir -p "$TMP_DIR/package"
rsync -a --exclude '.DS_Store' "$ROOT_DIR/arduino/" "$TMP_DIR/package/arduino/"
rsync -a --exclude '.DS_Store' "$ROOT_DIR/microPython/" "$TMP_DIR/package/microPython/"

cd "$TMP_DIR/package"
zip -qr "$DIST_DIR/blockgpt-firmwares.zip" .

echo "Firmware release archive created in $DIST_DIR"
