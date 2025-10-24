{pkgs, ...}: {
  home.packages = with pkgs; [
    mpc       # MPD controller
    ncmpcpp   # Client
    rmpc      # Another client, support album art
    yams      # Last.fm scrobbler
  ];

  services.mpd = {
    enable = true;
    musicDirectory = "$HOME/Music";
    package = pkgs.mpd-small;
  };

  # services.mpd-mpris.enable = true;
  # services.mpdris2.enable = true;
  # services.mpd-discord-rpc.enable = true;
}

