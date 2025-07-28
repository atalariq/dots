{ pkgs, ... }:
{
  # Highlight, edit, and navigate code
  # https://nix-community.github.io/nixvim/plugins/treesitter/index.html
  plugins.treesitter = {
    enable = true;

    # Installing tree-sitter grammars from Nixpkgs (recommended)
    # grammarPackages = pkgs.vimPlugins.nvim-treesitter.passthru.allGrammars;
    grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
      astro
      bash
      css
      csv
      diff
      editorconfig
      git_config
      git_rebase
      gitattributes
      gitcommit
      gitignore
      html
      http
      ini
      javascript
      json
      lua
      luadoc
      markdown
      markdown_inline
      nix
      query
      regex
      rust
      ssh_config
      toml
      tsx
      typescript
      vim
      vimdoc
      xml
      yaml
    ];

    settings = {
      # Installing tree-sitter grammars from nvim-treesitter
      # (can be combined with grammarPackages from Nixpkgs)
      # https://nix-community.github.io/nixvim/plugins/treesitter/index.html#installing-tree-sitter-grammars-from-nvim-treesitter
      ensureInstalled = [ ];

      highlight = { enable = true; };
      indent = { enable = true; };

      # There are additional nvim-treesitter modules that you can use to interact
      # with nvim-treesitter. You should go explore a few and see what interests you:
      #
      #    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
      #    - Show your current context: https://nix-community.github.io/nixvim/plugins/treesitter-context/index.html
      #    - Treesitter + textobjects: https://nix-community.github.io/nixvim/plugins/treesitter-textobjects/index.html
    };
  };
}
