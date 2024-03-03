{
  description = "NixOS and HomeManager Flake Configuration";

  nixConfig = {
    experimental-features = [ "nix-command" "flakes" ];
    # substituters = [ "https://mirror.sjtu.edu.cn/nix-channels/store" ];
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

    nixos-wsl.url = "github:nix-community/NixOS-WSL";

    flake-utils.url = "github:numtide/flake-utils";

    flake-compat = {
      url = "github:edolstra/flake-compat";
      flake = false;
    };
  };

  outputs = inputs@{ home-manager, nixpkgs, nixpkgs-unstable, flake-utils, emacs-overlay, nixos-wsl, ... }:
    let
      files = ./files;
      modules = ./modules;
    in
      {
        nixosConfigurations = import ./hosts {
          inherit (nixpkgs) lib;
          inherit nixpkgs nixpkgs-unstable inputs home-manager modules nixos-wsl;
        };

        homeConfigurations = import ./home {
          inherit nixpkgs nixpkgs-unstable home-manager files modules emacs-overlay;
        };
      };
}
