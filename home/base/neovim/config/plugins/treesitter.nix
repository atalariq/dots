{ pkgs, ... }:
{
  plugins.ts-autotag.enable = true;
  plugins.ts-comments.enable = true;
  plugins.ts-context-commentstring.enable = true;
  plugins.treesitter-context.enable = true;

  # ================================= Treesitter ==============================
  # Highlight, edit, and navigate code
  # https://nix-community.github.io/nixvim/plugins/treesitter/index.html
  plugins.treesitter = {
    enable = true;
    grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
      # programming/scripting language
      bash
      c
      cpp
      fish
      java
      lua
      nix
      python
      rust

      # Web
      astro
      css
      html
      http
      javascript
      typescript

      # markup language
      toml
      xml
      yaml

      # git
      git_config
      git_rebase
      gitattributes
      gitcommit
      gitignore

      # config file
      editorconfig
      ini
      ssh_config
      vim

      # others
      csv
      diff
      jq
      jsdoc
      json
      jsonc
      just
      luadoc
      luap
      markdown
      markdown_inline
      printf
      query
      regex
      typst
      vimdoc
    ];

    settings = {
      highlight = {
        enable = true;
      };
      indent = {
        enable = true;
      };
      incremental_selection = {
        enable = true;
        keymaps = {
          init_selection = "<C-space>";
          node_incremental = "<C-space>";
          scope_incremental = false;
          node_decremental = "<bs>";
        };
      };
    };
  };

}
