{ root, pkgs, ... }:
{
  imports = [
    /${root}/modules/rime.nix
    /${root}/modules/shell.nix
    /${root}/modules/podman.nix
    /${root}/modules/emacs.nix
    /${root}/modules/apps.nix
    /${root}/modules/web3.nix
    /${root}/modules/devtools.nix
  ];

  home.enableNixpkgsReleaseCheck = false;

  home.username = "tianshu";
  home.homeDirectory = "/home/tianshu";
  home.stateVersion = "23.11";
}
