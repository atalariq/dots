{ username, ... }: {

  imports = [
    ../base                     # importing OS Agnostic home-manager configuration
  ];

  home = {
    username = username;
    homeDirectory = "/Users/${username}";
    stateVersion = "25.05";
  };

  # enable management of XDG base directories on macOS.
  xdg.enable = true;
}
