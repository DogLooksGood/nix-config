{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nil
    gnumake
    gcc
    pkg-config
    universal-ctags
  ];
}
