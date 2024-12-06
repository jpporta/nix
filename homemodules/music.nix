{ pkgs, lib, config, ... }: {

  options = { music.enable = lib.mkEnableOption "enables music desktop apps"; };
  config =
    lib.mkIf config.music.enable { home.packages = with pkgs; [ spotify ]; };
}
