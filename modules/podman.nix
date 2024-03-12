{ pkgs, root, ... }:
{
  home.packages = with pkgs; [
    podman
    podman-compose
  ];

  home.file = {
    ".config/containers".source = /${root}/files/containers;
  };
}
