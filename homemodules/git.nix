{ pkgs, lib, config, ... }: {
	options = {
		git.enable = lib.mkEnableOption "enables git with configuration";
	};
	config = lib.mkIf config.git.enable {
		programs.git = {
				enable = true;
				userEmail = "jpedro.porta@gmail.com";
				userName = "jpporta";
				extraConfig = {
						init = {
								defaultBranch = "main";
						};
				};
		};
				home.packages = with pkgs; [
						lazygit
				];
	};
}
