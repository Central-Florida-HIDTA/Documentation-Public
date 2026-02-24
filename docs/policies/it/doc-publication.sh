#!/usr/bin/env bash
#
# Documentation Publication Script (Template)
#
# Converts Markdown policy documents from a source repo into publishable artifacts
# for a read-only distribution location.
#
# Required environment variables:
#   SOURCE_ROOT - path to source docs folder (example: /path/to/repo/docs)
#   DEST_ROOT   - path to publication output folder
#
# Optional environment variables:
#   SOURCE_EXT  - source file extension (default: md)
#   OUTPUT_EXT  - output file extension (default: pdf)
#   PANDOC_BIN  - pandoc path (default: pandoc in PATH)

set -euo pipefail

SOURCE_ROOT="${SOURCE_ROOT:-}"
DEST_ROOT="${DEST_ROOT:-}"
SOURCE_EXT="${SOURCE_EXT:-md}"
OUTPUT_EXT="${OUTPUT_EXT:-pdf}"
PANDOC_BIN="${PANDOC_BIN:-pandoc}"
PUBLISH_DATE=$(date +"%Y-%m-%d")

if [[ -z "$SOURCE_ROOT" || -z "$DEST_ROOT" ]]; then
  echo "ERROR: SOURCE_ROOT and DEST_ROOT must be set."
  exit 1
fi

if [[ ! -d "$SOURCE_ROOT" ]]; then
  echo "ERROR: Source root not found: $SOURCE_ROOT"
  exit 1
fi

mkdir -p "$DEST_ROOT"

if ! command -v "$PANDOC_BIN" >/dev/null 2>&1; then
  echo "ERROR: pandoc not found: $PANDOC_BIN"
  exit 1
fi

REPO_ROOT=$(cd "$(dirname "$SOURCE_ROOT")" && pwd)
cd "$REPO_ROOT"

GIT_COMMIT=$(git rev-parse --short HEAD 2>/dev/null || echo "unknown")
GIT_BRANCH=$(git rev-parse --abbrev-ref HEAD 2>/dev/null || echo "unknown")

echo "Publishing from branch: $GIT_BRANCH"
echo "Publishing from commit: $GIT_COMMIT"

find "$SOURCE_ROOT" -type f -name "*.${SOURCE_EXT}" | while read -r SRC_FILE; do
  REL_PATH="${SRC_FILE#$SOURCE_ROOT/}"
  REL_OUT_PATH="${REL_PATH%.${SOURCE_EXT}}.${OUTPUT_EXT}"

  DEST_FILE="$DEST_ROOT/$REL_OUT_PATH"
  DEST_DIR="$(dirname "$DEST_FILE")"

  mkdir -p "$DEST_DIR"

  "$PANDOC_BIN" \
    "$SRC_FILE" \
    -o "$DEST_FILE" \
    --metadata title="$(basename "$SRC_FILE" .${SOURCE_EXT})" \
    --metadata date="$PUBLISH_DATE" \
    --metadata git_commit="$GIT_COMMIT"

done

echo "Publication complete: $DEST_ROOT"
