{ ... }: {
  services.sketchybar = {
    enable = true;
    config = ''
      bar=(
        height=32
        corner_radius=4
        blur_radius=30
        position=top
        sticky=off
        padding_left=10
        padding_right=10
        color=0x15ffffff
      )

      sketchybar --bar "$\{bar[@]}"

      sketchybar --update
      echo "sketchybar configuration loaded.."
    '';
  };
}
