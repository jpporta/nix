# git config --global user.name "Joao Pedro Pin Porta"
# git config --global user.email jpedro.porta@gmail.com
# git config --global push.autoSetupRemote true
#
# # Update mirror list
# sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bkp
# sudo reflector --verbose --latest 10 --protocol https --sort rate --save /etc/pacman.d/mirrorlist
# sudo pacman -Sy
#
# # ZSH
# # sudo pacman -Sy zsh
# # sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
#
# # ZSH Plugins
# git clone --depth=1 https://github.com/romkatv/powerlevel10k.git /home/jpporta/.oh-my-zsh/custom/themes/powerlevel10k
# git clone https://github.com/zsh-users/zsh-autosuggestions /home/jpporta/.oh-my-zsh/custom/plugins/zsh-autosuggestions
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git /home/jpporta/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
#
# # Packages
# sudo pacman -Sy firefox neovim stow unzip nodejs yarn pavucontrol neofetch zoxide pnpm man lazygit npm \
# 				bluez bluez-utils rofi deno reflector intel-ucode libreoffice-fresh vlc gimp thunderbird \
# 				mako libnotify jq grim slurp wl-clipboard linux-headers \
# 				v4l2loopback-dkms v4l2loopback-utils v4l-utils wev gphoto2 \
# 				tmux ripgrep inetutils fzf python-pip tree-sitter fd composer glow docker openvpn
# YAY
pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
yay waybar swww spotify slack-desktop zoom tmuxinator discord bun-bin hyprlock hypridle swappy luarocks compose php jdk julia ttf-twemoji dbeaver xdg-desktop-portal-gnome obsidian bat eslint -Sy
