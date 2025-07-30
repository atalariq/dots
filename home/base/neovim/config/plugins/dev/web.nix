{ pkgs, ... }:
{
  # https://nix-community.github.io/nixvim/NeovimOptions/index.html#extrapackages
  extraPackages = with pkgs; [
    astro-language-server
    biome
    prettier
    prettierd
    superhtml
    tailwindcss-language-server
    vscode-langservers-extracted
  ];

  # https://nix-community.github.io/nixvim/plugins/conform-nvim.html
  plugins.conform-nvim = {
    settings = {
      formatters_by_ft = {
        javascript = {
          __unkeyed-1 = "prettierd";
          __unkeyed-2 = "prettier";
          timeout_ms = 2000;
          stop_after_first = true;
        };
      };
    };
  };

  lsp.servers = {
    astro = {
      enable = true;
    };
    biome = {
      enable = true;
    };
    cssls = {
      enable = true;
    };
    jsonls = {
      enable = true;
    };
    tailwindcss = {
      enable = true;
    };
    superhtml = {
      enable = true;
    };
  };
}
