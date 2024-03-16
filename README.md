# Spherical Prophetbot's Nixos Configuration Stuff
### Installation:

Just clone the repo to the desired location, 
then rebuild using: \
``tldr: ~/[Path-to-Nix-Config]/#[Username]@[HostName]``
````
sudo nix-rebuild switch --flake ~/.config/nix-conf/#sphericalpb@Spherical-NixOS
````
For Home-Manager Stuff:
````
home-manager switch --flake ~/.config/nix-conf/#sphericalpb@Spherical-NixOS
````


---
Todo List 
- [ ] Either make nix-colors work or remove it entirely
- [ ] Create a decent file structure
- [ ] Add a place for nix-gaming.nix (or overall gaming related configs)
- [ ] Figure out how nix global variables works
