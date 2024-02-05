{ nixpkgs, nixpkgs-unstable, ... }:
{
  tianshu = home-manager.lib.homeManagerConfiguration {
    inherit nixpkgs nixpkgs-unstable;
    extraSpecialArgs = { inherit inputs nixpkgs files; };
    modules = [ ./tianshu.nix ];
  };
}
