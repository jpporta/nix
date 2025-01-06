# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, lib, ... }:

{
  imports = [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ../../modules/hyprland
    ../../modules/devtools
    inputs.home-manager.nixosModules.default
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking = {
    hostName = "joao-nixos";
    networkmanager.enable = true;
    dhcpcd.enable = true;
  };

  systemd.services.NetworkManager-wait-online.enable = lib.mkForce false;
  services.dnsmasq.enable = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  services.pcscd.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # Set your time zone.
  time.timeZone = "America/Sao_Paulo";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  users.defaultUserShell = pkgs.zsh;
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.jpporta = {
    isNormalUser = true;
    description = "Joao Porta";
    extraGroups = [ "networkmanager" "wheel" "kvm" "libvirtd" "docker" ];
    packages = with pkgs; [ firefox neovim ];
    shell = pkgs.zsh
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = { "jpporta" = import ./home.nix; };
  };

  # Enable automatic login for the user.
  services.getty.autologinUser = "jpporta";

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  nixpkgs.overlays = [
    (self: super: {
      zoomUsFixed = pkgs.zoom-us.overrideAttrs (old: {
        postFixup = old.postFixup + ''
          wrapProgram $out/bin/zoom-us --unset XDG_SESSION_TYPE
        '';
      });
      zoom = pkgs.zoom-us.overrideAttrs (old: {
        postFixup = old.postFixup + ''
          wrapProgram $out/bin/zoom --unset XDG_SESSION_TYPE
        '';
      });
    })
  ];
  environment.systemPackages = with pkgs; [
    vim
    git
    wget
    xfce.thunar
    killall
    zoom
  ];

  # Keyboard
  services.keyd = {
    enable = true;
    keyboards = {
      default = {
        ids = [ "*" ];
        settings = {
          main = {
            capslock = "overload(control, esc)";
            esc = "capslock";
          };
        };
      };
    };
  };

  # Bluetooth
  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot =
    true; # powers up the default Bluetooth controller on boot
  services.blueman.enable = true;

  system.stateVersion = "24.05"; # Did you read the comment?

}
