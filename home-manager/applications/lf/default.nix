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
    };
    keybindings = {
      md = "mkdir";
      do = "dragon-out";
      ee = "editor-open";
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
