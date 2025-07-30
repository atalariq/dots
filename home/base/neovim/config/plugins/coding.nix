{
  plugins.mini-ai.enable = true;
  plugins.mini-align.enable = true;
  plugins.mini-surround.enable = true;
  plugins.nvim-autopairs.enable = true;

  # ========================= snippets
  plugins.luasnip.enable = true;
  plugins.friendly-snippets = {
    enable = true;
  };

  # ========================= Completions
  plugins.blink-emoji.enable = true;
  plugins.blink-ripgrep.enable = true;
  plugins.blink-cmp = {
    enable = true;

    settings = {
      keymap = {
        # <tab>/<s-tab>: move to right/left of your snippet expansion
        # <c-space>: Open menu or open docs if already open
        # <c-n>/<c-p> or <up>/<down>: Select next/previous item
        # <c-e>: Hide menu
        # <c-k>: Toggle signature help
        preset = "enter";
      };
      completion = {
        documentation = {
          auto_show = false;
          auto_show_delay_ms = 500;
        };
      };

      sources = {
        default = [
          "path"
          "lsp"
          "snippets"
          "ripgrep"
          "buffer"
          "emoji"
        ];

        providers = {
          emoji = {
            module = "blink-emoji";
            name = "Emoji";
            score_offset = 15;
            opts = {
              insert = true;
            };
          };
          ripgrep = {
            async = true;
            module = "blink-ripgrep";
            name = "Ripgrep";
            score_offset = 100;
          };
        };
      };

      appearance = {
        nerd_font_variant = "mono";
      };
      fuzzy = {
        implementation = "lua";
      };
      signature = {
        enabled = true;
      };
      snippets = {
        preset = "luasnip";
      };
    };
  };
}
