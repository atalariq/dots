{ pkgs, ... }:
{
  extraPackages = with pkgs; [
    typst
    tinymist
  ];

  plugins.typst-preview.enable = true;
  lsp.servers.tinymist.enable = true;
}
