#!/bin/sh

# mirror
tmp="`cat /etc/pacman.d/mirrorlist | grep \"mirrors.ustc.edu.cn/archlinux\"`"
echo $tmp
if [ -z "$tmp" ];then
	echo "Use ustc mirror."
	sudo sed -i '1 i\Server = https://mirrors.ustc.edu.cn/archlinux/$repo/os/$arch' /etc/pacman.d/mirrorlist
	sudo pacman -Sy
	sudo pacman-key --init
	sudo pacman-key --populate archlinux
	#sudo pacman-key --refresh-keys
fi

# archlinuxcn
tmp="`cat /etc/pacman.conf | grep \"archlinuxcn\"`"
echo $tmp
if [ -z "$tmp" ];then
	echo "Add archlinuxcn mirror."
	sudo sed -i '$a\[archlinuxcn]' /etc/pacman.conf
	sudo sed -i '$a\Server = https://mirrors.ustc.edu.cn/archlinuxcn/$arch' /etc/pacman.conf
	sudo pacman -Sy
	sudo pacman -S archlinuxcn-keyring
fi

sudo pacman -Syyu
sudo pacman -S vim git cmake curl zsh wget

# Install oh-my-zsh
if [ ! -d "$HOME/.oh-my-zsh" ];then
	echo "Install oh-my-zsh"
	wget https://gitee.com/mirrors/oh-my-zsh/raw/master/tools/install.sh
	chmod +x install.sh
	sed -i 's/REPO=${REPO:-ohmyzsh\/ohmyzsh}/REPO=${REPO:-mirrors\/oh-my-zsh}/' install.sh
	sed -i 's/REMOTE=${REMOTE:-https:\/\/github.com\/${REPO}.git}/REMOTE=${REMOTE:-https:\/\/gitee.com\/${REPO}.git}/' install.sh
	./install.sh
	rm -rf install.sh*
fi

# Chinease support
#tmp="`cat $HOME/.zshrc | grep \"=zh_CN.UTF-8\"`"
#echo $tmp
#if [ -z "$tmp" ];then
#	echo "Modfi language"
#	sed -i '$a\export LANG=zh_CN.UTF-8' $HOME/.zshrc
#	sed -i '$a\export LANGUAGE=zh_CN.UTF-8' $HOME/.zshrc
#	sed -i '$a\export LC_ALL=zh_CN.UTF-8' $HOME/.zshrc
#fi
