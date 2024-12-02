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
    useDHCP = false;
    interfaces = { enp14s0 = { useDHCP = true; }; };

    networkmanager.enable = true;
    firewall = { enable = true; };

    defaultGateway = {
      address = "192.169.3.1";
      interface = "enp14s0";
    };
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Set your time zone.
  time.timeZone = "America/Sao_Paulo";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_BR.UTF-8";
    LC_IDENTIFICATION = "pt_BR.UTF-8";
    LC_MEASUREMENT = "pt_BR.UTF-8";
    LC_MONETARY = "pt_BR.UTF-8";
    LC_NAME = "pt_BR.UTF-8";
    LC_NUMERIC = "pt_BR.UTF-8";
    LC_PAPER = "pt_BR.UTF-8";
    LC_TELEPHONE = "pt_BR.UTF-8";
    LC_TIME = "pt_BR.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
  programs.zsh.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.jpporta = {
    isNormalUser = true;
    description = "Joao Porta";
    extraGroups = [ "networkmanager" "wheel" "kvm" "libvirtd" "docker" ];
    shell = pkgs.zsh;
    packages = with pkgs; [ firefox neovim ];
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
  # $ nix search wget
  environment.systemPackages = with pkgs; [ vim git wget xfce.thunar killall ];

  # Keyboard
  services.keyd = {
    enable = true;
    keyboards = {
      default = {
        ids = [ "*" ];
        settings = { main = { esc = "overload(control, esc)"; }; };
      };
    };
  };

  system.stateVersion = "24.05"; # Did you read the comment?

}
