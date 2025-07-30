{
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

    # ========================= Undo/Redo
    {
      mode = "n";
      key = "u";
      action = "<cmd>undo<CR>";
      options = {
        desc = "Undo change";
      };
    }
    {
      mode = "n";
      key = "U";
      action = "<cmd>redo<CR>";
      options = {
        desc = "Redo change";
      };
    }

    # ========================= Windows
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

    # ========================= Files
    {
      mode = "n";
      key = "<C-s>";
      action = "<cmd>update<CR>";
      options = {
        desc = "Save File";
      };
    }
    {
      mode = [
        "i"
        "v"
      ];
      key = "<C-s>";
      action = "<Esc>Esc><cmd>update<CR>";
      options = {
        desc = "Save File";
      };
    }
    {
      key = "<leader>cd";
      action = "<cmd>cd %:h<cr>";
      options = {
        desc = "Change directory to current file directory";
      };
    }

    # ========================= Buffer
    # see ./plugins/ui.nix
    {
      mode = "n";
      key = "<Tab>";
      action = "<cmd>bnext<CR>";
      options = {
        desc = "Go to next buffer";
      };
    }
    {
      mode = "n";
      key = "<S-Tab>";
      action = "<cmd>bprevious<CR>";
      options = {
        desc = "Go to previous buffer";
      };
    }
    {
      mode = "n";
      key = "<A-q>";
      action.__raw = ''
        function()
          if vim.bo.buftype == "terminal" then
            vim.cmd(vim.bo.buflisted and "set nobl | new" or "hide")
          elseif vim.bo.modified then
            print("save the file first!")
          else
            local bufnr = vim.api.nvim_get_current_buf()
            vim.cmd("bp")
            vim.cmd("bd" .. bufnr)
          end
        end
        '';
      options = {
        desc = "Close file/buffer";
      };
    }

    # ========================= Others
    {
      mode = "v";
      key = "<";
      action = "<gv";
      options = {
        desc = "Dedent current selection";
      };
    }
    {
      mode = "v";
      key = ">";
      action = ">gv";
      options = {
        desc = "Indent current selection";
      };
    }
    {
      mode = "n";
      key = "/";
      action = "ms/";
      options = {
        desc = "Keeps jumplist after forward searching";
      };
    }
    {
      mode = "n";
      key = "?";
      action = "ms?";
      options = {
        desc = "Keeps jumplist after backward searching";
      };
    }
  ];
}
