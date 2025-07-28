{pkgs, lib, ...}: let
  scanPaths = path:
    builtins.map
    (f: (path + "/${f}"))
    (builtins.attrNames
    (lib.attrsets.filterAttrs
      (
      path: _type:
      (_type == "directory") # include directories
      || (
        (path != "default.nix") # ignore default.nix
        && (lib.strings.hasSuffix ".nix" path) # include .nix files
        )
      )
      (builtins.readDir path)));
in {

  imports = (scanPaths ./. );
 
  home.packages = with pkgs; [
    # CLI Tools
    aria2
    bat
    fastfetch
    fd
    fzf
    glow
    htop
    jq
    ripgrep
    rsync
    tlrc
    yt-dlp
    zellij
    zoxide
    
  ];
}
