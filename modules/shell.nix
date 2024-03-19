{ config, pkgs, root, ... }:
{
  home.packages = with pkgs; [
    pass
    simple-http-server
    ripgrep
    mosh
    zellij
    babashka
    curl
    unzip
    wget
    tree
    yarn
    tokei
    zip
    jet
    p7zip
    qrencode
    httpie
    usbutils
    android-tools
    htop
    git
    ventoy
    comma
    nixpkgs-fmt
  ];

  home.file = {
    ".config/zellij".source = /${root}/files/zellij;
  };

  programs.git = {
    enable = true;
    userEmail = "doglooksgood@gmail.com";
    userName = "DogLooksGood";
  };

  home.sessionVariables = {
    EDITOR = "emacsclient";
  };

  programs.bash.enable = true;

  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";
    enableCompletion = true;
    autosuggestion.enable = false;
    shellAliases = {
      z = "zellij --layout $HOME/.config/zellij/layout.kdl";
      zt = "zellij action new-tab --cwd . --layout";
      pr = "podman run -it --rm --detach-keys 'ctrl-d'";
      pb = "podman build --progress=plain";
    };
    profileExtra = ''
      export FZF_DEFAULT_OPTS="--color bw"
      export EDITOR=emacsclient

      LOCAL_RC=$HOME/.zshrc
      if [ -f "$LOCAL_RC" ]; then
        . "$LOCAL_RC"
      fi
    '';
    oh-my-zsh = {
      enable = true;
      theme = "simple";
    };
  };

  programs.fzf = {
    enableZshIntegration = true;
    enable = true;
  };

  programs.direnv.enable = true;

  programs.direnv.nix-direnv.enable = true;
}
