{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    raycast
    shottr
    iina
  ];
}
