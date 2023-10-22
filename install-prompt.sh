#!/bin/bash

mkdir -p "$HOME/.zsh"
git clone --depth=1 https://github.com/spaceship-prompt/spaceship-prompt.git "$HOME/.zsh/spaceship"

echo "source "$HOME/.zsh/spaceship/spaceship.zsh"" >> zshrc/.zshrc
