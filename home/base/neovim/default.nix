{
  config,
  pkgs,
  lib,
  nixvim,
  stylix,
  ...
}: {
  # Import nixvim module
  imports = [nixvim.homeManagerModules.nixvim];

  # stylix config
  stylix.targets.nixvim.enable = false;
  # stylix.targets.nixvim.plugin = "mini.base16"; # base16-nvim or mini.base16
  # stylix.targets.nixvim.transparentBackground.main = true;
  # stylix.targets.nixvim.transparentBackground.numberLine = true;
  # stylix.targets.nixvim.transparentBackground.signColumn = true;

  # nixvim configuration
  programs.nixvim = import ./nixvim.nix {inherit pkgs lib config;};
}
