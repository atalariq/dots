{ pkgs, ... }:
{
  # https://nix-community.github.io/nixvim/NeovimOptions/index.html#extrapackages
  extraPackages = with pkgs; [
    clang-tools
  ];

  # https://nix-community.github.io/nixvim/plugins/conform-nvim.html
  plugins.conform-nvim = {
    settings = {
      formatters_by_ft = {
        cpp = [ "clang_format" ];
      };
    };
  };

  lsp.servers.clangd.enable = true;
  lsp.servers.clangd.settings = {
    cmd = [
      "clangd"
      "--background-index"
    ];
    filetypes = [
      "c"
      "cpp"
    ];
    root_markers = [
      "compile_commands.json"
      "compile_flags.txt"
    ];
  };
}
