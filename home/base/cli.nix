{pkgs, ...}:{

  home.packages = with pkgs; [
    # CLI Tools
    aria2
    bat
    eza
    fastfetch
    fd
    fzf
    glow
    htop
    jq
    ripgrep
    rsync
    silicon
    tlrc
    yt-dlp
    zellij

    # media
    ffmpeg
    imagemagick
  ];
}
