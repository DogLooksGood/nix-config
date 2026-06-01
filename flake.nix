{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    # nixpkgs.url = "git+https://mirrors.tuna.tsinghua.edu.cn/git/nixpkgs.git?ref=nixos-unstable";


    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      # url = "git+https://git.nju.edu.cn/nix-mirror/home-manager.git";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, home-manager, ... }:
    let
      pkgs = import nixpkgs {
        system = "x86_64-linux";
        config = {
          allowUnfree = true;
          android_sdk.accept_license = true;
        };
      };
    in
      {

        nix.settings = {
          substituters = [
            "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
            "https://cache.nixos.org/"
          ];
          # trusted-public-keys = [
          #   "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
          # ];
        };

        nixosConfigurations.x1c = nixpkgs.lib.nixosSystem {
          inherit pkgs;
          modules = [
            home-manager.nixosModules.home-manager
            ./hosts/x1c.nix
            ./home/tianshu.nix
            ./home/amal.nix
          ];
        };

        nixosConfigurations.desktop = nixpkgs.lib.nixosSystem {
          inherit pkgs;
          modules = [
            home-manager.nixosModules.home-manager
            ./hosts/desktop.nix
            ./home/tianshu.nix
            ./home/amal.nix
          ];
        };
      };
}
