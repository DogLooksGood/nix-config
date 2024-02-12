{ modules, ... }:
{
  imports = [
    /${modules}/rime.nix
    /${modules}/shell.nix
    /${modules}/podman.nix
    /${modules}/emacs.nix
    /${modules}/apps.nix
    /${modules}/web3.nix
  ];

  home.username = "tianshu";
  home.homeDirectory = "/home/tianshu";
  home.stateVersion = "23.11";
}
