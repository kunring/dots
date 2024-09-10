Some packages:
```sh
PKGS=("hyprland"
# KDE is used for QT's theme as is defined in Hyprland's config.
# Control the theme from "KDE System Settings".
"plasma-integration" "systemsettings"
"kitty"
"ttf-noto-nerd" "noto-fonts-emoji"
"neovim"
"waybar"
"swaylock"
"python"
"wofi"
"nodejs" "yarn" # Used for some nvim packages
"nwg-look"
"breeze-gtk" # Set GTK theme using nwg-look
# Section for LSP servers used by nvim:
"typescript"
"typescript-language-server"
"lua-language-server"
"pyright"
"rustup"
"deno"
"clang")

pacman -S --needed "${PKGS[@]}"
```

Neovim also uses `rust-analyzer` managed by `rustup`.

Installing `lazy.nvim`, the package manager for nvim:
```sh
DIR="~/.local/share/nvim/lazy"
mkdir -p "$DIR"
cd "$DIR"
git clone --filter=blob:none https://github.com/folke/lazy.nvim.git --branch=stable
```

Place your own wallpaper at `~/.config/hypr/background.png`.
[Source for example wallpaper used in screenshot.png](https://github.com/DaringCuteSeal/wallpapers/blob/gh-pages/os/arch-journey/arch-journey-dark.png).
