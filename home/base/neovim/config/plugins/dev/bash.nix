{ pkgs, ... }:
{
  # https://nix-community.github.io/nixvim/NeovimOptions/index.html#extrapackages
  extraPackages = with pkgs; [
    shellcheck
    shfmt
  ];

  # https://nix-community.github.io/nixvim/plugins/conform-nvim.html
  plugins.conform-nvim = {
    settings = {
      formatters_by_ft = {
        bash = [
          "shellcheck"
          "shfmt"
        ];
      };
    };
  };
}
