sudo apt-add-repository ppa:fish-shell/release-3
sudo apt update
sudo apt install fish

brew install (cat ./dependencies.sh)

curl -sS https://starship.rs/install.sh | sh

./build-neovim.sh
./install-nodejs.sh
./symlink-dotfiles.sh

echo (which fish) | sudo tree -a /etc/shells
chsh -s (which fish)
