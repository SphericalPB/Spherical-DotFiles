let
  screenshotarea = "hyprctl keyword animation 'fadeOut,0,0,default'; grimblast --notify --freeze copysave area $shotDir; hyprctl keyword animation 'fadeOut,1,4,default'";

  # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
  workspaces = builtins.concatLists (builtins.genList (
      x: let
        ws = let
          c = (x + 1) / 10;
        in
          builtins.toString (x + 1 - (c * 10));
      in [
        "$mod, ${ws}, workspace, ${toString (x + 1)}"
        "$modShift, ${ws}, movetoworkspace, ${toString (x + 1)}"
      ]
    )
    10);
in {
  wayland.windowManager.hyprland = {
    settings = {
      "$shotDir" = "~/Pictures/Screenshots/Desktop/$(date -u +%Y-%m-%d_%H%M%S)";
      bind =
        [
          # Compositor Commands
          "$mod, Q, killactive,"
          "$mod, C, togglefloating,"
          "$mod, S, togglesplit,"
          "$modAlt, N, movefocus, l"
          "$modAlt, E, movefocus, d"
          "$modAlt, I, movefocus, u"
          "$modAlt, O, movefocus, r"
          "$mod, E, workspace, +1"
          "$mod, I, workspace, -1"
          "$mod, mouse_down, workspace, e-1"
          "$mod, mouse_up, workspace, e+1"

          # Hyprctl
          "$mod, F11, exec, hyprctl switchxkblayout evision-rgb-keyboard 1; notify-send -t 3000 'Using QWERTY Layout'"
          "$mod, F12, exec, hyprctl switchxkblayout evision-rgb-keyboard 0; notify-send -t 3000 'Using Colemak Layout'"

          # Utility Commands
          "$modShift, Q, exec, wlogout"
          "ALT, Space, exec, rofi -show drun"
          "$mod, D, exec, notify-send 'Color Stolen! >:D' $(hyprpicker --autocopy)"
          "$mod, Return, exec, kitty"
          "$modShift, F, exec, vivaldi"
          "$modShift, E, exec, nemo"

          # Screenshot
          # Fullscreen Screenshot
          ", Print, exec, grimblast --notify --cursor copysave output $shotDir"
          # Select Area Screenshot
          # stop animations while screenshotting; makes black border go away --fufexan
          "CTRL, Print, exec, ${screenshotarea}"
          # Annotate Select Area
          "$mod, Print, exec, grimplast save area - | swappy -f -"
        ]
        ++ workspaces;

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];

      bindl = [
        # media controls
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPrev, exec, playerctl previous"
        ", XF86AudioNext, exec, playerctl next"

        # volume
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ", XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
      ];

      bindle = [
        # Volume Control
        ", XF86AudioRaiseVolume, exec, wpctl set-volume -l '1.0' @DEFAULT_AUDIO_SINK@ 6%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume -l '1.0' @DEFAULT_AUDIO_SINK@ 6%-"
      ];
    };

    extraConfig =
      ''
           # Hycov config
           bind = ALT,tab,hycov:toggleoverview
           bind = ALT,left,hycov:movefocus,l
           bind = ALT,right,hycov:movefocus,r
           bind = ALT,up,hycov:movefocus,u
           bind = ALT,down,hycov:movefocus,d

           plugin {
             hycov {
               overview_gappo = 60 #gaps width from screen
               overview_gappi = 24 #gaps width from clients
               hotarea_size = 0 #hotarea size in bottom left,10x10
               hotarea_pos = 4
               enable_hotarea = 0 # enable mouse cursor hotarea
        enable_alt_release_exit = 1
        alt_toggle_auto_next = 0
             }
           }
      ''
      + ''
        # Gromit-MPX Fix (https://www.reddit.com/r/hyprland/comments/18kutkk)
        bind = SHIFT CTRL, G, togglespecialworkspace, gromit
        bind = , F8, exec, gromit-mpx --undo
        bind = SHIFT, F8, exec, gromit-mpx --redo
        bind = SHIFT, F9, exec, gromit-mpx --clear
      '';
  };
}
