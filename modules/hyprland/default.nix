{ config, pkgs, hyprland, ... }:

{
  imports = [
    hyprland.homeManagerModules.default
    ./plugins
  ];

  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland.settings = {
    monitor = {
      output = "";
      mode = "1920x1080@75";
      position = "auto";
      scale = "auto";
    };

    config = {
      general = {
        gaps_in = 3;
        gaps_out = 14;
        border_size = 0;

                #Color
                col = {
                  active_border = { colors = ["rgba(1e293b99)" "rgba(0f172acc)"]; angle = 45; };
                  inactive_border = "rgba(595959aa)";
                };
              };

              decoration = {
                rounding = 10;
                active_opacity = 1.0;
                inactive_opacity = 0.9;

                blur = {
                  enabled = true;
                  size = 8;
                  passes = 1;
                  vibrancy = 0.3;
                };
              };
              input = {
                kb_layout = "us,ru";
                kb_variant = "";
                kb_options = "grp:alt_shift_toggle";
                repeat_delay = 200;
              };
            };
          };
          wayland.windowManager.hyprland.extraConfig = ''
            hl.on("hyprland.start", function ()
            hl.exec_cmd("hyprctl setcursor Bibata-Modern-Classic 20")
            hl.exec_cmd("xsetroot -cursor_name Bibata-Modern-Classic || true")
            hl.exec_cmd("clipse -listen")
            end)

            hl.env("HYPRCURSOR_THEME", "Bibata-Modern-Classic")
            hl.env("HYPRCURSOR_SIZE", "20")
            hl.env("XCURSOR_THEME", "Bibata-Modern-Classic")
            hl.env("XCURSOR_SIZE", "20")

            hl.curve("ease", {type = "bezier", points = { {0.4, 0.02}, {0.21, 1} }})

            hl.animation({ leaf = "windows", enabled = true, speed = 3.5, bezier = "ease", style = "slide"})
            hl.animation({ leaf = "windowsOut", enabled = true, speed = 3.5, bezier = "ease", style = "slide"})
            hl.animation({ leaf = "border", enabled = true, speed = 6, spring = "default"})
            hl.animation({ leaf = "fade", enabled = true, speed = 3, bezier = "ease"})
            hl.animation({ leaf = "workspaces", enabled = true, speed = 3.5, bezier = "ease"})

            local mainMod = "SUPER"

            hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd("kitty"))
            local closeWindowBind = hl.bind(mainMod .. " + C", hl.dsp.window.close())
            hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("firefox"))
            hl.bind(mainMod .. " + Space", hl.dsp.exec_cmd("rofi -show drun"))

            for i = 1, 10 do
            local key = i % 10
            hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
            hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
            end


            hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
            hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
            hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ action = "toggle" }))
            hl.bind(mainMod .. " + SHIFT + V", hl.dsp.window.float({ action = "toggle" }))

            hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
            hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
            hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
            hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

            hl.bind("PRINT", hl.dsp.exec_cmd("hyprshot -m region -z --clipboard-only"))
            hl.bind(mainMod .. " + SHIFT + PRINT", hl.dsp.exec_cmd("hyprshot -m window -z --clipboard-only"))
            hl.bind(mainMod .. " + V", hl.dsp.exec_cmd("kitty clipse"))
          '';

        }
