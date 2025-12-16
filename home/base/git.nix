{ ...}: {
  programs.git = {
    enable = true;
    userName = "Atalariq Barra Hadinugraha";
    userEmail = "atalariq.dev@outlook.com";
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
