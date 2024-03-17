{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.nix-colors.homeManagerModules.default
    ./fish
    ./kitty.nix
    ./mako.nix
  ];

  colorScheme = inputs.nix-colors.colorSchemes.catppuccin-macchiato;
}
