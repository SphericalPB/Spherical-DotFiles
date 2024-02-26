{inputs, pkgs, ...}: let
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
  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    plugins = [
      inputs.hycov.packages.${pkgs.system}.hycov
    ];

    settings = {
      "$Mod" = "SUPER";
      "$SMod" = "SHIFT_SUPER";

      exec-once = [
        "sleep 5; swww init"
        "wlsunset"
      ];
      #exec = [ "wlsunset" ];
      
      general = {
        gaps_in = 7;
	gaps_out = 15;
        border_size = 2;
	"col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
	"col.inactive_border" = "rgba(595959aa)";
	allow_tearing = false;
      };

      decoration = {
        rounding = 5;
        dim_inactive = true;
	dim_strength = 0.1;
	dim_special = 0;
	active_opacity = 1.0;
	inactive_opacity = 0.95;
	# Blur !!
	blur = {
	  enabled = true;
	  new_optimizations = true;
	  size = 6;
	  passes = 3;
	  brightness = 1.0;
          contrast = 1.0;
          noise = 0.02;
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
        force_default_wallpaper = 1;
	enable_swallow = true;
      };
      
      bind =
        [
          # Compositor Commands
          "$Mod, Q, killactive,"
          "$Mod, C, togglefloating,"
          "$Mod, S, togglesplit,"
          "$Mod, H, movefocus, l"
          "$Mod, J, movefocus, d"
          "$Mod, K, movefocus, u"
          "$Mod, L, movefocus, r"
	  "$Mod, J, workspace, +1"
	  "$Mod, K, workspace, -1"
	  "$Mod, mouse_up, workspace, e+1"
	  "$Mod, mouse_down, workspace, e-1"
	  
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
      
      extraConfig = ''
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
	      hotarea_size = 10 #hotarea size in bottom left,10x10
	      enable_hotarea = 1 # enable mouse cursor hotarea
	      }
	}
	''+''
	# Gromit-MPX Fix (https://www.reddit.com/r/hyprland/comments/18kutkk)
        workspace = special:gromit, gapsin:0, gapsout:0, on-created-empty: gromit-mpx -a
        windowrule = noblur, ^(Gromit-mpx)$
        windowrule = opacity 1 override, 1 override, ^(Gromit-mpx)$
        windowrule = noshadow, ^(Gromit-mpx)$
        windowrule = suppressevent, fullscreen, ^(Gromit-mpx)$
        windowrule = size 100% 100%, ^(Gromit-mpx)$
        bind = SHIFT CTRL, G, togglespecialworkspace, gromit 
	bind = , F8, exec, gromit-mpx --undo
        bind = SHIFT, F8, exec, gromit-mpx --redo
	bind = SHIFT, F9, exec, gromit-mpx --clear
	'';
  };
}
