{ pkgs, root, ... }:
{
  home.packages = with pkgs; [
    pass
    ddgr
    most
    simple-http-server
    ripgrep
    mosh
    zellij
    babashka-unwrapped
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
    rlwrap
    nixpkgs-fmt
    wl-clipboard-x11
    wl-clipboard
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
      e = "emacsclient -nw";
      z = "zellij --layout $HOME/.config/zellij/layout.kdl";
      zt = "zellij action new-tab --cwd . --layout";
      pr = "podman run -it --rm --detach-keys 'ctrl-d'";
      pb = "podman build --progress=plain";
    };
    profileExtra = ''
      export FZF_DEFAULT_OPTS="--color bw"
      export EDITOR=emacsclient
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
