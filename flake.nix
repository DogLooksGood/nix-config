{
  description = "NixOS and HomeManager Flake Configuration";

  nixConfig = {
    experimental-features = [ "nix-command" "flakes" ];
    substituters = [ "https://mirror.sjtu.edu.cn/nix-channels/store" ];
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";

    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    emacs-overlay = {
      url = "github:nix-community/emacs-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = inputs@{ home-manager, nixpkgs, nixpkgs-unstable, ... }:
    let
      nixpkgs.config.allowUnfree = true;
      files = ./files;
      modules = ./modules;
    in
      {
        nixosConfigurations = (import ./hosts {
          inherit (nixpkgs) lib;
          inherit nixpkgs nixpkgs-unstable inputs;
        });

        homeConfigurations = {
          tianshu = home-manager.lib.homeManagerConfiguration {
            inherit nixpkgs nixpkgs-unstable;
            extraSpecialArgs = { inherit inputs nixpkgs files; };
            modules = [ ./home/home.nix ];
          };
        };
      };
}
