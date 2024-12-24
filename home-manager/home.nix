{ config, pkgs, ... }: {
  home = {
    username = "rootofinfinity";
    homeDirectory = "/home/rootofinfinity";
    stateVersion = "24.11";

    packages = with pkgs; [
      cmatrix
      nsnake
    ];
  };
  
  imports = [
    ./modules/bundle.nix
  ];

}
