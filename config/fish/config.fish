if status is-interactive
	fish_config theme choose Old\ School
	fish_config prompt choose terlar

	bind \cf $HOME/.dotfiles/scripts/tmux/tmux-nav

	alias vim="nvim"
	alias vimcfg="vim ~/.dotfiles/nvim/.config/nvim/init.lua"
	alias tmn="tmux neww"

	set -gx EDITOR nvim

	# homebrew
	set -gx PATH /opt/homebrew/bin $PATH
	eval (brew shellenv)

	# cargo (rust)
	set -gx PATH $HOME/.cargo/bin $PATH

	$HOME/.dotfiles/scripts/welcome.sh
end

# Generated for envman. Do not edit.
test -s "$HOME/.config/envman/load.fish"; and source "$HOME/.config/envman/load.fish"

# Set Android Home
set -x ANDROID_HOME $HOME/Library/Android/sdk

# Add emulator and platform-tools to the PATH
set -x PATH $PATH $ANDROID_HOME/emulator
set -x PATH $PATH $ANDROID_HOME/platform-tools