#!/usr/bin/env bash
set -euo pipefail
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
ln -sfn "$DIR" ~/.dotfiles
exec sudo nix run nix-darwin/nix-darwin-26.05#darwin-rebuild -- \
  switch --flake "$HOME/.dotfiles#mac"
