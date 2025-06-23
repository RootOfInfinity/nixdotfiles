{ pkgs, pkgs-unstable, config, hyprsplit, ... }:
{
  # this is the shared behavior between systems.
  imports = [
    ./helix.nix
    ./git.nix
    ./nushell.nix
    ./starship.nix
    ./alacritty.nix
    ./zoxide.nix
    ./hyprland.nix
    ./cmus.nix
    ./eww.nix
    ./stylix.nix
    ./yazi.nix
    ./btop.nix
    ./dunst.nix
  ];
}
