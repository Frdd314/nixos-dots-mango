{
  config,
  pkgs,
  ...
}: {
  programs.vim = {
    enable = true;
    settings = {
      tabstop = 4;
      shiftwidth = 4;
      expandtab = true;
      number = true;
      relativenumber = true;
    };

    plugins = with pkgs.vimPlugins; [
      vim-nix
    ];
  };
}
