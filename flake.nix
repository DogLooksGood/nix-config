{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    emacs-overlay = {
      url = "github:nix-community/emacs-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, home-manager, emacs-overlay, ... }:
    let
      pkgs = import nixpkgs {
        system = "x86_64-linux";
        config.allowUnfree = true;
        overlays = [ emacs-overlay.overlays.emacs ];
      };
    in
      {
        nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
          inherit pkgs;
          modules = [
	          home-manager.nixosModules.home-manager
            ./hardware-configuration/x1c.nix
            ./configuration.nix
	          ./home.nix
          ];
        };

        nixosConfigurations.desktop = nixpkgs.lib.nixosSystem {
          inherit pkgs;
          modules = [
	          home-manager.nixosModules.home-manager
            ./hardware-configuration/desktop.nix
            ./configuration.nix
	          ./home.nix
          ];
        };
      };
}
