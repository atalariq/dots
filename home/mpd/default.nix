{pkgs, ...}: {
  home.packages = with pkgs; [
    mpc
    mpd
    mpdscribble
    rmpc
  ];
}

