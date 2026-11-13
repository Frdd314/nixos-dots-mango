{ config, pkgs, inputs, ... }:

{
  imports = [
    inputs.nvf.homeManagerModules.default
  ];

    programs.nvf = {
        enable = true;
        settings.vim = {
            viAlias = false;
            vimAlias = false;
            enableLuaLoader = true;

            options = {
                number = true;
                relativenumber = true;

                tabstop = 4;
                shiftwidth = 4;
                expandtab = true;
            };

            theme = {
                enable = true;
                name = "tokyonight";
                style = "moon";
                transparent = true;
            };

            lazy = {
                enable = true;
                plugins = with pkgs.vimPlugins; {
                    "nvim-autopairs" = {
                        package = nvim-autopairs;
                        setupModule = "nvim-autopairs";
                    };
                    "lualine.nvim" = {
                        package = lualine-nvim;
                        setupModule = "lualine";
                        setupOpts = {
                            theme = "tokyonight";
                        };
                    };
                    "oil.nvim" = {
                        package = oil-nvim;
                        setupModule = "oil";
                        setupOpts = {
                            show_hidden = true;
                        };
                    };
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

            globals.mapleader = " ";
            keymaps = [
                {
                    key = "<leader>cd";
                    mode = "n";
                    action = "<cmd>Oil<CR>";
                }
                {
                    key = "<Esc>";
                    mode = "n";
                    action = "<cmd>nohlsearch<CR>";
                }
            ];
        };
    };
}


