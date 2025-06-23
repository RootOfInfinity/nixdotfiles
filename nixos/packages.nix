{ pkgs, pkgs-unstable, pkgs-old, ...}:
{
  environment.systemPackages = with pkgs; [
    vim 
    helix
    wget
    tor-browser
    discord
    easyeffects
    htop
    element-desktop
    
    fastfetch
    home-manager
    nil
    dust
    bat
    zellij
    ripgrep
    irust
    bacon
    p7zip
    killall
    vscode-langservers-extracted
    jdt-language-server
    wlogout
    cava
    pipes-rs
    cmus
    jq
    wl-clipboard
    hyprshot
    hyprpicker
    inetutils # check that
    obs-studio
    xfce.thunar
    usbutils
    udiskie
    udisks
    rustup
    prismlauncher
    python3
    pwntools
    binwalk
    exiftool
    libreoffice-qt6-fresh
    mangohud
    vlc
    mpv
    melonDS


    
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
    yazi
    ueberzugpp
    

    #for hyprland
    dunst
    libnotify
    swww
    rofi-wayland
    playerctl
    hyprland-workspaces
    bc
    brightnessctl

    # docker stuff
    # docker_26
    # dockerfile-language-server-nodejs
    # docker-compose-language-service
    # yaml-language-server
    # mysql-workbench
    

  ];
  
}
