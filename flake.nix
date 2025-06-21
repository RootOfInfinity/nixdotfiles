
{
  description = "My sys config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    homepkgs.url = "github:nixos/nixpkgs/nixos-24.11";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "homepkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";
    # split-monitor-workspaces = {
    #   url = "github:Duckonaut/split-monitor-workspaces";
    #   inputs.hyprland.follows = "hyprland";
    # };
    hyprsplit = {
      url = "github:shezdy/hyprsplit";
      inputs.hyprland.follows = "hyprland";
    }; 

    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    nixpkgs-old.url = "github:nixos/nixpkgs/nixos-24.11";

    stylix.url = "github:danth/stylix/release-24.11";

    xremap.url = "github:xremap/nix-flake";
  };

  outputs = { nixpkgs, home-manager, nixpkgs-unstable, nixpkgs-old, stylix, hyprland, hyprsplit, xremap, homepkgs, ... }@inputs: 
    let
      # system = "x86_64-linux";
      mkSystem = pkgs: system: hostname:
        pkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {
            pkgs-unstable = import nixpkgs-unstable {
              inherit system;
              config.allowUnfree = true;
            };
            inherit hyprland;
            # inherit xremap;
          };
          modules = [
            ./hosts/${hostname}/user.nix
            stylix.nixosModules.stylix
          ];
          
        };
      mkHome = pkgs: system: username:
        home-manager.lib.homeManagerConfiguration {
          extraSpecialArgs = {
            pkgs-unstable = import nixpkgs-unstable {
              inherit system;
              config.allowUnfree = true;
            };
            pkgs-old = import nixpkgs-old {
              inherit system;
              config.allowUnfree = true;
            };
            inherit hyprland;
            inherit hyprsplit;
          };
          pkgs = pkgs.legacyPackages.${system};
          modules = [
            {
              home.username = username;
              home.homeDirectory = "/home/${username}";
            }
            ./home-manager/home.nix
            stylix.homeManagerModules.stylix
          ];
        };
    in {


    nixosConfigurations = {
      framework-13 = mkSystem nixpkgs "x86_64-linux" "framework-13";
      nixos = mkSystem nixpkgs "x86_64-linux" "nixos";
    };
    homeConfigurations.rootofinfinity = mkHome nixpkgs "x86_64-linux" "rootofinfinity";
  };
}
