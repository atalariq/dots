{pkgs, ...}: {
  # Use fish-shell as interactive-shell only
  # - https://wiki.archlinux.org/title/Fish#Setting_fish_as_interactive_shell_only
  # - https://discourse.nixos.org/t/using-fish-interactively-with-zsh-as-the-default-shell-on-macos/48402
  programs.bash = {
    enable = pkgs.stdenv.isLinux ;
    initExtra = ''
        if [[ $(ps --no-header --pid="$PPID" --format=comm) != "fish" && -z "$BASH_EXECUTION_STRING" && "$SHLVL" == 1 ]]
        then
            shopt -q login_shell && LOGIN_OPTION="--login" || LOGIN_OPTION=""
            exec fish $LOGIN_OPTION
        fi
    '';
  };

  programs.zsh = {
    enable = pkgs.stdenv.isDarwin;
    initContent = ''
        if [[ $(ps -o command= -p "$PPID" | awk '{print $1}') != 'fish' ]];
        then
            exec fish -l
        fi
    '';
  };

  home.shell.enableFishIntegration = true;

  programs.fish = {
    enable = true;
    shellAbbrs = {
      ":q" = "exit";
      c = "clear";
      e = "nvim";

      # Pipe to grep and place cursor at %.
      "G" = {
        position = "anywhere";
        setCursor = true;
        expansion = "| grep '%'";
      };

      # git
      g = "git";
      ga   = "git add";
      gaa  = "git add -A";
      gb   = "git branch";
      gbd  = "git branch --delete";
      gc   = "git commit";
      gcl  = "git clone --depth 1";
      gcm  = "git commit -m";
      gco  = "git checkout";
      gcob = "git checkout -b";
      gd   = "git diff";
      gl   = "git log";
      gp   = "git push";
      gpom = "git push origin main";
      gs   = "git status";
      gst  = "git stash";
      gstp =  "git stash pop";
      lg = "lazygit";

      # eza >>> ls
      ll = "eza --icons --group-directories-first -lgh";
      lla = "eza --icons --group-directories-first -algh";
      ls = "eza --icons --group-directories-first";
      lsa = "eza --icons --group-directories-first -a";
      lt = "eza --icons --group-directories-first -T";
      tree = "eza --icons --group-directories-first -T";

      # trash >>> `rm`
      tr = "gio trash";
      rm = "gio trash";
      rm-empty-files = "find . -type f -empty -print -delete";
      rm-empty-folders = "find . -type d -empty -print -delete";
      rmm = "rm -rfv";

      # yazi
      fm = "yazi";
      fmm = "yy";
    } 
      # yt-dlp
    // (let
       dl = "yt-dlp";
       browser = "brave";
       flagVideo = "--ignore-errors --continue --no-overwrites --embed-metadata --xattrs --embed-chapters --write-auto-subs --embed-subs --merge-output-format mkv -f \"bestvideo[vcodec^=av01][ext=mp4][height<=1080]+bestaudio[acodec^=opus]/bestvideo[vcodec^=vp9][ext=mp4][height<=1080]+bestaudio[acodec^=opus]/best\"";
       flagAudio = "--ignore-errors --continue --no-overwrites --embed-metadata --embed-thumbnail --xattrs --extract-audio --audio-format best --audio-quality 0 -f bestaudio";
       in {
         yt   = "${dl}";
         ytf  = "${dl} --cookies-from-browser ${browser} --list-formats";
         ytv  = "${dl} -o ' --no-playlist %(title)s by %(uploader)s.%(ext)s' ${flagVideo}";
         yta  = "${dl} -o '--no-playlist %(title)s.%(ext)s' ${flagAudio}";
         ytvp = "${dl} -o '%(playlist_index)s %(title)s.%(ext)s' --download-archive 0-LIST.txt --yes-playlist ${flagVideo}";
         ytap = "${dl} -o '%(title)s.%(ext)s' --download-archive 0-LIST.txt --yes-playlist ${flagAudio}";
       });

    shellAliases = {
      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd ../../../";
      "....." = "cd ../../../../";

      "cdd" = "cd ~/dots";
      "cdr" = "cd ~/Repos";
      "cdn" = "cd ~/Sync/Notes";

      "cp" = "cp -v";
      "ddf" = "df -h";
      "mkdir" = "mkdir -p";
      "mv" = "mv -v";
    };
    functions = {
      __fish_command_not_found_handler = {
        body = "__fish_default_command_not_found_handler $argv[1]";
        onEvent = "fish_command_not_found";
      };

      gitignore = "curl -sL https://www.gitignore.io/api/$argv";

      ad = ''
      function mkfile
        set file $argv[1]
        switch $file
          case "*/"
            mkdir -p $file
          case "*"
            mkdir -p (dirname "$file")
            touch $file
        ;;
        end
      end

      for file in $argv
        mkfile $file
      end
      '';

      take = ''
        set folder $argv[1]
        mkdir -p $folder
        cd $folder
      '';
    };

    plugins = [
      { name = "autopair"; src = pkgs.fishPlugins.autopair; }
      { name = "done"; src = pkgs.fishPlugins.done; }
      { name = "sponge"; src = pkgs.fishPlugins.sponge; }
      { name = "fish-you-should-use"; src = pkgs.fishPlugins.fish-you-should-use; }
    ];
  };
}
