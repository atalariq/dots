{ username, ... }:
{
  # import sub modules
  imports = [
    ./shell
    ./git.nix
    ./packages.nix
    ./neovim
    ./mpd
  ];

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home = {
    username = username;
    homeDirectory = "/Users/${username}";
    stateVersion = "25.11";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
