{ pkgs, ... }:
{
  # https://nix-community.github.io/nixvim/NeovimOptions/index.html#extrapackages
  extraPackages = with pkgs; [
    stylua
    lua-language-server
  ];

  # https://nix-community.github.io/nixvim/plugins/conform-nvim.html
  plugins.conform-nvim = {
    settings = {
      formatters_by_ft = {
        lua = [ "stylua" ];
      };
    };
  };

  lsp.servers.lua_ls = {
    enable = true;
    settings = {
      completion = {
        callSnippet = "Replace";
      };
    };
  };
}
