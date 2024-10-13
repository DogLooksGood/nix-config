{ inputs, nixpkgs, nixpkgs-stable, lib, root, home-manager, nixos-wsl, nixos-cosmic, ... }:
let
  system = "x86_64-linux";

  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;
    overlays = [ inputs.emacs-overlay.overlay ];
  };

  stable = import nixpkgs-stable {
    inherit system;
    config.allowUnfree = true;
  };

  hm = home-manager.nixosModules.home-manager;
in
{
  tianshu-laptop = lib.nixosSystem {
    specialArgs = { inherit inputs system pkgs lib root nixos-cosmic; };
    modules = [
      /${root}/settings.nix

      ./x1c.nix

      /${root}/desktops/gnome.nix

      hm {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.users.tianshu = import /${root}/home/tianshu.nix;

        home-manager.extraSpecialArgs = { inherit root stable; };
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

        home-manager.extraSpecialArgs = { inherit root stable; };
      }
    ];
  };
}
