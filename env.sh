#!/usr/bin/env zsh

#TODO: determine if mackup backup needs to run first, as it will create the $HOME.mackup.cfg, overwriting the symlink
ln -s $HOME/.dotfiles.mackup.cfg $HOME/.mackup.cfg