{
  description = "NixOS and HomeManager Flake Configuration";

  nixConfig = {
    experimental-features = [ "nix-command" "flakes" ];
    extra-substituters = [
      "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
      "https://mirror.sjtu.edu.cn/nix-channels/store"
      "https://cache.nixos.org/"
      "https://nix-community.cachix.org"
      "https://cosmic.cachix.org/"
    ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE="
    ];
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-wsl.url = "github:nix-community/NixOS-WSL";

    nixos-cosmic.url = "github:lilyinstarlight/nixos-cosmic";
  };

  outputs = inputs@{ home-manager, nixpkgs, ... }:
    let
      # We use this var to locate files based on their relative paths.
      root = ./.;
    in
      {
        nixosConfigurations = import ./hosts {
          inherit (nixpkgs) lib;
          inherit nixpkgs inputs root;
        };
      };
}
