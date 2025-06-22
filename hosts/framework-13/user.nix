{ config, lib, pkgs, pkgs-unstable, hyprland, ... }:

{
  networking.hostName = "framework-13";
  imports = [
    ../../nixos/configuration.nix
    ../../nixos/packages.nix
    ../../nixos/librewolf.nix
  ];
}
