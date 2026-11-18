{pkgs, ...}: {
  programs.nvf.settings.vim.lazy.plugins = with pkgs.vimPlugins; {
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
}
