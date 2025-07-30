{
  pkgs,
  lib,
  config,
  ...
}: {
  enable = true;
  defaultEditor = true;
  viAlias = true;
  vimAlias = true;

  imports = [
    ./config/options.nix
    ./config/autocmds.nix
    ./config/keymaps.nix
    ./config/diagnostic.nix

    # Plugins
    ./config/plugins/coding.nix
    ./config/plugins/editor.nix
    ./config/plugins/git.nix
    ./config/plugins/lsp.nix
    ./config/plugins/treesitter.nix
    ./config/plugins/ui.nix
    ./config/plugins/util.nix

    # Plugins/Development Kit
    ./config/plugins/dev
  ];

  # colorschemes.base16.enable = true;
  colorschemes.tokyonight = {
    enable = true;
    settings = {
      light_style = "day";
      style = "night";
      styles = {
        floats = "dark";
        sidebars = "dark";
      };
      terminal_colors = true;
      transparent = true;
    };
  };

  extraConfigLuaPost = ''
    -- The line beneath this is called `modeline`. See `:help modeline`
    -- vim: ts=2 sts=2 sw=2 et
  '';
}
