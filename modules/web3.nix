{ config, files, pkgs, ... }:
{
  home.packages = with pkgs; [
    solana-cli
  ];
}
