{ inputs, nixpkgs, lib, root, ... }:
let
  system = "x86_64-linux";

  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;
  };
in
{
  tianshu-laptop = lib.nixosSystem {
    inherit system pkgs;
    specialArgs = { inherit system inputs root; };
    modules = [
      /${root}/settings.nix

        ./x1c.nix

        # Use gnome
        # /${root}/desktops/gnome.nix

        # Use KDE
        # /${root}/desktops/kde.nix

        # Use labwc
        /${root}/desktops/labwc.nix

        # Use LxQT
        # /${root}/desktops/lxqt.nix

        # Use Cosmic
        # inputs.nixos-cosmic.nixosModules.default
        # /${root}/desktops/cosmic.nix

        inputs.home-manager.nixosModules.home-manager

      /${root}/home
    ];
  };

  tianshu-wsl = lib.nixosSystem {
    inherit system;
    specialArgs = { inherit system pkgs inputs root; };
    modules = [
      ./wsl.nix

      inputs.home-manager.nixosModules.home-manager

      /${root}/home
    ];
  };
}
