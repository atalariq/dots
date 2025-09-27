{
  description = "Atalariq's Darwin/MacOS System Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    darwin = {
      url = "github:nix-darwin/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      self,
      darwin,
      nixpkgs,
      home-manager,
    }:
    let
      username = "atalariq";
      specialArgs = inputs // {
        inherit username;
      };
    in
    {
      # Build darwin flake using:
      # $ sudo darwin-rebuild build --flake .#{profile}
      darwinConfigurations = {
        # Profile: Macbook Pro 13 (Early 2015) with macOS Monterey 12.7.6
        "macbook12" = darwin.lib.darwinSystem {
          inherit specialArgs;
          system = "x86_64-darwin";
          modules = [
            # OS Agnostic
            ./modules/nix-core.nix # Nix Settings
            ./modules/fonts.nix # Fonts

            # Apps/Software
            ./modules/apps.nix # General Apps
            ./modules/development.nix # For Development
            # ./modules/hacking.nix # For Hacking

            # MacOS Specific
            ./modules/darwin/system.nix # Settings
            ./modules/darwin/host-user.nix # Host & User
            ./modules/darwin/apps.nix # Mac Apps
            # ./modules/darwin/homebrew.nix # Mac Apps
            ./modules/darwin/ricing/yabai.nix
            ./modules/darwin/ricing/skhd.nix
            # ./modules/darwin/ricing/sketchybar.nix
            ./modules/darwin/ricing/jankyborders.nix

            # home-manager
            home-manager.darwinModules.home-manager
            {
              nixpkgs.config.allowUnfree = true;
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = specialArgs;
              home-manager.users.${username} = import ./home/darwin;
            }
          ];
        };
      };
    };
}
