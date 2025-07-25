{pkgs, ...}: {
 
  home.packages = with pkgs; [
    # CLI Tools
    aria2
    bat
    fastfetch
    fd
    fzf
    glow
    htop
    jq
    ripgrep
    rsync
    tlrc
    yt-dlp
    zellij
    zoxide
    
  ];

  programs = {
    eza = {
      enable = true;
      git = true;
      icons = "auto";
      enableFishIntegration = true;
    };

    yazi = {
      enable = true;
      enableFishIntegration = true;
      settings = {
        manager = {
          sort_dir_first = true;
        };
      };
    };
  };
}
