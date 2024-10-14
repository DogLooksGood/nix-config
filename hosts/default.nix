{ inputs, nixpkgs, nixpkgs-stable, lib, root, ... }:
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
in
{
  tianshu-laptop = lib.nixosSystem {
    inherit system;
    specialArgs = { inherit system pkgs inputs root stable; };
    modules = [
      /${root}/settings.nix

      ./x1c.nix

      /${root}/desktops/gnome.nix

      inputs.home-manager.nixosModules.home-manager

      /${root}/home
    ];
  };

  tianshu-wsl = lib.nixosSystem {
    inherit system;
    specialArgs = { inherit system pkgs inputs root stable; };
    modules = [
      ./wsl.nix

      inputs.home-manager.nixosModules.home-manager

      /${root}/home
    ];
  };
}
