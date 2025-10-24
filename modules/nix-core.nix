{ pkgs, lib, ... }:
{
  # Custom settings written to /etc/nix/nix.custom.conf
  determinate-nix.customSettings = {
    flake-registry = "/etc/nix/flake-registry.json";
  };
  nix.enable = false;

  # Let Determinate Nix handle Nix configuration rather than nix-darwin
  # nix = {
    # enable = false;
    # package = pkgs.nix;
    # settings = {
      # # enable flakes globally
      # experimental-features = [
        # "nix-command"
        # "flakes"
      # ];
    # };
    # # do garbage collection weekly to keep disk usage low
    # gc = {
      # automatic = lib.mkDefault true;
      # options = lib.mkDefault "--delete-older-than 7d";
    # };
  # };

  programs = {
    nix-index.enable = true;
  };
}
