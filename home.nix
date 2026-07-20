{ config, pkgs, ... }:

let
  dotfiles = "${config.home.homeDirectory}/.dotfiles";
in

{
  home.username = "amanoni";
  home.homeDirectory = "/Users/amanoni";
  home.stateVersion = "24.11";
  home.packages = with pkgs; [
    # cli i use constantly
    ripgrep   # fast search
    fd        # fast find
    fzf       # fuzzy finder
    jq        # json on the command line
    lazygit
    neovim
    # the font everything renders in
    nerd-fonts.hack
  ];
  fonts.fontconfig.enable = true;
  home.sessionVariables.EDITOR = "nvim";

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;      # ghost text from history
    syntaxHighlighting.enable = true;  # commands turn green when valid
    initContent = ''
      bindkey '^f' autosuggest-accept
    '';
    shellAliases = {
      ".." = "cd ..";
      add = "git add .";
      push = "git push";
      pull = "git pull";
      m = "git switch main";
      cc = "claude --dangerously-skip-permissions";
      co = "codex --full-auto";
    };
  };  

  programs.starship = {
    enable = true;

    settings = {
      add_newline = false;

      palette = "longhorn";

      palettes.longhorn = {
        burnt_orange = "#BF5700";
        bright_orange = "#FF8A00";
        cream = "#F8E7D0";
        tan = "#D6B48C";
        error_red = "#FF6B6B";
      };

      format = "$directory$git_branch$git_status$cmd_duration$line_break$character";

      directory = {
        style = "bold burnt_orange";
      };

      git_branch = {
        style = "bold cream";
      };

      git_status = {
        style = "bold bright_orange";
      };

      cmd_duration = {
        style = "tan";
        format = "[$duration]($style) ";
      };

      character = {
        success_symbol = "[❯](bold bright_orange)";
        error_symbol = "[❯](bold error_red)";
      };
    };
  };

  # Edit-in-place: the real file stays in my repo, ~/.config just points at it.
  home.file.".config/wezterm".source =
    config.lib.file.mkOutOfStoreSymlink "${dotfiles}/home/.config/wezterm";
  home.file.".config/nvim".source=
    config.lib.file.mkOutOfStoreSymlink "${dotfiles}/home/.config/nvim";
  home.file.".config/herdr".source=
    config.lib.file.mkOutOfStoreSymlink "${dotfiles}/home/.config/herdr";
  home.file.".claude/settings.json".source=
    config.lib.file.mkOutOfStoreSymlink "${dotfiles}/home/.claude/settings.json";
}

