{ inputs, nixpkgs, nixpkgs-stable, lib, root, home-manager, nixos-wsl, ... }:
let
  system = "x86_64-linux";

  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;
  };

  stable = import nixpkgs-stable {
    inherit system;
    config.allowUnfree = true;
  };

  hm = home-manager.nixosModules.home-manager;
in
{
  tianshu-laptop = lib.nixosSystem {
    specialArgs = { inherit system pkgs lib root; };
    modules = [
      ./laptop.nix

      /${root}/desktops/gnome.nix

      hm {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.users.tianshu = import /${root}/home/tianshu.nix;

        home-manager.extraSpecialArgs = { inherit root; };
      }
    ];
  };

  tianshu-wsl = lib.nixosSystem {
    inherit system;
    specialArgs = { inherit system pkgs stable lib nixos-wsl; };
    modules = [
      ./wsl.nix

      hm {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.users.tianshu = import /${root}/home/tianshu.nix;

        home-manager.extraSpecialArgs = { inherit root; };
      }
    ];
  };
}
