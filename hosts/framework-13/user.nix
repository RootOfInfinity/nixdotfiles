{
  config,
  lib,
  pkgs,
  pkgs-unstable,
  hyprland,
  ...
}:

{
  networking.hostName = "framework-13";
  imports = [
    ../../nixos/configuration.nix
    ../../nixos/packages.nix
    ../../nixos/librewolf.nix
  ];

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd 'uwsm start default'";
        user = "rootofinfinity";
      };
    };
  };

  swapDevices = [
    {
      device = "/var/lib/swapfile";
      size = 16 * 1024; # 16 GB
    }
  ];
  services.power-profiles-daemon.enable = true;
  systemd.sleep.extraConfig = ''
    HibernateDelaySec=30m
    SuspendState=mem
  '';

  # boot.kernelParams = [
  #   "resume_offset=9398079" # found with 'sudo filefrag -v /var/lib/swapfile | head'
  #   # "resume_offset=69933056"
  # ];

  # boot.resumeDevice = "/dev/disk/by-uuid/0c1d0bd4-e6a6-4d11-b4e0-00513c250531";
  # boot.resumeDevice = "/dev/disk/by-uuid/e87ea691-d51d-4d52-94ee-5d332d48d71b";
  # powerManagement.enable = true;
  boot.initrd.systemd.enable = true;

  services.logind.settings.Login = {
    HandleLidSwitch = "suspend-then-hibernate";
    HandlePowerKeyLongPress = "poweroff";
    HandlePowerKey = "hibernate";
  };

  powerManagement.enable = true;

  services.libinput.mouse = {
    naturalScrolling = true;
    accelSpeed = "-0.5";
  };

}
