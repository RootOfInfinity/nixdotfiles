{ pkgs, pkgs-unstable, config, hyprsplit, ... }:
{
  imports = [
    ./helix.nix
    ./git.nix
    ./nushell.nix
    ./starship.nix
    ./alacritty.nix
    ./zoxide.nix
    ./hyprland.nix
    ./waybar.nix
    ./cmus.nix
    ./eww.nix
    ./stylix.nix
    ./yazi.nix
    ./xremap.nix
    ./btop.nix
  ];
}
