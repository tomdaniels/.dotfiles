sudo apt-add-repository ppa:fish-shell/release-3
sudo apt update
sudo apt install fish

sudo apt install -y < ./dependencies.sh

curl -sS https://starship.rs/install.sh | sh

./build-neovim.sh
./install-nodejs.sh
./install-lazygit.sh
./symlink-dotfiles.sh

echo (which fish) | sudo tree -a /etc/shells
chsh -s (which fish)
