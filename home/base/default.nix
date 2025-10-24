{ pkgs, ... }:
{
  # import sub modules
  imports = [
    ./cli
    # (if pkgs.stdenv.isLinux then ./mpd.nix else {})
    ./neovim
    ./shell.nix
  ];
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

}
