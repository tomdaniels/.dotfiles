cd ~
git clone https://github.com/neovim/neovim ~/.local/src/neovim
cd ~/.local/src/neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
