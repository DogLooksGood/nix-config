{ config, pkgs, lib, nixos-cosmic, ... }:
{
  imports = [
    nixos-cosmic.nixosModules.default
  ];

  services.desktopManager.cosmic.enable = true;
  services.displayManager.cosmic-greeter.enable = true;
}
