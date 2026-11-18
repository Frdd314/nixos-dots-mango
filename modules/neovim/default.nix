{inputs, ...}: {
  imports = [
    inputs.nvf.homeModules.default
    ./modules
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
