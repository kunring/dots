Some packages:
```sh
PKGS=("hyprland"
"kitty"
"ttf-iosevkaterm-nerd"
"neovim"
"waybar"
"python"
"wofi"
"nodejs" "yarn" # Used for some nvim packages
# Section for LSP servers used by nvim:
"typescript"
"lua-language-server"
"pyright"
"rustup"
"deno"
"clang")

pacman -S --needed "${PKGS[@]}"
```

Neovim also uses `rust-analyzer` managed by `rustup`.

Place your own wallpaper at `~/.config/hypr/background.png`.
[Source for example wallpaper used in screenshot.png](https://github.com/DaringCuteSeal/wallpapers/blob/gh-pages/os/arch-journey/arch-journey-dark.png).
