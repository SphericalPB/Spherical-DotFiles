# Configure Mako as a Home-Manager Module
# https://nix-community.github.io/home-manager/options.xhtml#opt-services.mako.enable
{
  services.mako = {
    enable = true;
    anchor = "bottom-left";
    defaultTimeout = 3000;
  };
}
