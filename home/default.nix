{ inputs, root, pkgs, ... }:
{
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.extraSpecialArgs = { inherit root pkgs inputs; };
  home-manager.users.tianshu = {
    imports = [
      /${root}/features/rime.nix
      /${root}/features/shell.nix
      /${root}/features/podman.nix
      /${root}/features/emacs.nix
      /${root}/features/apps.nix
      /${root}/features/web3.nix
      /${root}/features/devtools.nix
      /${root}/features/alacritty.nix
      /${root}/features/security.nix
    ];

    home.username = "tianshu";
    home.homeDirectory = "/home/tianshu";
    home.stateVersion = "23.11";
  };

  home-manager.backupFileExtension = "backup";
}
