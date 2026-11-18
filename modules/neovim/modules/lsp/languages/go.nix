{
    programs.nvf.settings.vim = {
        languages.go = {
            enable = true;
            treesitter.enable = true;
            format = {
                enable = true;
                type = [ "gofmt" "injected" ];
            };
            lsp = {
                enable = true;
                servers = [ "gopls" ];
            };
            extraDiagnostics = {
                enable = true;
                types = [ "golangci-lint" ];
            };
            # dap = {
            #     enable = true;
            #     debugger = "delve";
            # };
            extensions = {
                gopher-nvim.enable = true;
            };
        };
    };
}
