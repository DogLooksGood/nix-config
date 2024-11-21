{ pkgs, ... }:
{
  services.gpg-agent.defaultCacheTtl = 14400;

  home.packages = with pkgs; [
    yubikey-manager
  ];
}
