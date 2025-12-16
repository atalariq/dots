{
  config,
  pkgs,
  ...
}: {
  home.packages = [ pkgs.yazi ];
  home.file.".config/yazi" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dots/home/base/neovim/yazi";
  };
}
