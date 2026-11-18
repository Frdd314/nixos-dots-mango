{
  programs.nvf.settings.vim = {
    languages.lua = {
      enable = true;
      treesitter.enable = true;
      format = {
        enable = true;
        type = ["stylua"];
      };
      lsp = {
        enable = true;
        servers = ["lua-language-server"];
      };
      extraDiagnostics = {
        enable = true;
        types = ["luacheck" "selene"];
      };
    };
  };
}
