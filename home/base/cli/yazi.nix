{...}: {
  programs.yazi = {
    enable = true;
    enableFishIntegration = true;
    # settings = {
    #   mgr = {
    #     sort_dir_first = true;
    #   };
    # };
  };
  programs.fish.functions = {
    yy = ''
      set tmp (mktemp -t "yazi-cwd.XXXXXX")
      yazi $argv --cwd-file="$tmp"
      if read -z cwd < "$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
      end
      rm -f -- "$tmp"
    '';
  };
}
