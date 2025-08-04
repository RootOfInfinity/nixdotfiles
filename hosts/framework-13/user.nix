{ config, lib, pkgs, pkgs-unstable, hyprland, ... }:

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
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd 'uwsm start default'";
        user = "rootofinfinity";
      };
    };
  };

  swapDevices = [{
    device = "/var/lib/swapfile";
    size = 16*1024; # 16 GB
  }];

  # boot.kernelParams = [
  #   "resume_offset=9398079"
  # ];
  # boot.resumeDevice = "/dev/disk/by-uuid/0c1d0bd4-e6a6-4d11-b4e0-00513c250531";
  # powerManagement.enable = true;

  services.logind.lidSwitch = "suspend";
  services.logind.lidSwitchExternalPower = "ignore";
  
}
