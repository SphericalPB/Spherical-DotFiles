{ pkgs,
config,
...
}:

{
  programs.lf = {
    enable = true;
    commands = {
      dragon-out = ''%xdragon -a -x "$fx"''; # dragon for drag n' drop on the terminal
      editor-open = ''$$EDITOR $f'';
      mkdir = 
        ''${{
          printf "Directory Name: "
          read DIR
          mkdir $DIR
        }}
        '';
  };
}
