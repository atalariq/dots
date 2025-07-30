{
  plugins.indent-blankline.enable = true;
  plugins.modicator.enable = true;
  plugins.web-devicons.enable = true;

  plugins.lualine = {
    enable = true;
    settings = {};
  };

  plugins.bufferline = {
    enable = true;
    settings = {};
  };

  keymaps = [
    {
      key = "<leader>bp";
      action = "<Cmd>BufferLineTogglePin<CR>";
      options.desc = "Toggle Pin";
    }
    {
      key = "<leader>bP";
      action = "<Cmd>BufferLineGroupClose ungrouped<CR>";
      options.desc = "Delete Non-Pinned Buffers";
    }
    {
      key = "<leader>br";
      action = "<Cmd>BufferLineCloseRight<CR>";
      options.desc = "Delete Buffers to the Right";
    }
    {
      key = "<leader>bl";
      action = "<Cmd>BufferLineCloseLeft<CR>";
      options.desc = "Delete Buffers to the Left";
    }
    {
      key = "<S-h>";
      action = "<cmd>BufferLineCyclePrev<cr>";
      options.desc = "Prev Buffer";
    }
    {
      key = "<S-l>";
      action = "<cmd>BufferLineCycleNext<cr>";
      options.desc = "Next Buffer";
    }
    {
      key = "<S-Tab>";
      action = "<cmd>BufferLineCyclePrev<cr>";
      options.desc = "Prev Buffer";
    }
    {
      key = "<Tab>";
      action = "<cmd>BufferLineCycleNext<cr>";
      options.desc = "Next Buffer";
    }
    {
      key = "[b";
      action = "<cmd>BufferLineCyclePrev<cr>";
      options.desc = "Prev Buffer";
    }
    {
      key = "]b";
      action = "<cmd>BufferLineCycleNext<cr>";
      options.desc = "Next Buffer";
    }
    {
      key = "[B";
      action = "<cmd>BufferLineMovePrev<cr>";
      options.desc = "Move buffer prev";
    }
    {
      key = "]B";
      action = "<cmd>BufferLineMoveNext<cr>";
      options.desc = "Move buffer next";
    }
    {
      key = "<A-1>";
      action = "<cmd>BufferLineGoToBuffer 1<cr>";
      options.desc = "Go to buffer 1";
    }
    {
      key = "<A-2>";
      action = "<cmd>BufferLineGoToBuffer 2<cr>";
      options.desc = "Go to buffer 2";
    }
    {
      key = "<A-3>";
      action = "<cmd>BufferLineGoToBuffer 3<cr>";
      options.desc = "Go to buffer 3";
    }
    {
      key = "<A-4>";
      action = "<cmd>BufferLineGoToBuffer 4<cr>";
      options.desc = "Go to buffer 4";
    }
    {
      key = "<A-5>";
      action = "<cmd>BufferLineGoToBuffer 5<cr>";
      options.desc = "Go to buffer 5";
    }
    {
      key = "<A-6>";
      action = "<cmd>BufferLineGoToBuffer 6<cr>";
      options.desc = "Go to buffer 6";
    }
    {
      key = "<A-7>";
      action = "<cmd>BufferLineGoToBuffer 7<cr>";
      options.desc = "Go to buffer 7";
    }
    {
      key = "<A-8>";
      action = "<cmd>BufferLineGoToBuffer 8<cr>";
      options.desc = "Go to buffer 8";
    }
    {
      key = "<A-9>";
      action = "<cmd>BufferLineGoToBuffer 9<cr>";
      options.desc = "Go to buffer 9";
    }
    {
      key = "<A-0>";
      action = "<cmd>BufferLineGoToBuffer 0<cr>";
      options.desc = "Go to last buffer";
    }
    {
      key = "<A-S-1>";
      action = "<cmd>lua require('bufferline').move_to(1)<cr>";
      options.desc = "Move as #1 buffer";
    }
    {
      key = "<A-S-2>";
      action = "<cmd>lua require('bufferline').move_to(2)<cr>";
      options.desc = "Move as #2 buffer";
    }
    {
      key = "<A-S-3>";
      action = "<cmd>lua require('bufferline').move_to(3)<cr>";
      options.desc = "Move as #3 buffer";
    }
    {
      key = "<A-S-4>";
      action = "<cmd>lua require('bufferline').move_to(4)<cr>";
      options.desc = "Move as #4 buffer";
    }
    {
      key = "<A-S-5>";
      action = "<cmd>lua require('bufferline').move_to(5)<cr>";
      options.desc = "Move as #5 buffer";
    }
    {
      key = "<A-S-6>";
      action = "<cmd>lua require('bufferline').move_to(6)<cr>";
      options.desc = "Move as #6 buffer";
    }
    {
      key = "<A-S-7>";
      action = "<cmd>lua require('bufferline').move_to(7)<cr>";
      options.desc = "Move as #7 buffer";
    }
    {
      key = "<A-S-8>";
      action = "<cmd>lua require('bufferline').move_to(8)<cr>";
      options.desc = "Move as #8 buffer";
    }
    {
      key = "<A-S-9>";
      action = "<cmd>lua require('bufferline').move_to(9)<cr>";
      options.desc = "Move as #9 buffer";
    }
  ];
}
