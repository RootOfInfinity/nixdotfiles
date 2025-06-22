{ config, lib, pkgs, pkgs-unstable, hyprland, ... }:

{
  networking.hostName = "nixos";
  imports = [
    ../../nixos/configuration.nix
    ../../nixos/packages.nix
    ../../nixos/librewolf.nix
  ];

}
