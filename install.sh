#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
ln -sfnv "${SCRIPT_DIR}"/.zshrc ~
ln -sfnv "${SCRIPT_DIR}"/.config/ ~

# brew install mise watch tree fzf git sheldon kubectl minikube neovim raycast
