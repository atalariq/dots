{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    alt-tab-macos
    # ice-bar
    iina # media player
    iterm2 # terminal emulator
    keycastr
    # raycast # system finder, alternative to spotlight
    shottr
    whatsapp-for-mac
  ];
}
