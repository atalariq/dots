{ pkgs, ... }:

  ###################################################################################
  #
  #  macOS's System configuration
  #
  #  All the configuration options are documented here:
  #    https://daiderd.com/nix-darwin/manual/index.html#sec-options
  #  Incomplete list of macOS `defaults` commands :
  #    https://github.com/yannbertrand/macos-defaults
  #
  ###################################################################################
{
  # Add ability to used TouchID for sudo authentication
  security.pam.services.sudo_local.touchIdAuth = true;

  # Set your time zone.
  time.timeZone = "Asia/Jakarta";

  system = {
    stateVersion = 6;

    defaults = {
      menuExtraClock.Show24Hour = true;  # show 24 hour clock
      hitoolbox.AppleFnUsageType = "Do Nothing"; # one of “Do Nothing”, “Change Input Source”, “Show Emoji & Symbols” (Default), “Start Dictation”

      # customize dock
      dock = {
        autohide = true;
        autohide-delay = .3;
        mineffect = "genie";
        orientation = "bottom";
        show-recents = false;
        tilesize = 48;
        persistent-apps = [
          { spacer = { small = false; }; }
          { app = "/Applications/iTerm.app"; }
          { app = "/Applications/Brave Browser.app"; }
          { app = "/Applications/Obsidian.app"; }
          { spacer = { small = true; }; }
          { app = "/Applications/Anki.appp"; }
          { app = "/Applications/Zotero.app"; }
          { app = "/Applications/Discord.app"; }
          { app = "/Applications/WhatsApp.app"; }
          { spacer = { small = false; }; }
        ];
        persistent-others = [
          "~/Downloads/"
          "~/Sync/"
        ];
      };

      # customize finder
      finder = {
        _FXShowPosixPathInTitle = true;  # show full path in finder title
        _FXSortFoldersFirst = true; # Keep folders on top when sorting by name
        AppleShowAllExtensions = true;  # show all file extensions
        FXEnableExtensionChangeWarning = false;  # disable warning when changing file extension
        QuitMenuItem = true;  # enable quit menu item
        ShowPathbar = true;  # show path bar
        ShowStatusBar = true;  # show status bar
      };

      loginwindow.SHOWFULLNAME = false;

      # customize settings that not supported by nix-darwin directly
      # Incomplete list of macOS `defaults` commands :
      #   https://github.com/yannbertrand/macos-defaults
      NSGlobalDomain = {
        # If you press and hold certain keyboard keys when in a text area, the key’s character begins to repeat.
        # This is very useful for vim users, they use `hjkl` to move cursor.
        # sets how long it takes before it starts repeating.
        InitialKeyRepeat = 15;  # normal minimum is 15 (225 ms), maximum is 120 (1800 ms)
        # sets how fast it repeats once it starts. 
        KeyRepeat = 3;  # normal minimum is 2 (30 ms), maximum is 120 (1800 ms)
      };
    };
  };

  # Fonts
  fonts.packages = with pkgs; [
      # system ui font
      inter
      karla

      # icon fonts
      material-design-icons
      font-awesome

      # nerdfonts
      # https://github.com/NixOS/nixpkgs/blob/nixos-unstable-small/pkgs/data/fonts/nerd-fonts/manifests/fonts.json
      nerd-fonts.symbols-only # symbols icon only
      nerd-fonts.fira-code
    ];
}
