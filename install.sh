#!/usr/bin/env bash

set -euo pipefail

repo_ref="${AGENT_GUIDELINES_REF:-main}"
source_url="${AGENT_GUIDELINES_SOURCE_URL:-https://raw.githubusercontent.com/yezzmedia/agent-guidelines/${repo_ref}/GUIDELINES.md}"
access_url="${AGENT_ACCESS_SOURCE_URL:-https://raw.githubusercontent.com/yezzmedia/agent-guidelines/${repo_ref}/ACCESS.md}"
target_dir="./.ai/guidelines"

require_command() {
  if ! command -v "$1" >/dev/null 2>&1; then
    printf 'Error: %s is required.\n' "$1" >&2
    exit 1
  fi
}

require_command curl
require_command php

if [[ ! -f "./artisan" ]]; then
  printf 'Error: run this script from the root of a Laravel project.\n' >&2
  exit 1
fi

printf 'Downloading GUIDELINES.md from %s\n' "$source_url"
mkdir -p "$target_dir"
curl -fsSL "$source_url" -o "$target_dir/GUIDELINES.md"

if [[ ! -f "$target_dir/ACCESS.md" ]]; then
  printf 'Downloading ACCESS.md from %s\n' "$access_url"
  curl -fsSL "$access_url" -o "$target_dir/ACCESS.md"
else
  printf 'ACCESS.md already exists in %s, skipping download.\n' "$target_dir"
fi

printf 'Refreshing Laravel Boost files\n'
php artisan boost:update

printf 'Done. Guidelines were installed into %s and Laravel Boost was updated.\n' "$target_dir"
