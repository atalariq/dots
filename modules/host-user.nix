{ username, ... }: let
  hostname = "on-mac";
  inherit username;
in
{
  networking.hostName = hostname;
  networking.computerName = hostname;
  networking.localHostName = hostname;

  system.defaults.smb.NetBIOSName = hostname;

  users.users."${username}"= {
    home = "/Users/${username}";
    description = username;
    isHidden = false;
  };

  system.primaryUser = username;
  nix.settings.trusted-users = [ username ];
}

