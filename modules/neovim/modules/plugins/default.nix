{ ... }:
{
    imports = [
    ];

    vim = {
        lsp.enable = true;
        treesitter.vendorCLI = true;
        mini = {
            comment.enable = true;
            move.enable = true;
            surround.enable = true;
            pairs.enable = true;
            align.enable = true;
        };

    }
}
