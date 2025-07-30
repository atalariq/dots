{pkgs, ...}: {
  imports = [
    ./debug.nix
    ./bash.nix
    ./cpp.nix
    ./lua.nix
    ./nix.nix
    ./typst.nix
    ./web.nix
  ];

  # ================================= Formatter ==============================
  # https://nix-community.github.io/nixvim/plugins/conform-nvim.html
  plugins.conform-nvim = {
    enable = true;
    settings = {
      notify_on_error = false;
      format_on_save = ''
        function(bufnr)
          local disable_filetypes = { c = true, cpp = true }
          if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat or disable_filetypes[vim.bo[bufnr].filetype] then
            return nil
          else
            return {
              timeout_ms = 500,
              lsp_format = "fallback",
            }
          end
        end
      '';
      formatters_by_ft = {
        "_" = [
          "trim_whitespace"
          "trim_newlines"
        ];
      };
    };
  };

  extraConfigLua = ''
    vim.api.nvim_create_user_command("Format", function(args)
      local range = nil
      if args.count ~= -1 then
        local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
        range = {
          start = { args.line1, 0 },
          ["end"] = { args.line2, end_line:len() },
        }
      end
      require("conform").format({ async = true, lsp_format = "fallback", range = range })
    end, { range = true })
  '';

  keymaps = [
    {
      mode = "";
      key = "<leader>cf";
      action.__raw = ''
        function()
          require('conform').format { async = true, lsp_fallback = true }
        end
      '';
      options = {
        desc = "[F]ormat buffer";
      };
    }
  ];
}
