#!/bin/sh
# mirror
tmp="`cat /etc/apt/sources.list | grep \"https://mirrors.ustc.edu.cn/debian\"`"
echo $tmp
if [ -z "$tmp" ];then
	echo "Use ustc mirror."
    sudo apt install apt-transport-https -y
    sudo cp /etc/apt/sources.list /etc/apt/sources.list.bk
    sudo sed -i 's|http://deb.debian.org|https://mirrors.ustc.edu.cn|g' /etc/apt/sources.list
    sudo sed -i 's|http://security.debian.org/debian-security|http://mirrors.ustc.edu.cn/debian-security|g' /etc/apt/sources.list
	sudo sudo apt-get update
	sudo sudo apt-get upgrade -y
fi

# Tools
sudo apt install vim git cmake curl zsh wget -y

# Install oh-my-zsh
if [ ! -d "$HOME/.oh-my-zsh" ];then
	echo "Install oh-my-zsh"
    # sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    # sh -c "$(curl -fsSL https://gitee.com/pocmon/ohmyzsh/raw/master/tools/install.sh)"
	wget https://gitee.com/mirrors/oh-my-zsh/raw/master/tools/install.sh
	chmod +x install.sh
	sed -i 's|REPO=${REPO:-ohmyzsh/ohmyzsh}|REPO=${REPO:-mirrors/oh-my-zsh}|' install.sh
	sed -i 's|REMOTE=${REMOTE:-https://github.com/${REPO}.git}|REMOTE=${REMOTE:-https://gitee.com/${REPO}.git}|' install.sh
	./install.sh
	rm -rf install.sh*
fi

exit 0
