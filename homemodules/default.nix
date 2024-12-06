{ pkgs, ... }: {
  imports = [
    ./neovim.nix
    ./workapps.nix
    ./kitty.nix
    ./tmux.nix
    ./zsh.nix
    ./git.nix
    ./music.nix
  ];
}
