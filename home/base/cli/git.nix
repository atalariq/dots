{pkgs, ...}: {
  home.packages = with pkgs; [
    gh
    lazygit
  ];

  programs.git = {
    enable = true;
  delta.enable = true;
    userName = "Atalariq Barra Hadinugraha";
    userEmail = "atalariq.dev@outlook.com";
    aliases = {
      cm = "commit";
      ca = "commit --amend --no-edit";
      co = "checkout";
      si = "switch";
      cp = "cherry-pick";

      di = "diff";
      dh = "diff HEAD";

      pu = "pull";
      ps = "push";
      pf = "push --force-with-lease";

      st = "status -sb";
      fe = "fetch";

      ri = "rebase --interactive";
      rc = "rebase --continue";
    };
    ignores = [
      # ide
      ".idea"
      ".vs"
      ".vsc"
      ".vscode"
      # npm
      "node_modules"
      "npm-debug.log"
      # python
      "__pycache__"
      "*.pyc"
      # Others
      ".DS_Store" # mac
    ];
  };
}
