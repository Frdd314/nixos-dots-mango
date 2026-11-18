{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./modules
  ];

  home = {
    username = "frdd";
    homeDirectory = "/home/frdd";
    stateVersion = "26.05";
  };

  home.sessionVariables = {
    SHELL = "${pkgs.zsh}/bin/zsh";
  };

  home.packages = with pkgs; [
    #apps
    ghostty
    discord
    telegram-desktop
    viber
    localsend
    steam
    protonplus
    thunar
    inputs.freesmlauncher.packages.${system}.freesmlauncher
    onlyoffice-desktopeditors

    #utils
    awww
    swappy
    wl-clipboard
    grim
    slurp
    clipse
    zip
    unzip
    quickshell
    rclone
    gh

    #misc
    fastfetch
    rofi
    yazi
    ripgrep
    fd
    btop
    tree-sitter
    kdePackages.qtdeclarative
  ];

  home.pointerCursor = {
    enable = true;
    name = "Bibata-Modern-Classic";
    size = 20;
    package = pkgs.bibata-cursors;
    gtk.enable = true;
    x11.enable = true;
  };

  gtk = {
    enable = true;
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };
  };

  programs.home-manager.enable = true;
}
