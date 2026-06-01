{ config, home-manager, pkgs, ... }:
{
  home-manager.useUserPackages = true;
  home-manager.users.tianshu = {
    home.username = "tianshu";
    home.homeDirectory = "/home/tianshu";

    home.packages = with pkgs; [
      acpi
      aria2
      autoconf
      automake
      blender
      bluetui
      chez
      chez-srfi
      cmake
      emacs-pgtk
      fastfetch
      ffmpeg
      file
      firefox
      foot
      fuzzel
      gcc
      gdb
      git
      gnum4
      gnumake
      grim
      guile
      guile.dev
      guile.info
      hidapi
      hmcl
      httrack
      inetutils
      inkscape
      iw
      killall
      libnotify
      libreoffice-qt
      libresprite
      libtool
      libwebp
      lshw
      mako
      man-pages
      man-pages-posix
      mg
      mpv
      obs-studio
      pass
      pciutils
      lxqt.pcmanfm-qt
      pinfo
      qpdfview
      ripgrep
      shared-mime-info
      sigil
      simple-http-server
      slack
      slurp
      sqlite
      sqlitebrowser
      tango-icon-theme
      telegram-desktop
      time
      tmux
      tokei
      tree
      typst
      unzip
      usb-modeswitch
      usb-modeswitch-data
      usbutils
      util-linux
      valgrind
      waybar
      wev
      wget
      wl-clipboard
      wlr-randr
      wtype
      yt-dlp
      zip
      zip
      swappy
    ];

    gtk = {
      gtk4.theme = null;
      enable = true;
      iconTheme = {
        name = "Tango"; # The internal name of the theme
        package = pkgs.tango; # The Nix package containing it
      };
    };

    xdg.mimeApps.defaultApplications = {
      "inode/directory" = "pcmanfm.desktop";
    };

    home.sessionVariables = {
      EDITOR = "emacsclient";
      use_proxy="on"; # for wget
      CHEZSCHEMELIBDIRS="${pkgs.chez-srfi}/lib/csv10.3-site";
    };

    home.pointerCursor = {
      name = "XCursor-Pro-Light";
      package = pkgs.xcursor-pro;
      size = 32;
      gtk.enable = true;
    };

    programs.git = {
      enable = true;
      settings = {
        user = {
          name = "DogLooksGood";
          email = "doglooksgood@gmail.com";
        };
        core = {
          excludesFile = "~/.gitignore_global";
        };
      };
    };

    programs = {
      direnv = {
        enable = true;
        enableBashIntegration = true; # see note on other shells below
        nix-direnv.enable = true;
      };

      bash = {
        enable = true;
        bashrcExtra = ''
          source ${../dotfiles/bash/osc7_cwd.sh}
        '';
      };
    };

    programs.firefox = {
      configPath = ".mozilla/firefox";
      enable = true;
    };

    home.file = {
      ".config/zellij" = { source = ../dotfiles/zellij; };
      ".config/containers" = { source = ../dotfiles/containers; };
      ".config/sway" = { source = ../dotfiles/sway; };
      ".config/waybar" = { source = ../dotfiles/waybar; };
      ".config/foot" = { source = ../dotfiles/foot; };
      ".config/fuzzel" = { source = ../dotfiles/fuzzel; };
      ".config/labwc" = { source = ../dotfiles/labwc; };
      ".tmux.conf" = { source = ../dotfiles/tmux/.tmux.conf; };
      ".guile" = { source = ../dotfiles/guile/.guile; };
    };

    services.kanshi.enable = true;

    home.stateVersion = "25.05";
  };
}
