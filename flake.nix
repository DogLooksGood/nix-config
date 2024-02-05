{
  description = "NixOS and HomeManager Flake Configuration";

  nixConfig = {
    experimental-features = [ "nix-command" "flakes" ];
    substituters = [ "https://mirror.sjtu.edu.cn/nix-channels/store" ];
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";

    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    flake-utils = { url = "github:numtide/flake-utils"; };

    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    emacs-overlay = {
      url = "github:nix-community/emacs-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = inputs@{ self, home-manager, nixpkgs, flake-utils }:
    let
      nixpkgs.config.allowUnfree = true;
      user = "tianshu";
      files = ./files;
      modules = ./modules;
    in
    {
      nixosConfigurations = {
        tianshu-laptop = nixpkgs.lib.nixosSystem {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
          specialArgs = { inherit inputs nixpkgs };
          modules = [ ./hosts/laptop.nix ];
        };
      };

      homeConfigurations = {
        tianshu = home-manager.lib.homeManagerConfiguration {
          inherit nixpkgs nixpkgs-unstable;
          extraSpecialArgs = { inherit inputs nixpkgs files };
          modules = [ ./users/tianshu.nix ];
        };
      };
    }
}
