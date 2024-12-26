{ pkgs , ... }:
{
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };

  environment.systemPackages = with pkgs; [
    i3status-rust
  ];
}
