{
  imports = [
    ./languages/go.nix
    ./languages/nix.nix
    ./languages/python.nix
  ];

  programs.nvf.settings.vim.lsp = {
    enable = true;
    formatOnSave = true;
  };
}
