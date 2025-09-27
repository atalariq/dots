{pkgs, ...}: {
  home.packages = with pkgs; [
    mpc       # MPD controller
    ncmpcpp   # Client
    rmpc      # Another client, support album art
    yams      # Last.fm scrobbler
  ];

  services.mpd.enable = true;
  services.mpd.musicDirectory = "$HOME/Music";
  # services.mpd-mpris.enable = true;
  # services.mpdris2.enable = true;
}

