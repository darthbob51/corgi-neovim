#!/bin/bash

echo "Installing Neovim with Neovide editor"

brew install neovim
brew install neovide

cp . ~/.config/nvim

alias nvim="neovide"

echo "Successfully setup Neovim with Neovide"

exit 0
