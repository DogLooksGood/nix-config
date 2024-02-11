{ nixpkgs, nixpkgs-unstable, home-manager, files, modules, emacs-overlay, ... }:
{
  tianshu =
    let
      pkgs =
        import nixpkgs {
          system = "x86_64-linux";
          config.allowUnfree = true;
          overlays = [ (import emacs-overlay) ];
        };

      unstable = import nixpkgs-unstable {
        system = "x86_64-linux";
        config.allowUnfree = true;
      };
    in
    home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      extraSpecialArgs = { inherit files modules unstable; };
      modules = [ ./tianshu.nix ];
    };
}
