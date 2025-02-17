{
  config,
  lib,
  systemInformation,
  ...
}:

{
  hardware.graphics.enable = true;

  home-manager.users."${systemInformation.userName}" =
    { ... }:
    {
      wayland.windowManager.sway =
        let
          modifier = "Mod4";
        in
        {
          enable = true;

          config = {
            inherit modifier;

            focus.followMouse = "no";

            input."*" = {
              tap = "enabled";
              middle_emulation = "enabled";

              xkb_layout = config.nebunix.localization.xkb.layout;
              xkb_variant = lib.mkIf (
                config.nebunix.localization.xkb.variant != ""
              ) config.nebunix.localization.xkb.variant;
            };

            keybindings = {
              "${modifier}+Return" = "exec ${config.nebunix.defaultPrograms.terminal}";
              "${modifier}+f" = "exec ${config.nebunix.defaultPrograms.browser}";

              "${modifier}+j" = "focus down";
              "${modifier}+k" = "focus up";
              "${modifier}+h" = "focus left";
              "${modifier}+l" = "focus right";

              "${modifier}+Shift+j" = "move down";
              "${modifier}+Shift+k" = "move up";
              "${modifier}+Shift+h" = "move left";
              "${modifier}+Shift+l" = "move right";

              "${modifier}+1" = "workspace number 1";
              "${modifier}+2" = "workspace number 2";
              "${modifier}+3" = "workspace number 3";
              "${modifier}+4" = "workspace number 4";
              "${modifier}+5" = "workspace number 5";
              "${modifier}+6" = "workspace number 6";
              "${modifier}+7" = "workspace number 7";
              "${modifier}+8" = "workspace number 8";
              "${modifier}+9" = "workspace number 9";
              "${modifier}+0" = "workspace number 10";

              "${modifier}+Shift+1" = "move container to workspace number 1";
              "${modifier}+Shift+2" = "move container to workspace number 2";
              "${modifier}+Shift+3" = "move container to workspace number 3";
              "${modifier}+Shift+4" = "move container to workspace number 4";
              "${modifier}+Shift+5" = "move container to workspace number 5";
              "${modifier}+Shift+6" = "move container to workspace number 6";
              "${modifier}+Shift+7" = "move container to workspace number 7";
              "${modifier}+Shift+8" = "move container to workspace number 8";
              "${modifier}+Shift+9" = "move container to workspace number 9";
              "${modifier}+Shift+0" = "move container to workspace number 10";

              "${modifier}+v" = "splith";
              "${modifier}+s" = "splitv";

              "${modifier}+Shift+f" = "floating toggle";

              "XF86MonBrightnessDown" = "exec brightnessctl set 5%-";
              "XF86MonBrightnessUp" = "exec brightnessctl set 5%+";

              "XF86AudioMute" = "exec wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
              "XF86AudioLowerVolume" = "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
              "XF86AudioRaiseVolume" = "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+";
            };
          };
        };
    };
}
