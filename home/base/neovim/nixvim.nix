{ pkgs, lib, config, ... }:
let
  enable_nerd_fonts = true;
in
{
  enable = true;
  defaultEditor = true;
  # viAlias = true;
  # vimAlias = true;
  # nixpkgs.useGlobalPackages = true;

  imports = [
    # Plugins
    ./config/plugins/blink-cmp.nix
    ./config/plugins/conform.nix
    # ./config/plugins/debug.nix
    ./config/plugins/gitsigns.nix
    # ./config/plugins/lint.nix
    ./config/plugins/lsp.nix
    ./config/plugins/mini.nix
    ./config/plugins/neo-tree.nix
    ./config/plugins/telescope.nix
    ./config/plugins/treesitter.nix
    ./config/plugins/which-key.nix
  ];

  colorschemes = {
    tokyonight = {
      enable = true;
      settings = {
        style = "night";
      };
    };
  };

  globals = {
    mapleader = " ";
    maplocalleader = " ";
    have_nerd_font = enable_nerd_fonts;
  };

  clipboard = {
    providers = {
      wl-copy.enable = true; # For Wayland
      xsel.enable = true; # For X11
    };
    register = "unnamedplus";
  };

  opts = {
    number = true;
    relativenumber = true;
    mouse = "a";
    showmode = false;     # Don't show the mode, since it's already in the statusline
    breakindent = true;
    undofile = true;
    ignorecase = true;
    smartcase = true;
    signcolumn = "yes";
    updatetime = 250;
    timeoutlen = 300;
    splitright = true;
    splitbelow = true;
    list = true;
    # listchars.__raw = "{ tab = '» ', trail = '·', nbsp = '␣' }";
    inccommand = "split";
    cursorline = true;
    scrolloff = 10;
    confirm = true;
    hlsearch = true;
  };

  keymaps = [
    {
      mode = "n";
      key = "<Esc>";
      action = "<cmd>nohlsearch<CR>";
    }
    {
      mode = "t";
      key = "<Esc><Esc>";
      action = "<C-\\><C-n>";
      options = {
        desc = "Exit terminal mode";
      };
    }
    #  Use CTRL+<hjkl> to switch between windows
    {
      mode = "n";
      key = "<C-h>";
      action = "<C-w><C-h>";
      options = {
        desc = "Move focus to the left window";
      };
    }
    {
      mode = "n";
      key = "<C-l>";
      action = "<C-w><C-l>";
      options = {
        desc = "Move focus to the right window";
      };
    }
    {
      mode = "n";
      key = "<C-j>";
      action = "<C-w><C-j>";
      options = {
        desc = "Move focus to the lower window";
      };
    }
    {
      mode = "n";
      key = "<C-k>";
      action = "<C-w><C-k>";
      options = {
        desc = "Move focus to the upper window";
      };
    }
  ];

  # https://nix-community.github.io/nixvim/NeovimOptions/autoGroups/index.html
  autoGroups = {
    highlight-yank = {
      clear = true;
    };
  };

  autoCmd = [
    {
      event = [ "TextYankPost" ];
      desc = "Highlight when yanking (copying) text";
      group = "highlight-yank";
      callback.__raw = ''
        function()
          vim.hl.on_yank()
        end
      '';
    }
  ];

  diagnostic = {
    settings = {
      severity_sort = true;
      float = {
        border = "rounded";
        source = "if_many";
      };
      underline = {
        severity.__raw = ''vim.diagnostic.severity.ERROR'';
      };
      signs.__raw = ''
        vim.g.have_nerd_font and {
          text = {
            [vim.diagnostic.severity.ERROR] = '󰅚 ',
            [vim.diagnostic.severity.WARN] = '󰀪 ',
            [vim.diagnostic.severity.INFO] = '󰋽 ',
            [vim.diagnostic.severity.HINT] = '󰌶 ',
          },
        } or {}
      '';
      virtual_text = {
        source = "if_many";
        spacing = 2;
        format.__raw = ''
          function(diagnostic)
            local diagnostic_message = {
              [vim.diagnostic.severity.ERROR] = diagnostic.message,
              [vim.diagnostic.severity.WARN] = diagnostic.message,
              [vim.diagnostic.severity.INFO] = diagnostic.message,
              [vim.diagnostic.severity.HINT] = diagnostic.message,
            }
            return diagnostic_message[diagnostic.severity]
          end
        '';
      };
    };
  };

  plugins = {
    web-devicons.enable = enable_nerd_fonts;
    guess-indent = { enable = true; };
    nvim-autopairs = { enable = true; };
    indent-blankline = { enable = true; };
    todo-comments = { enable = true; };
  };

  extraConfigLuaPost = ''
    -- The line beneath this is called `modeline`. See `:help modeline`
    -- vim: ts=2 sts=2 sw=2 et
  '';
}
