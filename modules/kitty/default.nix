{ config, pkgs, ... }:
{
	programs.kitty = {
		enable = true;
		font = {
			name = "JetBrainsMono Nerd Font";
			size = 12;
		};
		settings = {
			foreground = "#CAD3F5";
            background = "#050a1e";

            selection_foreground = "#1e293b";          
            selection_background = "#cbd5e1";

			background_opacity = 0.75;
            background_blur = 1;
            
            confirm_os_window_close = 0;

            shell = "zsh";
		};
    };
}
