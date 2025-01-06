{ config, pkgs, ... }:

{
  home.username = "jpporta";
  home.homeDirectory = "/home/jpporta";
  home.stateVersion = "24.05"; # Please read the comment before changing.

  imports = [ ../../homemodules ];

  neovim.enable = true;
  workapps.enable = true;
  kitty.enable = true;
  tmux.enable = true;
  zsh.enable = true;
  git.enable = true;
  music.enable = true;
  print3d.enable = true;

  nixpkgs.config.allowUnfree = true;
  home.packages =
    [ pkgs.stow pkgs.playerctl pkgs.nwg-look pkgs.catppuccin-gtk ];

  home.pointerCursor = {
    name = "phinger-cursors-light";
    package = pkgs.phinger-cursors;
    size = 32;
    gtk.enable = true;
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    SHELL = "zsh";
    GPG_TTY = "$(tty)";
    PRISMA_QUERY_ENGINE_LIBRARY =
      "${pkgs.prisma-engines}/lib/libquery_engine.node";
    PRISMA_QUERY_ENGINE_BINARY = "${pkgs.prisma-engines}/bin/query-engine";
    PRISMA_SCHEMA_ENGINE_BINARY = "${pkgs.prisma-engines}/bin/schema-engine";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
