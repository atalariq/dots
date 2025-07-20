{...}: {
  home.shell.enableShellIntegration = true;
  home.shell.enableFishIntegration = true;
  programs.fish = {
    enable = true;
    shellAbbrs = {
        c = "clear";
        ":q" = "exit";
      };
  };

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };
}
