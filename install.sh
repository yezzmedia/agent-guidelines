#!/usr/bin/env bash

set -euo pipefail

repo_url="${AGENT_GUIDELINES_REPO_URL:-https://github.com/yezzmedia/agent-guidelines.git}"
repo_ref="${AGENT_GUIDELINES_REF:-}"
target_dir="./.ai/guidelines"
temp_dir=""

cleanup() {
  if [[ -n "$temp_dir" && -d "$temp_dir" ]]; then
    rm -rf "$temp_dir"
  fi
}

require_command() {
  if ! command -v "$1" >/dev/null 2>&1; then
    printf 'Error: %s is required.\n' "$1" >&2
    exit 1
  fi
}

trap cleanup EXIT

require_command git
require_command mktemp
require_command php

if [[ ! -f "./artisan" ]]; then
  printf 'Error: run this script from the root of a Laravel project.\n' >&2
  exit 1
fi

temp_dir="$(mktemp -d "${TMPDIR:-/tmp}/agent-guidelines.XXXXXX")"

printf 'Cloning agent guidelines from %s\n' "$repo_url"

clone_args=(--depth=1)

if [[ -n "$repo_ref" ]]; then
  clone_args+=(--branch "$repo_ref")
fi

git clone "${clone_args[@]}" "$repo_url" "$temp_dir"

printf 'Copying GUIDELINES.md into %s\n' "$target_dir"
mkdir -p "$target_dir"
cp "$temp_dir/GUIDELINES.md" "$target_dir/GUIDELINES.md"

printf 'Refreshing Laravel Boost files\n'
php artisan boost:update

printf 'Done. GUIDELINES.md was installed into %s and Laravel Boost was updated.\n' "$target_dir"
