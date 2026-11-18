{
  config,
  pkgs,
  hyprland,
  ...
}: {
  services.hyprpaper = {
    enable = true;
    settings = {
      splash = false;
      wallpaper = [
        {
          monitor = "HDMI-A-1";
          path = "/home/frdd/walls/kitty.jpg";
        }
      ];
    };
  };
}
