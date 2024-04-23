# Spherical Prophetbot's Nixos Configuration Stuff
### Installation:

Just clone the repo to the desired location, 
then rebuild using: \
``Hint: ~/[Path-to-Nix-Config]/#[HostName]``
````
sudo nix-rebuild switch --flake ~/.config/nix-conf/#sphericalpb
````
For Home-Manager Stuff:
``Hint: ~/[Path-to-Nix-Config]/#[Username]@[HostName]``
````
home-manager switch --flake ~/.config/nix-conf/#sphericalpb@Spherical-NixOS
````


---
Todo List
URGENT: 
REMOVE ``zoom-us`` from the NixOS config once school year is done

- [X] Either make nix-colors work or remove it entirely
- [ ] Make a script for rebuilding and commiting config changes
- [ ] Create a decent file structure
- [ ] Add a place for nix-gaming.nix (or overall gaming related configs)
- [ ] Figure out how nix global variables works

New 
- [ ] Install Microsoft Fonts
- [ ] Move Syncthing to home-manager
- [ ] Sync game files with Syncthing
