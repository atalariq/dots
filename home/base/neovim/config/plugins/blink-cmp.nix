{
  # Dependencies
  #
  plugins.luasnip.enable = true; # autoEnableSources not enough
  plugins.friendly-snippets = { enable = true; };

  plugins.blink-cmp = {
    enable = true;

    settings = {

      keymap = {
        # 'default' (recommended) for mappings similar to built-in completions
        #   <c-y> to accept ([y]es) the completion.
        #    This will auto-import if your LSP supports it.
        #    This will expand snippets if the LSP sent a snippet.
        # 'super-tab' for tab to accept
        # 'enter' for enter to accept
        # 'none' for no mappings
        #
        # For an understanding of why the 'default' preset is recommended,
        # you will need to read `:help ins-completion`
        #
        # No, but seriously. Please read `:help ins-completion`, it is really good!
        #
        # All presets have the following mappings:
        # <tab>/<s-tab>: move to right/left of your snippet expansion
        # <c-space>: Open menu or open docs if already open
        # <c-n>/<c-p> or <up>/<down>: Select next/previous item
        # <c-e>: Hide menu
        # <c-k>: Toggle signature help
        #
        # See :h blink-cmp-config-keymap for defining your own keymap
        preset = "default";
      };
      completion = {
        documentation = {
          auto_show = false;
          auto_show_delay_ms = 500;
        };
      };

      sources = {
        default = [
          "lsp"
          "path"
          "snippets"
          "lazydev"
        ];
        providers = {
          lazydev = {
            module = "lazydev.integrations.blink";
            score_offset = 100;
          };
        };
      };

      appearance = { nerd_font_variant = "mono"; };
      fuzzy = { implementation = "lua"; };
      signature = { enabled = true; };
      snippets = { preset = "luasnip"; };
    };
  };
}
