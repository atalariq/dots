{ username, ... }: {

  imports = [
    ../base                     # importing OS Agnostic home-manager configuration
  ];

  home = {
    username = username;
    homeDirectory = "/home/${username}";
    stateVersion = "25.11";
  };


  # enable management of XDG base directories on Linux.
  xdg.enable = true;
  xdg.userDirs.enable = true;
}
