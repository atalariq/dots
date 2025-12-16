{ pkgs, lib, ... }:
{
  nix = {
    enable = true;
    # package = pkgs.nix;
    package = pkgs.lixPackageSets.stable.lix;
    settings = {
      # enable flakes globally
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
    # do garbage collection weekly to keep disk usage low
    gc = {
      automatic = lib.mkDefault true;
      options = lib.mkDefault "--delete-older-than 7d";
    };
  };

  programs = {
    nix-index.enable = true;
  };
}
