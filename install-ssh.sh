#!/bin/bash
# install-ssh.sh — minimal server setup (no sudo required)

DOTFILES="$(cd "$(dirname "$0")" && pwd)"

echo "==> Setting up dotfiles on server..."

# --- Git config ---
cp "$DOTFILES/.gitconfig" "$HOME/.gitconfig"
echo "Linked .gitconfig"

# --- Vim ---
mkdir -p "$HOME/.vim/autoload" "$HOME/.vim/plugged"
cp -r "$DOTFILES/ssh/.vim/vimrc" "$HOME/.vim/vimrc"
if [ ! -f "$HOME/.vim/autoload/plug.vim" ]; then
    echo "==> Installing vim-plug..."
    curl -sfLo "$HOME/.vim/autoload/plug.vim" \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi
echo "Linked vim config — run :PlugInstall inside vim"

# --- Shell ---
if command -v zsh &>/dev/null; then
    echo "==> zsh detected, setting up oh-my-zsh..."

    if [ ! -d "$HOME/.oh-my-zsh" ]; then
        RUNZSH=no CHSH=no sh -c \
            "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    fi

    ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

    if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
        git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions \
            "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
    fi

    if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
        git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting \
            "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
    fi

    cp "$DOTFILES/ssh/.zshrc" "$HOME/.zshrc"
    echo "Done — shell: zsh + oh-my-zsh"
    echo "Run: chsh -s \$(which zsh)  (if you want zsh as default)"
else
    echo "==> zsh not found, falling back to bash..."
    cp "$DOTFILES/ssh/.bashrc" "$HOME/.bashrc"
    echo "Done — shell: bash"
fi

echo ""
echo "==> Setup complete! Start a new shell session to apply changes."
