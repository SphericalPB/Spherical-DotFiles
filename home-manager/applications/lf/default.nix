{
  pkgs,
  config,
  ...
}: {
  xdg.configFile."lf/icons".source = ./icons;

  programs.lf = {
    enable = true;
    settings = {
      icons = true;
      drawbox = true;
      preview = true;
    };

    commands = {
      dragon-out = ''%xdragon -a -x "$fx"''; # dragon for drag n' drop on the terminal
      editor-open = ''$$EDITOR $f'';
      mkdir = ''
        ''${{
          printf "Directory Name: "
          read DIR
          mkdir $DIR
        }}
      '';
      toggle_preview = ''%{{
    if [ "$lf_preview" = "true" ]; then
        lf -remote "send $id :set preview false; set ratios 1:5"
    else
        lf -remote "send $id :set preview true; set ratios 1:2:3"
    fi
}}'';
      setwallpaper = ''%ln -s "$f" ~/.config/nix-conf/home-manager/applications/hypr/background.png'';
    };

    keybindings = {
       "\\\"" = "";
      o = "";
      c = "mkdir";
      "." = "set hidden!";
      "`" = "mark-load";
      "\\'" = "mark-load";
      "<enter>" = "open";
      
      do = "dragon-out";
      ee = "editor-open";
      md = "mkdir";
      zp = "toggle-preview";
      st = "setwallpaper"
    };

    previewer = {
      keybinding = "p";
      source = pkgs.writeShellScriptBin "pv.sh" ''
                #!/bin/sh
        file=$1
               w=$2
               h=$3
               x=$4
               y=$5

               if [[ "$( ${pkgs.file}/bin/file -Lb --mime-type "$file")" =~ ^image ]]; then
                   ${pkgs.kitty}/bin/kitty +kitten icat --silent --stdin no --transfer-mode file --place "''${w}x''${h}@''${x}x''${y}" "$file" < /dev/null > /dev/tty
                   exit 1
               fi

               ${pkgs.pistol}/bin/pistol "$file"
      '';
    };
  };
}
