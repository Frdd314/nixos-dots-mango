{ config, pkgs, ... }:

{
  imports = [
    ./mango
    ./kitty
    ./bash
    ./zsh
    ./vim
#    ./starship
    ./spicetify
    ./quickshell
    ./nvf
  ];
}
