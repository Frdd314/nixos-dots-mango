{ pkgs, ... }:
{
    programs.nvf = {
        settings.vim = {
            mini = {
                comment.enable = true;
                pairs.enable = true;
                move.enable = true;
            };
            utility = {
                oil-nvim = {
                    enable = true;
                    gitStatus.enable = true;
                    gitStatus.setupOpts = {
                        win_options = {
                            sighcolumn = "yes:2";
                        };
                    };
                };
            };
            statusline.lualine = {
                enable = true;
            };
            lazy = {
                enable = true;
                plugins = with pkgs.vimPlugins; {
                    "smear-cursor.nvim" = {
                        package = smear-cursor-nvim;
                        setupModule = "smear_cursor";
                        setupOpts = {
                            stiffness = 0.8;
                            trailing_stiffness = 0.5;
                            distance_stop_animating = 0.5;

                            legacy_computing_symbols_support = true;
                            distance_stop_animating_vertical_bar = 0.1;
                        };
                    };
                };
            };
        };
    };
}
