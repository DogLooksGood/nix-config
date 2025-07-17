{ config, home-manager, pkgs, ... }:
{
  home-manager.useUserPackages = true;
  home-manager.users.tianshu = {
    home.username = "tianshu";
    home.homeDirectory = "/home/tianshu";

    home.packages = with pkgs; [
      acpi
      bluetui
      brave
      chromium
      emacs-igc-pgtk
      emacs-lsp-booster
      fastfetch
      ffmpeg
      file
      firefox
      foot
      fuzzel
      gcc
      gh
      git
      gnumake
      grim
      iw
      killall
      libnotify
      libresprite
      lshw
      mako
      man-pages
      man-pages-posix
      mg
      mpv
      pass
      pciutils
      ripgrep
      slack
      slurp
      solana-cli
      telegram-desktop
      tmux
      tokei
      tree
      unzip
      usb-modeswitch
      usb-modeswitch-data
      usbutils
      wev
      wget
      wl-clipboard
      wlr-randr
      yt-dlp
      zip
      zip
    ];

    home.sessionVariables = {
      EDITOR = "emacs";
      ALL_PROXY="http://127.0.0.1:2080";
      HTTPS_PROXY="http://127.0.0.1:2080";
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
      ".config/labwc" = { source = ../dotfiles/labwc; };
      ".tmux.conf" = { source = ../dotfiles/tmux/.tmux.conf; };
    };

    services.kanshi.enable = true;

    home.stateVersion = "25.05";
  };
}
