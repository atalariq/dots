{ ... }:

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

      loginwindow = {
        SHOWFULLNAME = false;
        GuestEnabled = false;
      };
    };
  };
}
