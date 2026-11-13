{ ... }:
{
  programs.neovim = {
    enable = false;
  };
  xdg.configFile."nvim".source = ./config;
}
