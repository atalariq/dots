{
  plugins.neo-tree.enable = true;
  plugins.todo-comments.enable = true;

  # =================================================== which-key – Key helper
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

  # ========================================================= Telescope
  # https://nix-community.github.io/nixvim/plugins/telescope/index.html
  plugins.telescope = {
    enable = true;

    # Enable Telescope extensions
    extensions = {
      fzf-native.enable = true;
      ui-select.enable = true;
    };

    # You can put your default mappings / updates / etc. in here
    #  See `:help telescope.builtin`
    keymaps = {
      "<leader>sh" = {
        mode = "n";
        action = "help_tags";
        options = {
          desc = "[S]earch [H]elp";
        };
      };
      "<leader>sk" = {
        mode = "n";
        action = "keymaps";
        options = {
          desc = "[S]earch [K]eymaps";
        };
      };
      "<leader>sf" = {
        mode = "n";
        action = "find_files";
        options = {
          desc = "[S]earch [F]iles";
        };
      };
      "<leader>ss" = {
        mode = "n";
        action = "builtin";
        options = {
          desc = "[S]earch [S]elect Telescope";
        };
      };
      "<leader>sw" = {
        mode = "n";
        action = "grep_string";
        options = {
          desc = "[S]earch current [W]ord";
        };
      };
      "<leader>sg" = {
        mode = "n";
        action = "live_grep";
        options = {
          desc = "[S]earch by [G]rep";
        };
      };
      "<leader>sd" = {
        mode = "n";
        action = "diagnostics";
        options = {
          desc = "[S]earch [D]iagnostics";
        };
      };
      "<leader>sr" = {
        mode = "n";
        action = "resume";
        options = {
          desc = "[S]earch [R]esume";
        };
      };
      "<leader>s." = {
        mode = "n";
        action = "oldfiles";
        options = {
          desc = "[S]earch Recent Files ('.' for repeat)";
        };
      };
      "<leader><leader>" = {
        mode = "n";
        action = "buffers";
        options = {
          desc = "[ ] Find existing buffers";
        };
      };
    };
    settings = {
      extensions.__raw = "{ ['ui-select'] = { require('telescope.themes').get_dropdown() } }";
    };
  };

  # https://nix-community.github.io/nixvim/keymaps/index.html
  keymaps = [
    # Slightly advanced example of overriding default behavior and theme
    {
      mode = "n";
      key = "<leader>/";
      # You can pass additional configuration to Telescope to change the theme, layout, etc.
      action.__raw = ''
        function()
          require('telescope.builtin').current_buffer_fuzzy_find(
            require('telescope.themes').get_dropdown {
              winblend = 10,
              previewer = false
            }
          )
        end
      '';
      options = {
        desc = "[/] Fuzzily search in current buffer";
      };
    }
    {
      mode = "n";
      key = "<leader>s/";
      # It's also possible to pass additional configuration options.
      #  See `:help telescope.builtin.live_grep()` for information about particular keys
      action.__raw = ''
        function()
          require('telescope.builtin').live_grep {
            grep_open_files = true,
            prompt_title = 'Live Grep in Open Files'
          }
        end
      '';
      options = {
        desc = "[S]earch [/] in Open Files";
      };
    }

    # ===================================== Toggle Neo-tree
    {
      key = "`";
      action = "<cmd>Neotree toggle<cr>";
      options = {
        desc = "NeoTree Toggle";
      };
    }
  ];
}
