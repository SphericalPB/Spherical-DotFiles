{ pkgs, inputs, ... }: 

{ 
  
  home.packages =  
  [ # inputs.nix-gaming.packages.${pkgs.system}.<package>
  
  inputs.nix-gaming.packages.${pkgs.system}.osu-lazer-bin
  inputs.nix-gaming.packages.${pkgs.system}.roblox-player
  
  ];
  
 # ++ (inputs.nix-gaming.lib.legendaryBuilder pkgs
 #     {
 #       games = {
 #         etg = {
##           desktopName = "Enter the Gungeon";
#            tricks = ["dxvk" "win10"];
#            icon = builtins.fetchurl {
#             url = "https://icons.iconarchive.com/icons/papirus-team/papirus-apps/128/enter-the-gungeon-icon.png";
#              name = "etg.png";
#              sha256 = "90c7610f437347910389d21c89d3100741b5841d29f632174b555d13aa5acfb2";
#            };
#
#            discordIntegration = false;
#            gamemodeIntegration = false;
#          };
#	 
#        opts = {
        #   #same options as above can be provided here, and will be applied to all games
        #   #NOTE: game-specific options take precedence
     #     wine = inputs.nix-gaming.packages.${pkgs.system}.wine-tkg;
#      };
#     };
#    });

}
