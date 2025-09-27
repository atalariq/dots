{ ... }: {
  services.skhd = {
    enable = true;
    skhdConfig = ''
      # alt + a / u / o / s are blocked due to umlaute

      # focus window
      alt - h : yabai -m window --focus west
      alt - j : yabai -m window --focus south
      alt - k : yabai -m window --focus north
      alt - l : yabai -m window --focus east

      # swap managed window
      shift + alt - h : yabai -m window --swap west
      shift + alt - j : yabai -m window --swap south
      shift + alt - k : yabai -m window --swap north
      shift + alt - l : yabai -m window --swap east

      # toggle layout
      alt - d : yabai -m space --layout $(yabai -m query --spaces --space | jq -r 'if .type == "bsp" then "stack" else "bsp" end')
  
      # toggle window zoom
      alt - f : yabai -m window --toggle zoom-fullscreen

      # toggle window split type
      alt - e : yabai -m window --toggle split

      # float / unfloat window and center on screen
      alt - t : yabai -m window --toggle float --grid 4:4:1:1:2:2

      # toggle sticky(+float), picture-in-picture
      alt - p : yabai -m window --toggle sticky --toggle pip

      ctrl - 1 : yabai -m space --focus 1
      ctrl - 2 : yabai -m space --focus 2
      ctrl - 3 : yabai -m space --focus 3
      ctrl - 4 : yabai -m space --focus 4
      ctrl - 5 : yabai -m space --focus 5

      shift + ctrl - 1 : yabai -m window --space 1
      shift + ctrl - 2 : yabai -m window --space 2
      shift + ctrl - 3 : yabai -m window --space 3
      shift + ctrl - 4 : yabai -m window --space 4
      shift + ctrl - 5 : yabai -m window --space 5
    '';
  };
}
