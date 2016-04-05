#!/usr/bin/bash
apt-get install -y ncurses-dev libncurses5-dev python-dev python3-dev \
gtk2-engines-pixbuf ruby-dev git checkinstall exuberant-ctags nodejs npm \
silversearcher-ag
apt-get -y build-dep vim
mkdir -p ~/.vim_my
cd ~/.vim_my
git clone https://github.com/vim/vim.git
cd vim
git fetch
git merge
cd src
make distclean
./configure --enable-python3interp \
	    --enable-pythoninterp \
	    --enable-rubyinterp \
	    --enable-perlinterp \
	    --enable-luainterp \
	    --enable-multibyte \
            --with-python-config-dir=$(python-config --configdir) \
            --with-python3-config-dir=$(python3-config --configdir) \
	    --with-features=huge
#make
#make install
checkinstall -D -y --pkgname=vim --provides=vim
which vim
vim --version
cd ~/.vim_my
rm -rf ~/.vim_my/vim
update-alternatives --install /usr/bin/vim vim /usr/local/bin/vim 1
update-alternatives --install /usr/bin/editor editor /usr/bin/vim 1
update-alternatives --set editor /usr/bin/vim
update-alternatives --install /usr/bin/vi vi /usr/bin/vim 1
update-alternatives --set vi /usr/bin/vim
mkdir -p ~/.vim/bundle/
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
#touch ~/.vimrc
if [ ! -f ~/.vim_my/.vimrc ];
then
    git clone https://github.com/solovyevn/vim_conf.git ~/.vim_my
fi
ln -s ~/.vim_my/.vimrc ~/.vimrc
ln -s ~/.vim_my/ftdetect ~/.vim/ftdetect
ln -s ~/.vim_my/ftplugin ~/.vim/after/ftplugin
mkdir -p ~/.vim/backups
mkdir -p ~/.vim/swaps
mkdir -p ~/.vim/undos
sudo npm install -g tern typescript eslint babel-eslint eslint-plugin-react \
eslint-plugin-jasmine eslint-plugin-backbone eslint-plugin-angular jshint \
jslint
sudo npm install -g git+https://github.com/ramitos/jsctags.git
