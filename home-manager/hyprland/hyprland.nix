{ inputs, ... }:

let
  screenshotarea = "hyprctl keyword animation 'fadeOut,0,0,default'; grimblast --notify copysave area; hyprctl keyword animation 'fadeOut,1,4,default'";


# binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
  workspaces = builtins.concatLists (builtins.genList (
      x: let
        ws = let
          c = (x + 1) / 10;
        in
          builtins.toString (x + 1 - (c * 10));
      in [
        "$Mod, ${ws}, workspace, ${toString (x + 1)}"
        "$SMod, ${ws}, movetoworkspace, ${toString (x + 1)}"
      ]
    )
    10);

in {
  
  imports = 
  [ 
  ./gromit-mpx.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "$Mod" = "SUPER";
      "$SMod" = "SHIFT_SUPER";
      
      exec-once = [
        "swww init; swww img ~/.config/nix-conf/home-manager/hyprland/background.png"
        "wlsunset"
	];
      #exec = [ "wlsunset" ];
      


      dwindle = {
        # keep floating dimentions while tiling
        pseudotile = true;
        preserve_split = true;
      };
      
      bind = [
        # Compositor Commands
        "$Mod, Q, killactive,"
        "$Mod, C, togglefloating," 
        "$Mod, S, togglesplit,"
	"$Mod, H, movefocus, l"
	"$Mod, J, movefocus, d"
        "$Mod, K, movefocus, u"
        "$Mod, L, movefocus, r"
	# Utility Commands
        "$SMod, Q, exec, wlogout"
        "ALT, Space, exec, rofi -show drun"
        "$Mod, Return, exec, kitty"
        "$SMod, F, exec, vivaldi"
        "$SMod, E, exec, nemo"

        # screenshot
        # stop animations while screenshotting; makes black border go away
        ", Print, exec, grimblast --notify --cursor copysave output"

	#"CTRL, Print, exec, ${screenshotarea}"
         
        #"CTRL, Print, exec, grimblast --notify --cursor copysave output"
        #"$Mod SHIFT CTRL, R, exec, grimblast --notify --cursor copysave output"

        #"ALT, Print, exec, grimblast --notify --cursor copysave screen"
        #"$Mod SHIFT ALT, R, exec, grimblast --notify --cursor copysave screen"

      ]
      
      ++ workspaces;
      
      bindm = [
        "$Mod, mouse:272, movewindow"
        "$Mod, mouse:273, resizewindow"
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
  };
  
}
