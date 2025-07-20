{pkgs, ...}: {
 
  home.packages = with pkgs; [
    # CLI Tools
    aria2
    atuin
    bat
    duf
    dust
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
    
    # Git
    delta
    gh
    git
    lazygit

    # GUI
    # anki-bin
    # brave
    ghostty-bin
    mpv
    # obsidian 		# Unfree
    vesktop
    # zotero

    # MPD
    mpc
    mpd
    # mpd-discord-rpc
    mpdscribble
    rmpc
  ];

  programs = {
    neovim = {
      enable = true;
      defaultEditor = true;
      vimAlias = true;
    };

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
          show_hidden = true;
          sort_dir_first = true;
        };
      };
    };
  };
}
