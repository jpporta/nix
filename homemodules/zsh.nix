{ pkgs, lib, config, ... }: {
  options = { zsh.enable = lib.mkEnableOption "enables zsh"; };
  config = lib.mkIf config.zsh.enable {
    home.packages = with pkgs; [ zsh eza bat zsh-powerlevel10k gearlever ];
    programs.zsh = {
      enable = true;
      oh-my-zsh = { enable = true; };
      plugins = [

        {
          name = "powerlevel10k";
          src = pkgs.zsh-powerlevel10k;
          file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
        }

      ];
      initExtra = "source ~/.config/p10k.zsh";
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      shellAliases = {
        "tx" = "tmuxinator";
        "gup" = ''git add --all && git commit -m "$(date)" && git push'';
        "n" = "nvim";
        "ls" = "eza --icons=always";
        "gnow" = ''git commit --amend --date="$(date -R)"'';
        "nx-s" = "sudo nixos-rebuild switch --flake ~/nixos#default";
      };
    };
    programs.zoxide = {
      enable = true;
      enableZshIntegration = true;
      options = [ "--cmd cd" ];
    };
    programs.fzf = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}

