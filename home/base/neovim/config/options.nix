{
  globals = {
    mapleader = " ";
    maplocalleader = " ";
    have_nerd_font = true;
    editorconfig = true;
    disable_autoformat = true;
  };

  clipboard = {
    providers = {
      wl-copy.enable = true; # For Wayland
      xsel.enable = true; # For X11
    };
    register = "unnamedplus";
  };

  opts = {
    autochdir = true;
    autoindent = true;
    autoread = true;
    backup = false;
    breakindent = true;
    confirm = true;
    cursorline = true;
    expandtab = true;
    hidden = true;
    hlsearch = true;
    ignorecase = true;
    inccommand = "split";
    list = true;
    mouse = "a";
    number = true;
    relativenumber = true;
    scrolloff = 3;
    showmode = false;
    sidescroll = 3;
    sidescrolloff = 12;
    signcolumn = "yes";
    smartcase = true;
    smartindent = true;
    smarttab = true;
    smoothscroll = true;
    splitbelow = true;
    splitright = true;
    startofline = false;
    swapfile = false;
    termguicolors = true;
    timeoutlen = 300;
    undofile = true;
    updatetime = 250;
    wrap = true;
    writebackup = false;
  };
}
