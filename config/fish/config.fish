if status is-interactive
	alias v="nvim"
	alias vim="nvim"
	set -gx EDITOR nvim
	fish_vi_key_bindings

	# config shortcuts
	alias vc="v ~/.config/nvim/init.lua"
	alias fc="v ~/.config/fish/config.fish"
	alias ac="v ~/.config/alacritty/alacritty.toml"
	alias tc="v ~/.tmux.conf"

	# trial
	# bind \e 'tmux copy-mode'
	alias gs="git status -s"

	# cargo (rust)
	set -gx PATH $HOME/.cargo/bin $PATH

	# Set Android Home
	set -x ANDROID_HOME $HOME/Library/Android/sdk

	# Add emulator and platform-tools to the PATH
	set -x PATH $PATH $ANDROID_HOME/emulator
	set -x PATH $PATH $ANDROID_HOME/platform-tools

	starship init fish | source

	source ~/.config/fish/functions/git/commands.fish

	bind -M insert \cb gb
	bind -M insert \cg lazygit
	bind -M insert \cf tmux-sessionizer

	$HOME/.dotfiles/tdtele/welcome.sh
end

set --universal nvm_default_version v22.3.0

fish_add_path -g --path /usr/local/go/bin

# Generated for envman. Do not edit.
test -s "$HOME/.config/envman/load.fish"; and source "$HOME/.config/envman/load.fish"
