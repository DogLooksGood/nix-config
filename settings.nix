{ ... }:
{
  nix.settings.trusted-users = [ "tianshu" ];

  nix.settings.substituters = [
    "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
  ];
}
