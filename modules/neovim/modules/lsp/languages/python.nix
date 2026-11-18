{
  programs.nvf.settings.vim = {
    languages.python = {
      enable = true;
      treesitter.enable = true;
      format = {
        enable = true;
        type = ["ruff"];
      };
      lsp = {
        enable = true;
        servers = ["pyright"];
      };
      dap = {
        enable = true;
        debugger = ["debugpy"];
      };
      extraDiagnostics = {
        enable = true;
        types = ["mypy"];
      };
    };
  };
}
