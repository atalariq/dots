{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    anki-bin  # SRS
    brave     # browser
    obsidian  # note-taking
    kitty     # terminal
    spotify   # preferred music streaming service
    syncthing # Sync folder/files
    vesktop   # discord alternative
    zotero    # references manager
  ];
}
