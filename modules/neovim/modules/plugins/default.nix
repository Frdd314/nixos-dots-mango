{
  imports = [
    ./smear-cursor.nix
    ./oil.nix
    ./lualine.nix
    ./blink-cmp.nix
    ./nvim-dap.nix
    ./nvim-lint.nix
  ];
  programs.nvf = {
    settings.vim = {
      mini = {
        comment.enable = true;
        pairs.enable = true;
        move.enable = true;
      };

      lazy.enable = true;
    };
  };
}
