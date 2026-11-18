{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./mango
    ./kitty
    ./ghostty
    ./bash
    ./zsh
    ./vim
    ./spicetify
    ./quickshell
    ./neovim
  ];
}
