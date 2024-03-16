{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.nix-colors.homeManagerModules.default
    ./kitty.nix
    ./mako.nix
  ];

  colorScheme = inputs.nix-colors.colorSchemes.catppuccin-macchiato;
}
