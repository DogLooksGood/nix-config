{ config, lib, pkgs, ... }:
{
  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    trusted-users         = [ "root" "tianshu" "amal" ];
    substituters          = [ "https://mirrors.ustc.edu.cn/nix-channels/store"
                              "https://cache.nixos.org" ];
  };

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages;


  # Easiest to use and most distros use this by default.
  networking.networkmanager.enable = true;

  networking.proxy = {
    allProxy   = "http://localhost:2080";
    httpProxy  = "http://localhost:2080";
    httpsProxy = "http://localhost:2080";
    noProxy    = "127.0.0.1,localhost,.localdomain,.cn";
  };

  # Set your time zone.
  time.timeZone = "Asia/Shanghai";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.inputMethod = {
    type = "fcitx5";
    enable = true;
    fcitx5.waylandFrontend = true;
    fcitx5.addons = with pkgs; [
      rime-data
      fcitx5-rime
      fcitx5-gtk
    ];
  };

  services.xserver.desktopManager.runXdgAutostartIfNone = true;

  console.useXkbConfig = true;

  documentation = {
    dev.enable = true;
  };

  # Configure keymap in X11
  services.xserver.xkb.layout = "us";
  services.xserver.xkb.variant = "dvp";

  # Define a group to share files.
  # The shared directory is /srv/shared.
  users.groups.shared = {};

  systemd.tmpfiles.rules = [
    "d /srv/shared 2770 root shared - -"
    "A /srv/shared - - - - group:shared:rwx,default:group:shared:rwx"
  ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users = {
    tianshu = {
      isNormalUser = true;
      extraGroups = [ "wheel" "podman" "shared" ];
    };
    amal = {
      isNormalUser = true;
      extraGroups = [ "wheel" "podman" "shared" ];
    };
  };

  qt = {
    enable = true;
    style = "kvantum";
  };

  # You can use https://search.nixos.org/ to find more packages (and options).
  environment.systemPackages = with pkgs; [
    # critical
    bluetui
    mg
    git
    wget
    tmux
    foot
    fuzzel
    firefox
    emacs-pgtk
    unzip
    zip
    # desktop components
    acpi
    grim
    mako
    slurp
    swappy
    waybar
    wev
    wl-clipboard
    wlr-randr
    wtype
    # optionals
    autoconf
    automake
    chez
    cmake
    distrobox
    drawio
    fastfetch
    ffmpeg
    file
    gcc
    gdb
    gnumake
    guile
    guile.dev
    guile.info
    host-spawn
    inetutils
    iw
    killall
    libnotify
    libreoffice-qt
    libresprite
    libtool
    libwebp
    lshw
    man-pages
    man-pages-posix
    mpv
    ntp
    pass
    pciutils
    podman-compose
    lxqt.pcmanfm-qt
    qrencode
    ripgrep
    shared-mime-info
    sigil
    simple-http-server
    schemesh
    sqlite
    sqlitebrowser
    stressapptest
    tango-icon-theme
    telegram-desktop
    texliveMedium
    time
    tokei
    tree
    usb-modeswitch
    usb-modeswitch-data
    usbutils
    util-linux
    valgrind
  ];

  fonts.packages = with pkgs; [
    font-awesome
    unifont
    nerd-fonts.bigblue-terminal
    lxgw-neoxihei
    lxgw-wenkai
    iosevka
    lmodern
    ultimate-oldschool-pc-font-pack
  ];

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;


  programs.steam = {
    enable = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  };

  # Enable a floating window manager
  programs.labwc = {
    enable = true;
  };

  # Enable a tilling window manager
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };

  programs.throne = {
    enable = true;
  };

  virtualisation.containers.enable = true;
  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
    defaultNetwork.settings.dns_enabled = true;
  };
  virtualisation.containers.registries.search = [
    "docker.io"
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  services.power-profiles-daemon.enable = true;

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # Keyboard configuration

  services.keyd = {
    enable = true;
    keyboards = let
      defaultSettings = {
        meta = {
          x = "S-delete";
          c = "C-insert";
          v = "S-insert";
        };
      };
    in
      {
        internal = {
          ids = [ "0001:0001" ];
          settings = {
            main = {
              capslock = "layer(control)";
            };
          } // defaultSettings;
        };

        hhkb = {
          ids = [ "04fe:0016" ];
          settings = {
            main = {
              rightalt  = "rightmeta";
              rightmeta = "rightalt";
              leftalt   = "leftmeta";
              leftmeta  = "leftalt";
            };
          } // defaultSettings;
        };
      };
  };
}
