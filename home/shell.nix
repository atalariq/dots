{...}: {
  programs.fish = {
      enable = true;
      shellAbbrs = {
          c = "clear";
          ":q" = "exit";
        };
      shellAliases = {};
  };

  programs.starship = {
      enable = true;
      enableFishIntegration = true;
    };

}
