{ ... }:
{
  # import sub modules
  imports = [
    ./cli
    ./mpd.nix
    ./neovim
    ./shell.nix
  ];
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

}
