#!/bin/bash
#	Shell script to download and install Vim with the latest patches applied.
#
APPNAME=vim									# app name
APPSDIR=apps								# apps dir
BUILDDIR=build								# build directory
INSTALLPATH=$HOME/$APPSDIR/$APPNAME	# full install path
BUILDPATH=$HOME/$BUILDDIR/$APPNAME	# full build path
COMPILEDBY=johndoe# put your name here to show it with :version
SOURCEURL=ftp://ftp.vim.org/pub/vim/unix/
PATCHESURL=ftp://ftp.vim.org/pub/vim/patches/

# configure it!
./configure \
--enable-gui \
--enable-gnome-check \
--enable-perlinterp \
--enable-pythoninterp \
--enable-rubyinterp \
--enable-cscope \
--enable-multibyte \
--enable-fontset \
--with-features=huge \
--with-compiledby=$COMPILEDBY \
--enable-gui=gnome2
--prefix=$INSTALLPATH

# if there were some erros, get out
if [ "$?" -ne "0" ]; then
	echo Seems there were some problems configuring. 
	echo After fix please run 
	echo make
	echo and
	echo make install
	echo to complete the installation.
	exit 4
fi

# and here we go
make
sudo make install
exit 0
