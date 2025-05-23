# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, pkgs-unstable, inputs, hyprland, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      /etc/nixos/hardware-configuration.nix
      ./stylixconfig.nix
    ];
  # hardware.opengl = {
  #   package = pkgs-unstable.mesa.drivers;
  # };

  # Allow unfree software
  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.autoUpgrade = {
    enable = true;
    dates = "weekly";
  };
  
  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 10d";
  };

  nix.settings.auto-optimise-store = true;

  hardware.bluetooth.enable = true;
  # hardware.bluetooth.powerOnBoot = true;
  hardware.bluetooth.settings = {
    General = {
      Experimental = true;
    };
  };
  
  # UDEV Rules for Micronucleus boards including the Digispark.
  # This file must be placed at:
  #
  # /etc/udev/rules.d/49-micronucleus.rules    (preferred location)
  #   or
  # /lib/udev/rules.d/49-micronucleus.rules    (req'd on some broken systems)
  #
  # To install, type these commands in a terminal:
  #   sudo cp 49-micronucleus.rules /etc/udev/rules.d/49-micronucleus.rules
  #   sudo udevadm control --reload-rules
  #
  # After this file is copied, physically unplug and reconnect the board.
  services.udev.extraRules = ''
    SUBSYSTEMS=="usb", ATTRS{idVendor}=="16d0", ATTRS{idProduct}=="0753", OWNER:="rootofinfinity"
    KERNEL=="ttyACM*", ATTRS{idVendor}=="16d0", ATTRS{idProduct}=="0753", OWNER:="rootofinfinity", ENV{ID_MM_DEVICE_IGNORE}="1"
  '';
  # If you share your linux system with other users, or just don't like the
  # idea of write permission for everybody, you can replace MODE:="0666" with
  # OWNER:="yourusername" to create the device owned by you, or with
  # GROUP:="somegroupname" and mange access using standard unix groups.

  # stylix = {
  #   enable = true;
  #   image = ../home-manager/files/cross-wallpaper.jpg;
  #   polarity = "dark";
  # };
  
  qt.enable = true;
  services.flatpak.enable = true;

  programs.steam.enable = true;
  programs.steam.gamescopeSession.enable = true;
  programs.gamemode.enable = true;
  # If ya wanna use mangohud, gamescope, or gamemode, put it in the
  # launch options like `mangohud %command%`

  services.devmon.enable = true;
  services.gvfs.enable = true;
  services.udisks2.enable = true;

  # I'll be honest, the TUI didn't really work
  # I like pure CLI login better.
  # services.greetd = {
  #   enable = true;
  #   settings = {
  #     default_session = {
  #       command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland";
  #       user = "rootofinfinity";
  #     };
  #   };
  # };

  # virtualisation.docker.enable = true;

  # Virtual Machine manager
  programs.virt-manager.enable = true;
  users.groups.libvirtd.members = [ "rootofinfinity" ];
  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;

  virtualisation.waydroid.enable = true;
  

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.
  # networking.nameservers = [ "8.8.8.8" ];
  # networking.defaultGateway6 = {
  #   address = "fe80::1";
  #   interface = "enp2s0";
  # };

  # networking = {
  #   nameservers = [ "127.0.0.1" "::1" ];
  #   networkmanager.dns = "none";
  # };

  # services.dnscrypt-proxy2 = {
  #   enable = true;
  #   settings = {
  #     ipv6_servers = true;
  #     require_dnssec = true;
  #     query_log.file = "/var/log/dnscrypt-proxy/query.log"; # tests if it works
  #     sources.public-resolvers = {
  #       urls = [
  #         "https://raw.githubusercontent.com/DNSCrypt/dnscrypt-resolvers/master/v3/public-resolvers.md"
  #         "https://download.dnscrypt.info/resolvers-list/v3/public-resolvers.md"        
  #       ];
  #       cache_file = "/var/cache/dnscrypt-proxy/public-resolvers.md";
  #       minisign_key = "RWQf6LRCGA9i53mlYecO4IzT51TGPpvWucNSCh1CBM0QTaLn73Y7GFO3";      
  #     };
  #   server_names = [ "sdns://AgMAAAAAAAAABzEuMS4xLjIABzEuMS4xLjIKL2Rucy1xdWVyeQ" "sdns://AgMAAAAAAAAABzEuMC4wLjIABzEuMC4wLjIKL2Rucy1xdWVyeQ" ];
  #   };
  # };


  # services.stubby = {
  #   enable = true;
  #   settings = pkgs.stubby.passthru.settingsExample // {
  #     upstream_recursive_servers = [{
  #       address_data = "1.1.1.1";
  #       tls_auth_name = "cloudflare-dns.com";
  #       tls_pubkey_pinset = [{
  #         digest = "sha256";
  #         value = "SPfg6FluPIlUc6a5h313BDCxQYNGX+THTy7ig5X3+VA=";
  #       }];
  #     } {
  #       address_data = "1.0.0.1";
  #       tls_auth_name = "cloudflare-dns.com";
  #       tls_pubkey_pinset = [{
  #         digest = "sha256";
  #         value = "SPfg6FluPIlUc6a5h313BDCxQYNGX+THTy7ig5X3+VA=";
  #       }];
  #     }];
  #   };
  # };
  
  # SPfg6FluPIlUc6a5h313BDCxQYNGX+THTy7ig5X3+VA=


  networking.enableIPv6 = true;

  # networking.extraHosts = ''
  #   54.236.113.205 registry-1.docker.io
  #   54.198.86.24 registry-1.docker.io
  #   54.227.20.253 registry-1.docker.io
  # '';
  # Set your time zone.
  time.timeZone = "America/Chicago";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };

  # Enable the X11 windowing system.
  # services.xserver.enable = true;

  # services = {
  #   displayManager.defaultSession = "xfce";
  #   xserver = {
  #     enable = true;
  #     desktopManager = {
  #       xfce.enable = true;
  #     };
  #   };
  # };

  # for hyprland
  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true;
    # package = hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    # portalPackage = hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };
  
  hardware.graphics.enable = true;
  

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  # Configure keymap in X11
  # services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound.
  # hardware.pulseaudio.enable = true;
  # OR
  # services.pipewire = {
  #   enable = true;
  #   pulse.enable = true;
  # };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.rootofinfinity = {
    isNormalUser = true;
    extraGroups = [ "wheel" "input" "networkmanager" ]; # Enable ‘sudo’ for the user.
  };

  # programs.firefox.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  fonts.packages = with pkgs-unstable; [
    nerd-fonts.bigblue-terminal
  ];
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    helix
    wget
    firefox
    librewolf
    tor-browser
    discord
    discordo
    easyeffects
    htop
    alacritty
    neofetch
    home-manager
    nil
    dust
    bat
    zellij
    mprocs
    ripgrep
    irust
    bacon
    p7zip
    image-roll
    killall
    vscode-langservers-extracted
    pwvucontrol
    wlogout
    cava
    pipes-rs
    cmus
    jq
    grim
    slurp
    wl-clipboard
    hyprshot
    hyprpicker
    inetutils
    steam-tui
    steamcmd
    obs-studio
    xfce.thunar
    ranger
    usbutils
    udiskie
    udisks
    rustup
    prismlauncher
    python3
    pwntools
    binwalk
    exiftool
    onlyoffice-desktopeditors
    mangohud
    vlc
    mpv

    libllvm # intended feature: use nix-shell when compiling
    llvm-manpages

    pkgs-unstable.arduino-ide
    pkgs-unstable.arduino-core
    appimage-run
    micronucleus
    libusb1
    libusb-compat-0_1
    pkgs-unstable.libnss_nis
    
    gcc
    btop
    feh
    unzip
    burpsuite
    r2modman
    steam-run-free
    zulu23
    ghidra
    gdb
    gef
    crawl
    pkg-config
    bluetuith
    pulsemixer
    zathura
    qemu_full
    keepassxc
    markdown-oxide
    lldb_19
    eww
    # stubby
    

    #for hyprland
    waybar
    mako
    libnotify
    swww
    rofi-wayland
    playerctl
    hyprland-workspaces
    # networkmanagerapplet

    # docker stuff
    # docker_26
    # dockerfile-language-server-nodejs
    # docker-compose-language-service
    # yaml-language-server
    # mysql-workbench
    

  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.11"; # Did you read the comment?

}

