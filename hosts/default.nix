{ inputs, nixpkgs, nixpkgs-unstable, lib, ... }:
{
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
        specialArgs = {
          inherit inputs system unstable;
        };
        modules = [ ./laptop.nix ];
      }
    }
}
