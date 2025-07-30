{ pkgs, ... }:
{
  # https://nix-community.github.io/nixvim/NeovimOptions/index.html#extrapackages
  extraPackages = with pkgs; [
    alejandra
    nil
    # nixd
  ];

  # https://nix-community.github.io/nixvim/plugins/conform-nvim.html
  plugins.conform-nvim = {
    settings = {
      formatters_by_ft = {
        nix = [ "alejandra" ];
      };
    };
  };

  # lsp.servers.nixd.enable = true;
  lsp.servers.nil_ls.enable = true;
}
