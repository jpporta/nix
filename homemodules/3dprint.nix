{ pkgs, lib, config, ... }: {

  options = { print3d.enable = lib.mkEnableOption "enables 3d print apps"; };
  config = lib.mkIf config.workapps.enable {
    home.packages = with pkgs; [ prusa-slicer f3d openscad ];
  };
}
