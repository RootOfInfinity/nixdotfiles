{
  pkgs,
  pkgs-unstable,
  pkgs-old,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    vim
    helix
    slint-lsp
    wget
    tor-browser
    discord
    easyeffects
    htop
    element-desktop
    warpinator
    simple64
    nestopia-ue
    libresprite
    ldtk
    # for prog competition
    vscodium-fhs
    eclipses.eclipse-java
    gimp
    tio
    protonup-rs
    dolphin-emu
    i2pd

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
    pkgs-unstable.rustup
    pkgs-unstable.cargo-cross
    lld_20
    llvmPackages_20.libcxxClang
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
    kdePackages.kdenlive
    mtpfs
    cheese
    ciscoPacketTracer8

    gcc
    btop
    feh
    unzip
    burpsuite
    r2modman
    steam-run-free
    zulu25
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
    arduino-ide
    arduino-cli

    #for hyprland
    dunst
    libnotify
    swww
    rofi
    rofimoji
    playerctl
    hyprland-workspaces
    bc
    brightnessctl
    acpi
    todo
    pmutils

    # docker stuff
    # docker_26
    # dockerfile-language-server-nodejs
    # docker-compose-language-service
    # yaml-language-server
    # mysql-workbench

    cups-brother-hll2350dw
    piper
  ];
  nixpkgs.config.permittedInsecurePackages = [
    "ciscoPacketTracer8-8.2.2"
  ];

}
