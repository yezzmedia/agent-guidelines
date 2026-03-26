#!/usr/bin/env bash

set -euo pipefail

repo_ref="${AGENT_GUIDELINES_REF:-main}"
source_url="${AGENT_GUIDELINES_SOURCE_URL:-https://raw.githubusercontent.com/yezzmedia/agent-guidelines/${repo_ref}/GUIDELINES.md}"
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

printf 'Refreshing Laravel Boost files\n'
php artisan boost:update

printf 'Done. GUIDELINES.md was installed into %s and Laravel Boost was updated.\n' "$target_dir"
