{ config, unstable, files, ... }:
{
  home.packages = [
    unstable.solana-cli
  ];
}
