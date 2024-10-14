{ pkgs, ... }:
{
  home.packages = with pkgs; [
    solana-cli
  ];
}
