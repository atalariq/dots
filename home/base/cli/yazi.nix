{...}: {
  programs.yazi = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      manager = {
        sort_dir_first = true;
      };
    };
  };
}
