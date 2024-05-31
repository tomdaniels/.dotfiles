if status is-interactive
	fish_config theme choose Base16\ Eighties

	bind \e 'tmux copy-mode'
	# bindings for tmux nav, need both Normal and Insert mode
	bind \cf $HOME/.dotfiles/scripts/tmux/tmux-nav
	bind -M insert \cf $HOME/.dotfiles/scripts/tmux/tmux-nav

	alias v="nvim"
	alias vim="nvim"
	alias gv="v ~/.config/nvim/init.lua"
	set -gx EDITOR nvim
	fish_vi_key_bindings

	# homebrew
	set -gx PATH /opt/homebrew/bin $PATH
	eval (brew shellenv)

	# cargo (rust)
	set -gx PATH $HOME/.cargo/bin $PATH

	starship init fish | source
	$HOME/.dotfiles/scripts/welcome.sh
end

# Generated for envman. Do not edit.
test -s "$HOME/.config/envman/load.fish"; and source "$HOME/.config/envman/load.fish"

# Set Android Home
set -x ANDROID_HOME $HOME/Library/Android/sdk

# Add emulator and platform-tools to the PATH
set -x PATH $PATH $ANDROID_HOME/emulator
set -x PATH $PATH $ANDROID_HOME/platform-tools
