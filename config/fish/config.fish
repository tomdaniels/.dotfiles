if status is-interactive
	fish_config theme choose Base16\ Eighties

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

	# git branch workflow - ctrl b
	bind \cB gb
	bind -M insert \cB gb

	# fzf tmux session jumper - ctrl f
	bind \cf $HOME/.dotfiles/scripts/tmux/tmux-nav
	bind -M insert \cf $HOME/.dotfiles/scripts/tmux/tmux-nav


	$HOME/.dotfiles/scripts/welcome.sh
end

# Generated for envman. Do not edit.
test -s "$HOME/.config/envman/load.fish"; and source "$HOME/.config/envman/load.fish"
