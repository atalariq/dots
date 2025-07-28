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
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      self,
      darwin,
      nixpkgs,
      home-manager,
      nixvim,
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

            # MacOS Specific
            ./modules/macos/system.nix # Settings
            ./modules/macos/host-user.nix # Host & User
            # ./modules/macos/apps.nix                                  # Mac Apps
            # ./modules/macos/homebrew.nix                              # Mac Apps
            # TODO: WIP
            # ./modules/macos/yabai.nix
            # ./modules/macos/skhd.nix

            # home-manager
            home-manager.darwinModules.home-manager
            {
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
