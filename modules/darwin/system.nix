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
      SoftwareUpdate.AutomaticallyInstallMacOSUpdates = false; # disable automatic update
      menuExtraClock.Show24Hour = true; # show 24 hour clock
      hitoolbox.AppleFnUsageType = "Do Nothing"; # one of “Do Nothing”, “Change Input Source”, “Show Emoji & Symbols” (Default), “Start Dictation”

      controlcenter = {
        # 18 = Display icon in menu bar 24 = Hide icon in menu bar
        AirDrop = false;
        Display = false;
        FocusModes = true;
        NowPlaying = true;
        Sound = false;
        Bluetooth = false;
        BatteryShowPercentage = true;
      };

      # customize dock
      dock = {
        autohide = true;
        autohide-delay = 0.3;
        mineffect = "genie";
        orientation = "bottom";
        show-recents = false;

        # Disable hot corner activation
        wvous-bl-corner = 1;
        wvous-br-corner = 1;
        wvous-tl-corner = 1;
        wvous-tr-corner = 1;
      };

      # customize finder
      finder = {
        _FXShowPosixPathInTitle = true; # show full path in finder title
        _FXSortFoldersFirst = true; # Keep folders on top when sorting by name
        AppleShowAllExtensions = true; # show all file extensions
        AppleShowAllFiles = false; # don't show hidden file
        CreateDesktop = false; # don't show icon on desktop
        FXDefaultSearchScope = "SCcf"; # search to current folder only
        FXEnableExtensionChangeWarning = false; # disable warning when changing file extension
        FXPreferredViewStyle = "clmv"; # Use column view as default
        FXRemoveOldTrashItems = false; # don't automatically delete Trash items
        NewWindowTarget = "Recents"; # default folder shown in Finder windows
        ShowExternalHardDrivesOnDesktop = false; # don't show external hard disks on desktop
        ShowHardDrivesOnDesktop = false; # don't show hard disks on desktop
        ShowMountedServersOnDesktop = false; # don't show connected servers on desktop
        ShowRemovableMediaOnDesktop = false; # don't show removable media on desktop
        QuitMenuItem = true; # enable quit menu item
        ShowPathbar = true; # show path bar
        ShowStatusBar = true; # show status bar
      };

      loginwindow = {
        SHOWFULLNAME = false;
        GuestEnabled = false;
      };

      screencapture = {
        disable-shadow = false;
        include-date = true;
        # location = "";
        show-thumbnail = true;
        target = "clipboard";
        type = "png";
      };

      trackpad = {
        ActuationStrength = 0;
        Clicking = true; # enable tap-to-click
        Dragging = true; # enable tap-to-drag
        FirstClickThreshold = 1; # 0 for light clicking, 1 for medium, 2 for firm
        SecondClickThreshold = 1; # 0 for light clicking, 1 for medium, 2 for firm
        TrackpadRightClick = true;
        TrackpadThreeFingerDrag = false;
        TrackpadThreeFingerTapGesture = 2; # 0 to disable three finger tap, 2 to trigger Look up & data detectors
      };

      NSGlobalDomain = {
        InitialKeyRepeat = 15; # normal minimum is 15 (225 ms), maximum is 120 (1800 ms)
        KeyRepeat = 3; # normal minimum is 2 (30 ms), maximum is 120 (1800 ms)
        AppleEnableMouseSwipeNavigateWithScrolls = true;
        AppleEnableSwipeNavigateWithScrolls = true;
        AppleFontSmoothing = 2;
        AppleICUForce24HourTime = true;
        AppleInterfaceStyle = "Dark"; # use dark mode
        AppleInterfaceStyleSwitchesAutomatically = true; # automatically switch between light and dark mode
        AppleMeasurementUnits = "Centimeters";
        AppleKeyboardUIMode = 3;
        AppleMetricUnits = 1;
        ApplePressAndHoldEnabled = true;
        AppleScrollerPagingBehavior = true;
        AppleShowAllExtensions = true;
        AppleShowAllFiles = false;
        AppleShowScrollBars = "Always";
        AppleSpacesSwitchOnActivate = true;
        AppleTemperatureUnit = "Celsius";
        AppleWindowTabbingMode = "fullscreen";

        NSAutomaticCapitalizationEnabled = false;
        NSAutomaticDashSubstitutionEnabled = false;
        NSAutomaticInlinePredictionEnabled = false;
        NSAutomaticPeriodSubstitutionEnabled = false;
        NSAutomaticQuoteSubstitutionEnabled = false;
        NSAutomaticSpellingCorrectionEnabled = false;
        NSAutomaticWindowAnimationsEnabled = false;
        NSDisableAutomaticTermination = true;
        NSScrollAnimationEnabled = true;
        NSTableViewDefaultSizeMode = 2; # size of the finder sidebar icons: 1 (small), 2 (medium) or 3 (large)
        NSDocumentSaveNewDocumentsToCloud = false;
        NSWindowResizeTime = 0.25; # speed of window resizing
        NSWindowShouldDragOnGesture = true;
        "com.apple.keyboard.fnState" = false; # Use F1, F2, etc. keys as standard function keys
        "com.apple.mouse.tapBehavior" = 1; # enables tap to click
        "com.apple.sound.beep.feedback" = 0; # disable feedback sound when the system volume changed
        "com.apple.swipescrolldirection" = true; # enable natural scrolling
        "com.apple.trackpad.enableSecondaryClick" = true;
        "com.apple.trackpad.scaling" = 1.0;
      };

    };

    keyboard = {
      enableKeyMapping = false;
      remapCapsLockToControl = false;
      remapCapsLockToEscape = false;
    };
  };
}
