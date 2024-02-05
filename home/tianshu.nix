{ modules }:
{
  imports = [
    /${modules}/rime
    /${modules}/shell
    /${modules}/podman
    /${modules}/emacs
  ];

  home.username = "tianshu";
  home.homeDirectory = "/home/tianshu";
  home.stateVersion = "23.11";
}
