{ config, lib, utils, inputs, root, stable, pkgs, ... }:
{
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.extraSpecialArgs = { inherit root stable pkgs inputs; };
  home-manager.users.tianshu = {
    imports = [
      /${root}/features/rime.nix
      /${root}/features/shell.nix
      /${root}/features/podman.nix
      /${root}/features/emacs.nix
      /${root}/features/apps.nix
      /${root}/features/web3.nix
      /${root}/features/devtools.nix
    ];

    home.username = "tianshu";
    home.homeDirectory = "/home/tianshu";
    home.stateVersion = "23.11";
  };
}
