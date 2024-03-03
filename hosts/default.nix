{ inputs, nixpkgs, nixpkgs-unstable, lib, home-manager, modules, ... }:
let
  system = "x86_64-linux";

  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;
  };

  unstable = import nixpkgs {
    inherit system;
    config.allowUnfree = true;
  };
in
{
  tianshu-laptop = lib.nixosSystem {
    inherit system;
    specialArgs = { inherit system pkgs unstable lib home-manager modules; };
    modules = [ ./laptop.nix ];
  };

  tianshu-wsl = lib.nixosSystem {
    inherit system;
    specialArgs = { inherit system pkgs unstable lib home-manager modules; };
    modules = [ ./wsl.nix ];
  };
}
