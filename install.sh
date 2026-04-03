#!/bin/bash
# install.sh — symlink dotfiles to home directory

DOTFILES="$(cd "$(dirname "$0")" && pwd)"
BACKUP="$HOME/.dotfiles-backup-$(date +%Y%m%d)"

link() {
    local src="$DOTFILES/$1"
    local dst="$HOME/$1"
    local dir="$(dirname "$dst")"

    mkdir -p "$dir"

    if [ -e "$dst" ] && [ ! -L "$dst" ]; then
        mkdir -p "$BACKUP/$dir"
        mv "$dst" "$BACKUP/$dst"
        echo "Backed up $dst"
    fi

    ln -sf "$src" "$dst"
    echo "Linked $1"
}

# Home files
link .zshrc
link .gitconfig
link .Xresources
link .gtkrc-2.0
link .nanorc
link .vim/vimrc

# Config
link .config/i3/config
link .config/picom.conf
link .config/kitty/kitty.conf
link .config/dunst/dunstrc
link .config/rofi/rofidmenu.rasi
link .config/rofi/powermenu.rasi
link .config/rofi/arc_dark_colors.rasi
link .config/rofi/arc_dark_transparent_colors.rasi
link .config/ranger/rc.conf
link .config/mpv/mpv.conf
link .config/mpv/input.conf
link .config/mpv/script-opts/webm.conf
link .config/zathura/zathurarc
link .config/fontconfig/fonts.conf
link .config/gtk-3.0/settings.ini
link .config/nitrogen/nitrogen.cfg

# Polybar
link .config/polybar/config.ini
link .config/polybar/modules.ini
link .config/polybar/custom_modules.ini
link .config/polybar/colors.ini
link .config/polybar/scripts/launch_polybar.sh
link .config/polybar/scripts/polybar_battery.sh
link .config/polybar/scripts/polybar_net_indicator.sh
link .config/polybar/scripts/polybar_net_speed.sh
link .config/polybar/scripts/polybar_weather.sh
link .config/polybar/scripts/system-usb-udev.sh
link .config/polybar/scripts/updates-pacman-aurhelper.sh
link .config/polybar/scripts/colors.sh

echo ""
echo "Done! Backups (if any) saved to $BACKUP"
