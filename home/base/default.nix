{ config, ... }:
{
  # import sub modules
  imports = [
    ./cli.nix
    ./shell.nix
    ./git.nix
    ./mpd
    ./neovim
    ./yazi
  ];

  home.file.".local/script" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dots/home/base/script";
  };

  home.sessionPath = [
    "$HOME/bin"
    "$HOME/.local/bin"
    "$HOME/.local/script"
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

}
