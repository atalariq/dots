{ ... }: {
  services.yabai = {
    enable = true;
    config = {
      mouse_modifier = "alt";
      mouse_action1 = "move";
      mouse_action2 = "resize";

      # gaps
      top_padding = 5;
      bottom_padding = 5;
      left_padding = 5;
      right_padding = 5;
      window_gap = 5;
    };
    extraConfig = ''
      # rules
      yabai -m rule --add app="^System Settings$"    manage=off
      yabai -m rule --add app="^System Information$" manage=off
      yabai -m rule --add app="^System Preferences$" manage=off
      yabai -m rule --add title="Preferences$"       manage=off
      yabai -m rule --add title="Settings$"          manage=off

      # workspace management
      yabai -m space 1  --label code
      yabai -m space 2  --label web
      yabai -m space 4  --label file
      yabai -m space 3  --label chat

      # assign apps to spaces
      yabai -m rule --add app="iTerm" space=code
      yabai -m rule --add app="Brave" space=web
    '';
  };
}
