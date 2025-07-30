{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    anki-bin # SRS
    brave # browser
    iina # media player
    obsidian # note-taking
    raycast # system finder, alternative to spotlight
    shottr # screenshot tools
    zotero # references manager
    iterm2 # terminal emulator
    ghostty-bin # terminal emulator

    # messaging
    whatsapp-for-mac
    vesktop # discord alternative
  ];
}
