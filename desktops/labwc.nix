{ pkgs, ... }:
{
  programs.labwc.enable = true;

  environment.systemPackages = with pkgs; [
    waybar
  ];
}
