{
  # https://nix-community.github.io/nixvim/NeovimOptions/autoGroups/index.html
  autoGroups = {
    auto_create_dir.clear = true;
    checktime.clear = true;
    highlight_yank.clear = true;
    last_loc.clear = true;
    resize_splits.clear = true;
  };

  autoCmd = [
    # Highlight on yank
    {
      event = [ "TextYankPost" ];
      desc = "Highlight when yanking (copying) text";
      group = "highlight_yank";
      callback.__raw = ''
        function()
          (vim.hl or vim.highlight).on_yank()
        end
      '';
    }

    #  Check if we need to reload the file when it changed
    {
      event = [
        "FocusGained"
        "TermClose"
        "TermLeave"
      ];
      desc = "Check if we need to reload the file when it changed";
      group = "checktime";
      callback.__raw = ''
        function()
          if vim.o.buftype ~= "nofile" then
            vim.cmd("checktime")
          end
        end
      '';
    }

    # go to last loc when opening a buffer
    {
      event = [ "BufReadPost" ];
      desc = "go to last loc when opening a buffer";
      group = "last_loc";
      callback.__raw = ''
        function(event)
            local exclude = { "gitcommit" }
            local buf = event.buf
            if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].lazyvim_last_loc then
              return
            end
            vim.b[buf].lazyvim_last_loc = true
            local mark = vim.api.nvim_buf_get_mark(buf, '"')
            local lcount = vim.api.nvim_buf_line_count(buf)
            if mark[1] > 0 and mark[1] <= lcount then
              pcall(vim.api.nvim_win_set_cursor, 0, mark)
            end
          end
      '';
    }

    # Auto create dir when saving a file, in case some intermediate directory does not exist
    {
      event = [ "BufWritePre" ];
      desc = "Auto create dir when saving a file, in case some intermediate directory does not exist";
      group = "auto_create_dir";
      callback.__raw = ''
        function(event)
          if event.match:match("^%w%w+:[\\/][\\/]") then
            return
          end
          local file = vim.uv.fs_realpath(event.match) or event.match
          vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
        end
      '';
    }
  ];
}
