#!/usr/bin/env bash

# Set font of terminal
font_dir=~/.local/share/fonts
mkdir -p ${font_dir}
cp ./font/* ${font_dir}


# Restore terminal cfg
dconf load /org/gnome/terminal/ < ./conf/gnome_terminal_settings_backup.txt

# Backup terminal cfg
# dconf dump /org/gnome/terminal/ > gnome_terminal_settings_backup.txt

# Reset terminal cfg
# dconf reset -f /org/gnome/terminal/

# Ref: https://askubuntu.com/questions/967517/backup-gnome-terminal

# zsh
sudo apt install -y zsh

# autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# deploy rc file
rm ~/.zshrc && ln -s `pwd`/conf/zshrc ~/.zshrc

# navi
bash <(curl -sL https://raw.githubusercontent.com/denisidoro/navi/master/scripts/install)
