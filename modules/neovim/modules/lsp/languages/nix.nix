{inputs, ...}: {
  programs.nvf.settings.vim = {
    lsp = {
      servers.nixd.settings.nixd = {
        nixpkgs.expr = "import ${inputs.nixpkgs} { }";
        options = {
          nixos.expr = ''(builtins.getFlake ("git+file://" + toString ./.)).nixosConfigurations.nixos-btw.options'';
          home-manager.expr = ''(builtins.getFlake ("git+file://" + toString ./.)).homeConfigurations."frdd@nixos-btw".options'';
        };
      };
    };
    languages.nix = {
      enable = true;
      treesitter.enable = true;
      format = {
        enable = true;
        type = ["alejandra"];
      };
      lsp = {
        enable = true;
        servers = ["nixd"];
      };
    };
  };
}
