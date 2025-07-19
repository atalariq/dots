{pkgs, ...}: {
  home.packages = with pkgs; [
    aria2
    bat
    fastfetch
    fd
    fzf
    glow
    jq
    ripgrep
    tealdeer
    yt-dlp
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

    zellij = {
      enable = true;
      enableFishIntegration = true;
    };

    zoxide = {
      enable = true;
      enableFishIntegration = true;
    };
  };
}
