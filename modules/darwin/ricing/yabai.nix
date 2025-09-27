{ ... }: {
  services.yabai = {
    enable = true;
    enableScriptingAddition = true;
    config = {
      auto_balance                = "off";
      display_arrangement_order   = "default";
      external_bar                = "off:40:0";
      focus_follows_mouse         = "off";
      insert_feedback_color       = "0xffd75f5f";

      layout                      = "bsp";
      split_ratio                 = 0.50;
      split_type                  = "auto";


      mouse_action1 = "move";
      mouse_action2 = "resize";
      mouse_drop_action           = "swap";
      mouse_follows_focus         = "off";
      mouse_modifier = "fn";

      left_padding = 4;
      top_padding = 4;
      right_padding = 4;
      bottom_padding = 4;
      window_gap = 4;
     
      active_window_opacity       = 1.0;
      menubar_opacity             = 1.0;
      normal_window_opacity       = 0.90;
      window_opacity              = "off";
      window_opacity_duration     = 0.0;

      window_animation_duration   = 0.0;
      window_animation_easing     = "ease_out_circ";
      
      window_insertion_point      = "focused";
      window_origin_display       = "default";
      window_placement            = "second_child";
      window_shadow               = "on";
      window_zoom_persist         = "on";

    };
    extraConfig = ''
      # rules
      yabai -m rule --add app="^System Settings$"    manage=off
      yabai -m rule --add app="^System Information$" manage=off
      yabai -m rule --add app="^System Preferences$" manage=off
      yabai -m rule --add title="Preferences$"       manage=off
      yabai -m rule --add title="Settings$"          manage=off

      # workspace management
      yabai -m space 1 --label code
      yabai -m space 2 --label web
      yabai -m space 3 --label note
      yabai -m space 4 --label work
      yabai -m space 5 --label others

      # assign apps to spaces
      yabai -m rule --add app="iTerm" space=code
      yabai -m rule --add app="Brave" space=web
    '';
  };
}
