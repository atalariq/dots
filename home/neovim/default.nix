{ pkgs, ...}: 
let
  devMode = true; # Include files from dotfiles directly instead of via nix store
  confDir = "~/dots/home/neovim/config";
  includeLuaFile =
    path:
    if devMode then
      ''
        lua dofile(vim.fn.expand("${confDir}/${path}"))
      ''
    else
      ''
        lua << END
        ${builtins.readFile ./config/${path}}
        END
      '';
in
{

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
    vimdiffAlias = true;
    extraConfig = (
      builtins.concatStringsSep "\n" ( [
        (includeLuaFile "options.lua")
        (includeLuaFile "keymaps.lua")
        (includeLuaFile "autocmds.lua")
      ])
    );
  };
}
