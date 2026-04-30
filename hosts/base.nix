{ config, lib, pkgs, ... }:
{
  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    trusted-users         = [ "root" "tianshu" "amal" ];
    substituters          = [ "https://mirrors.ustc.edu.cn/nix-channels/store" ];
  };
}
