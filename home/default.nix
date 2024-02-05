{ nixpkgs, nixpkgs-unstable, home-manager, files, modules, ... }:
{
  tianshu =
    let
      pkgs = (
        import nixpkgs {
          system = "x86_64-linux";
          config.allowUnfree = true;
        }
      );

      unstable = (
        import nixpkgs-unstable {
          system = "x86_64-linux";
          config.allowUnfree = true;
        }
      );
    in
      home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = { inherit files modules unstable; };
        modules = [ ./tianshu.nix ];
      };
}
