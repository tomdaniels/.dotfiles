cd ~
curl -Lo tree-sitter-cli-linux-x64.zip https://github.com/tree-sitter/tree-sitter/releases/latest/download/tree-sitter-cli-linux-x64.zip
unzip -o tree-sitter-cli-linux-x64.zip
chmod +x tree-sitter
mv tree-sitter ~/.local/bin/tree-sitter
rm tree-sitter-cli-linux-x64.zip
