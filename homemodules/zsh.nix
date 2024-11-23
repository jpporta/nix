{ pkgs, lib, config, ... }: {
	options = {
		zsh.enable = lib.mkEnableOption "enables zsh";
	};
	config = lib.mkIf config.zsh.enable {
			home.packages = with pkgs; [
				eza
				bat
				zsh-powerlevel10k
			];
				programs.zsh = {
						enable = true;
						oh-my-zsh = {
								enable = true;
						};
						plugins = [

								{name = "powerlevel10k";src = pkgs.zsh-powerlevel10k;file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";}

						]; 
						initExtra = "source ~/.config/p10k.zsh";
						autosuggestion.enable = true;
						syntaxHighlighting.enable = true;
						shellAliases = {
								"tx" = "tmuxinator";
								"gup" = "git add --all && git commit -m \"$(date)\" && git push";
								"n" = "nvim";
								"ls" = "eza --icons=always";
								"gnow" = "git commit --amend --date=\"$(date -R)\"";
								"nx-s" = "sudo nixos-rebuild switch --flake ~/nixos#default";
						};
				};
				programs.zoxide = {
						enable = true;
						enableZshIntegration = true;
				};
				programs.fzf = {
						enable = true;
						enableZshIntegration = true;
				};
			xdg.configFile."p10k.zsh" = {
					source = ./dotfiles/.config/.p10k.zsh;
				};
	};
}

