{
  description = "NixOS and HomeManager Flake Configuration";

  nixConfig = {
    experimental-features = [ "nix-command" "flakes" ];
    # extra-substituters = "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store https://mirror.sjtu.edu.cn/nix-channels/store https://cache.nixos.org/";
    # trusted-substituters = "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store https://mirror.sjtu.edu.cn/nix-channels/store https://cache.nixos.org/";
  };

  inputs = {
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-23.11";

    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    emacs-overlay = {
      url = "github:nix-community/emacs-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-wsl.url = "github:nix-community/NixOS-WSL";

    nixos-cosmic = {
      url = "github:lilyinstarlight/nixos-cosmic";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-utils.url = "github:numtide/flake-utils";

    flake-compat = {
      url = "github:edolstra/flake-compat";
      flake = false;
    };
  };

  outputs = inputs@{ home-manager, nixpkgs, nixpkgs-stable, flake-utils, emacs-overlay, nixos-wsl, nixos-cosmic, ... }:
    let
      root = ./.;
    in
      {
        nixosConfigurations = import ./hosts {
          inherit (nixpkgs) lib;
          inherit nixpkgs nixpkgs-stable inputs root home-manager nixos-wsl nixos-cosmic;
        };
      };
}
