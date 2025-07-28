{ config, pkgs, lib, nixvim, ...}: 
let
  devMode = true; # Include files from dotfiles directly instead of via nix store
  confDir = "${config.home.homeDirectory}/dots/home/neovim/config";
  includeLuaFile =
    path:
    if devMode then
      ''
        -- lua dofile(vim.fn.expand("${confDir}/${path}"))
        lua dofile("${confDir}/${path}")
      ''
    else
      ''
        lua << END
        ${builtins.readFile ./config/${path}}
        END
      '';
in
{
  # programs.neovim = {
  #   enable = true;
  #   defaultEditor = true;
  #   vimAlias = true;
  #   vimdiffAlias = true;
  #   extraConfig = (
  #     builtins.concatStringsSep "\n" ( [
  #       (includeLuaFile "options.lua")
  #       (includeLuaFile "keymaps.lua")
  #       (includeLuaFile "autocmds.lua")
  #     ])
  #   );
  # };

  imports = [ nixvim.homeManagerModules.nixvim ];
  # programs.nixvim = {
  #     enable = true;
  #     defaultEditor = true;
  #     nixpkgs.useGlobalPackages = true;
  #     viAlias = true;
  #     vimAlias = true;
  #   };
  programs.nixvim = import ./nixvim.nix { inherit pkgs lib config; };
}
