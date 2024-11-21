{ pkgs, ... }:
{
  virtualisation.waydroid.enable = true;

  # Open ports in the firewall.
  networking.firewall = {
    enable = true;
    trustedInterfaces = [ "waydroid0" ];
    allowedTCPPorts = [
      80 443 3000 4000 8000 8081
    ];
    allowedUDPPorts = [
      53 67
    ];
    allowedUDPPortRanges = [
      { from = 4000; to = 4007; }
      { from = 8000; to = 8010; }
    ];
  };

  networking.nat = {
    enable = true;
    internalInterfaces = ["ve-+"];
  };
}
