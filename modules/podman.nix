{ pkgs, files, ... }:
{
  home.packages = with pkgs; [
    podman
    podman-compose
  ];

  home.file = {
    ".config/containers".source = /${files}/containers;
  };
}
