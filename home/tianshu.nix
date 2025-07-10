{ config, home-manager, pkgs, ... }:
{
  home-manager.useUserPackages = true;
  home-manager.users.tianshu = {
    home.username = "tianshu";
    home.homeDirectory = "/home/tianshu";

    home.packages = with pkgs; [
      mg
      git
      wget
      tree
      tmux
      gcc
      gnumake
      grim
      slurp
      mako
      foot
      fuzzel
      firefox
      pass
      zip
      file
      gh
      acpi
      wlr-randr
      killall
      bluetui
      libnotify
      wev
      wl-clipboard
      fastfetch
      telegram-desktop
      emacs-igc-pgtk
      emacs-lsp-booster
      ripgrep
      brave
      slack
      mpv
      yt-dlp
    ];

    home.sessionVariables = {
      EDITOR = "emacs";
      HTTPS_PROXY = "http://127.0.0.1:2080";
    };

    home.pointerCursor = {
      name = "phinger-cursors-light";
      package = pkgs.phinger-cursors;
      size = 32;
      gtk.enable = true;
    };

    programs.git = {
      enable = true;
      userName = "DogLooksGood";
      userEmail = "doglooksgood@gmail.com";
    };

    programs = {
      direnv = {
        enable = true;
        enableBashIntegration = true; # see note on other shells below
        nix-direnv.enable = true;
      };

      bash.enable = true; # see note on other shells below
    };

    programs.firefox.enable = true;

    home.file = {
      ".config/kanshi" = { source = ../dotfiles/kanshi; };
      ".config/zellij" = { source = ../dotfiles/zellij; };
      ".config/containers" = { source = ../dotfiles/containers; };
      ".config/sway" = { source = ../dotfiles/sway; };
      ".config/waybar" = { source = ../dotfiles/waybar; };
      ".config/foot" = { source = ../dotfiles/foot; };
      ".config/fuzzel" = { source = ../dotfiles/fuzzel; };
    };

    services.kanshi.enable = true;

    home.stateVersion = "25.05";
  };
}
