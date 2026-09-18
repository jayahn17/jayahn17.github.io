#!/usr/bin/env bash
set -euo pipefail

# Install Ruby toolchain (idempotent; apt is a no-op if already present).
sudo apt-get update -y
sudo apt-get install -y --no-install-recommends \
  ruby-full ruby-dev build-essential zlib1g-dev

# Ensure Bundler is available.
if ! command -v bundle >/dev/null 2>&1; then
  sudo gem install bundler --no-document
fi

# Install project gems into a repo-local path (matches README guidance).
bundle config set --local path 'vendor/bundle'
bundle install
