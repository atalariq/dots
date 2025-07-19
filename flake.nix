{
  description = "Atalariq's Darwin/MacOS System Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    darwin.url = "github:nix-darwin/nix-darwin/master";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, darwin, nixpkgs, home-manager }:
  let
    username = "atalariq";
    system = "x86_64-darwin";
    hostname = "macbook12";

    specialArgs =
      inputs
      // {
        inherit username hostname;
      };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#{hostname}
    darwinConfigurations."${hostname}" = darwin.lib.darwinSystem {
      inherit system specialArgs;
      modules = [
        ./modules/core.nix
        ./modules/system.nix
        ./modules/host-user.nix
        ./modules/packages.nix

        # home manager
        home-manager.darwinModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.extraSpecialArgs = specialArgs;
          home-manager.users.${username} = import ./home;
        }
      ];
    };
    formatter.${system} = nixpkgs.legacyPackages.${system}.alejandra;
  };
}
