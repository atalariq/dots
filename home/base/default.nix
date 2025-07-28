{ ... }:
{
  # import sub modules
  imports = [
    ./shell.nix
    ./cli
    ./mpd
    ./neovim
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
