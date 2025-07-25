{ pkgs, ... }: {
  fonts.packages = with pkgs; [
    inter
    karla
    fira-code
    nerd-fonts.fira-code
    nerd-fonts.symbols-only
  ];
}
