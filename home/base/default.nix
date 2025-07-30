{ stylix, ... }:
{
  # import sub modules
  imports = [
    stylix.homeModules.stylix
    ./stylix.nix
    ./shell.nix
    ./cli
    ./mpd
    ./neovim
  ];
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

}
