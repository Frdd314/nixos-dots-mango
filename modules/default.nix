{ config, pkgs, ... }:

{
  imports = [
    ./mango
    ./kitty
    ./bash
    ./zsh
    ./vim
    ./spicetify
    ./quickshell
    ./neovim
  ];
}
