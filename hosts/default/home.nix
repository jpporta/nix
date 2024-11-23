{ config, pkgs, ... }:

{
  home.username = "jpporta";
  home.homeDirectory = "/home/jpporta";
  home.stateVersion = "24.05"; # Please read the comment before changing.

  imports = [
  	../../homemodules
  ];



  neovim.enable = true;
	workapps.enable = true;
	kitty.enable = true;
	tmux.enable = true;
	zsh.enable = true;
	git.enable = true;

  nixpkgs.config.allowUnfree = true;
  home.packages = [
    pkgs.stow
		pkgs.playerctl
		pkgs.nwg-look
		pkgs.catppuccin-gtk
  ];

		home.pointerCursor = {
			name = "phinger-cursors-light";
			package = pkgs.phinger-cursors;
			size = 32;
			gtk.enable = true;
		};


  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/jpporta/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "nvim";
		SHELL = "zsh";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
