{
  imports = [
    ./languages/go.nix
    ./languages/nix.nix
  ];

  programs.nvf.settings.vim.lsp = {
    enable = true;
    formatOnSave = true;
  };
}
