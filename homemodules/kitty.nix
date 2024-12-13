{ pkgs, lib, config, ... }: {
  options = { kitty.enable = lib.mkEnableOption "enables kitty"; };
  config = lib.mkIf config.kitty.enable {
    home.packages = with pkgs; [ kitty ollama ];
  };
}

