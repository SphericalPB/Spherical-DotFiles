{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.hyprland.homeManagerModules.default
    # ./hyprstart.nix
    ./keybinds.nix
    # ./windowrules.nix
    ./pyprland.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    plugins = [
      inputs.hycov.packages.${pkgs.system}.hycov
    ];

    settings = {
      "$mod" = "SUPER";
      "$modShift" = "SHIFT_SUPER";
      "$modAlt" = "ALT SUPER";
      "$shotDir" = "/home/sphericalpb/Pictures/Screenshots/Desktop/$(date -u +%Y-%m-%d_%H%M%S).png";

      exec-once = [
        "sleep 5; swww init"
        "wlsunset -l 13 -L 122"
        "hyprctl set"
      ];
      exec = [
        "hyprctl setcursor 'oreo_catppuccin_mocha_cursors' 24"
      ];

      general = {
        gaps_in = 5;
        gaps_out = 15;
        border_size = 2;
        "col.active_border" = "rgb(b4befe) rgb(a6e3a1) 50deg";
        "col.inactive_border" = "rgb(45475a) rgb(1e1e2e) 50deg";
        allow_tearing = false;
      };

      decoration = {
        rounding = 5;
        dim_inactive = true;
        dim_strength = 0.15;
        dim_special = 0;
        active_opacity = 1.0;
        inactive_opacity = 0.98;
        # Blur !!
        blur = {
          enabled = true;
          new_optimizations = true;
          size = 6;
          passes = 3;
          brightness = 1.0;
          contrast = 1.0;
          noise = 0.02;
          special = false;
        };
        # Shadows
        drop_shadow = false;
        shadow_ignore_window = true;
        shadow_offset = "1 2";
        shadow_range = 10;
        shadow_render_power = 5;
        "col.shadow" = "0x66404040";
      };

      animations = {
        enabled = true;

        animation = "workspaces, 1, 6, default, slidevert";
      };

      dwindle = {
        # keep floating dimentions while tiling
        pseudotile = true;
        preserve_split = true;
      };

      master = {
        new_is_master = true;
      };

      misc = {
        force_default_wallpaper = 0;
        enable_swallow = true;
      };

      input = {
        kb_layout = "us(colemak_dh),ph";
        kb_options = "caps:backspace,shift:both_capslock"; #"grp:alt_shift_toggle";
        follow_mouse = 2;
      };
    };
  };
}
