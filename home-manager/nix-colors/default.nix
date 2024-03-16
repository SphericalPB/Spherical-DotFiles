{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.nix-colors.homeManagerModules.default
    ./kitty.nix
  ];

  colorScheme = inputs.nix-colors.colorSchemes.catppuccin-mocha;
}
