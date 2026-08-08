cd ~
curl -Lo stylua.zip https://github.com/JohnnyMorganz/StyLua/releases/latest/download/stylua-linux-x86_64.zip
unzip -o stylua.zip
chmod +x stylua
mv stylua ~/.local/bin/stylua
rm stylua.zip
