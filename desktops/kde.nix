{ config, pkgs, lib, ... }:
{
  services.xserver.enable = true;
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma6.enable = true;

  environment.systemPackages = with pkgs; [
    kdePackages.plasma-browser-integration
  ];
}
