{ inputs, nixpkgs, nixpkgs-unstable, lib, home-manager, modules, nixos-wsl, ... }:
let
  system = "x86_64-linux";

  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;
  };

  unstable = import nixpkgs-unstable {
    inherit system;
    config.allowUnfree = true;
  };
in
{
  tianshu-laptop = lib.nixosSystem {
    inherit system;
    specialArgs = { inherit system pkgs unstable lib home-manager modules; };
    modules = [ ./laptop.nix /${modules}/gnome.nix];
  };

  tianshu-wsl = lib.nixosSystem {
    inherit system;
    specialArgs = { inherit system pkgs unstable lib home-manager modules nixos-wsl; };
    modules = [ ./wsl.nix ];
  };
}
