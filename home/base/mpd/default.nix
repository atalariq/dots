{pkgs, config,...}: {
  home.packages = with pkgs; [
    mpd
    mpc       # MPD controller
    ncmpcpp   # Client
    rmpc      # Another client, support album art
    yams      # Last.fm scrobbler
  ];

  home.file.".config/mpd" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dots/home/base/mpd/config/mpd";
  };
  home.file.".config/rmpc" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dots/home/base/mpd/config/rmpc";
  };
  home.file.".config/ncmpcpp" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dots/home/base/mpd/config/ncmpcpp";
  };
}

