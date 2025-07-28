{
  # Useful plugin to show you pending keybinds.
  # https://nix-community.github.io/nixvim/plugins/which-key/index.html
  plugins.which-key = {
    enable = true;
    settings = {
      delay = 0;
      spec = [
        {
          __unkeyed-1 = "<leader>s";
          group = "[S]earch";
        }
        {
          __unkeyed-1 = "<leader>t";
          group = "[T]oggle";
        }
        {
          __unkeyed-1 = "<leader>h";
          group = "Git [H]unk";
          mode = [
            "n"
            "v"
            "o"
            "x"
          ];
        }
      ];
    };
  };
}
