{ config, pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    waybar
    font-awesome
    wl-clipboard
    libnotify
    swww
    wofi
    wev
    nautilus
    hyprshot
    swaynotificationcenter
    hyprlock
    hypridle
    hyprpaper
  ];
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk pkgs.xdg-desktop-portal-kde ];
  };

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };
  programs.hyprland.enable = true;
}
