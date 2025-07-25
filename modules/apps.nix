{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    neovim
    just
  ];
}
