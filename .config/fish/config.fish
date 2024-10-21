if status is-interactive
	set fish_greeting
    alias l 'ls -lha'
	set -g fish_color_host brred
	export EDITOR=nvim
	export SHELL=/bin/fish
	export PATH="$PATH:/home/cb/.local/bin"
end
