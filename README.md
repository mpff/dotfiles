# dotfiles

Personal dotfiles for Arch Linux (i3 + polybar).

## Install

### Local (full setup)

```bash
git clone https://github.com/mpff/dotfiles.git ~/dotfiles
bash ~/dotfiles/install.sh
```

Creates symlinks from `~` to the repo. Existing files are backed up to `~/.dotfiles-backup-<date>`.

### Server (minimal, no sudo required)

```bash
git clone https://github.com/mpff/dotfiles.git ~/dotfiles
bash ~/dotfiles/install-ssh.sh
```

Auto-detects zsh and installs oh-my-zsh + plugins if available, falls back to bash otherwise. Sets up vim with vim-plug.

---

## Overview

### Window Manager

**i3** (`.config/i3/config`)
- Mod key: Super (Win)
- Navigation: vim-style (`j/k/b/o`)
- 10 workspaces with app assignments (Firefox→2, Discord→9, Spotify→10)
- i3-gaps: 15px inner, 2px outer gaps
- Gold/brown color scheme (`#cbad2d` focus border)
- Lock screen with blur via scrot + ImageMagick

**picom** (`.config/picom.conf`)
- GLX backend
- Dual Kawase blur, strength 5
- Shadows: 15px radius, 0.75 opacity

**rofi** (`.config/rofi/`)
- App launcher: `rofidmenu.rasi` — Arc Dark, 3-column grid, devicons
- Power menu: `powermenu.rasi` — shutdown, reboot, suspend, lock, logout

**dunst** (`.config/dunst/dunstrc`)
- Right-side notifications, max 5 stacked
- Gold border on critical urgency
- Paper icon theme

**nitrogen** (`.config/nitrogen/nitrogen.cfg`)
- Wallpaper browser: `~/Pictures/Wallpaper/`
- Restored on login via i3 autostart

---

### Status Bar

**polybar** (`.config/polybar/`)

| File | Purpose |
|---|---|
| `config.ini` | Bar layout (two bars: top + bottom) |
| `modules.ini` | Built-in modules (i3, date, CPU, memory, backlight, volume, battery) |
| `custom_modules.ini` | Script-based modules (weather, network, USB, updates) |
| `colors.ini` | Color palette (dark/light grays + accent colors) |

**Top bar:** workspaces — clock — network / brightness / volume / battery

**Bottom bar:** filesystem / memory / CPU / temp — weather — USB / updates / net speed

**Scripts** (`.config/polybar/scripts/`)
- `polybar_weather.sh` — current temp + today high/low via wttr.in (no API key)
- `polybar_battery.sh` — battery status
- `polybar_net_indicator.sh` — network connectivity
- `polybar_net_speed.sh` — real-time upload/download
- `system-usb-udev.sh` — USB device mount/unmount (click to mount)
- `updates-pacman-aurhelper.sh` — pending package updates

---

### Terminal & Shell

**kitty** (`.config/kitty/kitty.conf`)
- Font: JetBrains Mono 10pt
- 20,000 line scrollback
- Image preview protocol (used by ranger)

**zsh** (`.zshrc`)
- oh-my-zsh (system install at `/usr/share/oh-my-zsh`)
- Theme: `simple`
- Plugins: `git`, `colored-man-pages`, `zsh-autosuggestions`, `zsh-syntax-highlighting`

---

### Editor

**vim** (`.vim/vimrc`)
- Plugin manager: vim-plug
- Plugins: vim-airline (with powerline fonts, tabline enabled)
- Per-filetype indent settings (Python/R: 4sp, TeX/YAML/Markdown: 2sp)
- Spell check for `.tex` files (en_gb + de_de)
- Buffer navigation: `[b` / `]b`

---

### File Manager

**ranger** (`.config/ranger/rc.conf`)
- Miller columns (1:3:4 ratio)
- Image preview via kitty protocol
- Git integration
- devicons plugin
- F-key bindings (Midnight Commander style)

---

### Media

**mpv** (`.config/mpv/`)
- Profile: `gpu-hq` with VA-API hardware decoding
- 8GB RAM cache
- Multiple scaling profiles (Ctrl+1–4)
- WebM clip encoder script (Shift+W)
- Screenshots → `~/Pictures/mpv/`

**zathura** (`.config/zathura/zathurarc`)
- PDF viewer
- System clipboard selection

---

### Appearance

**GTK** (`.config/gtk-3.0/settings.ini`, `.gtkrc-2.0`)
- Theme: Arc-Dark
- Icons: Arc-X-D
- Font: Noto Sans 11
- Cursor: capitaine-cursors-light 32px

**Fonts** (`.config/fontconfig/fonts.conf`)
- Primary: JetBrains Mono
- Fallback: devicons → FontAwesome → Weather Icons

**X resources** (`.Xresources`)
- DPI: 144 (HiDPI)
- Cursor: capitaine-cursors-light
- Terminal color scheme (gruvbox-inspired)

---

### Misc

**git** (`.gitconfig`)
- Credential helper: cache
- Line endings: input (Unix)

**nano** (`.nanorc`)
- Syntax highlighting

---

### Server Setup (`ssh/`)

Minimal configs for remote servers (no sudo required):

- `ssh/.zshrc` — oh-my-zsh + autosuggestions + syntax-highlighting
- `ssh/.bashrc` — bash fallback with git prompt
- `ssh/.vim/vimrc` — same as local but without powerline fonts
