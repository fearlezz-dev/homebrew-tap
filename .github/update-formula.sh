#!/usr/bin/env bash
# Points Formula/fearlezz.rb at a Fearlezz release: version, URLs and sha256 values.
# Usage: update-formula.sh vX.Y.Z   (needs curl; reads the .sha256 asset of each tarball)
set -euo pipefail

tag="${1:?usage: update-formula.sh vX.Y.Z}"
formula="$(dirname "$0")/../Formula/fearlezz.rb"
base="https://github.com/fearlezz-dev/fearlezz/releases/download/$tag"

declare -A sums
for target in aarch64-apple-darwin x86_64-apple-darwin aarch64-unknown-linux-musl x86_64-unknown-linux-musl; do
  sums[$target]="$(curl -fsSL "$base/fearlezz-$target.tar.gz.sha256" | cut -d' ' -f1)"
  [[ ${sums[$target]} =~ ^[0-9a-f]{64}$ ]] || { echo "bad sha256 for $target" >&2; exit 1; }
done

tmp="$(mktemp)"
current=""
while IFS= read -r line; do
  if [[ $line =~ ^([[:space:]]*)version\  ]]; then
    line="${BASH_REMATCH[1]}version \"${tag#v}\""
  elif [[ $line =~ ^([[:space:]]*)url\ \".*/fearlezz-(.+)\.tar\.gz\" ]]; then
    current="${BASH_REMATCH[2]}"
    line="${BASH_REMATCH[1]}url \"$base/fearlezz-$current.tar.gz\""
  elif [[ $line =~ ^([[:space:]]*)sha256\  ]]; then
    line="${BASH_REMATCH[1]}sha256 \"${sums[$current]}\""
  fi
  printf '%s\n' "$line"
done < "$formula" > "$tmp"
cat "$tmp" > "$formula"
rm "$tmp"
