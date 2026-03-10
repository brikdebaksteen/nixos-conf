{ config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ./hardware-gaming.nix
      ./desktop.nix
      ./gaming.nix
      ./development.nix
      ./server.nix
      ./maintenance.nix
      ./security.nix
      ./users.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 3;
  boot.loader.timeout = 1;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Brussels";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "nl_BE.UTF-8";
    LC_IDENTIFICATION = "nl_BE.UTF-8";
    LC_MEASUREMENT = "nl_BE.UTF-8";
    LC_MONETARY = "nl_BE.UTF-8";
    LC_NAME = "nl_BE.UTF-8";
    LC_NUMERIC = "nl_BE.UTF-8";
    LC_PAPER = "nl_BE.UTF-8";
    LC_TELEPHONE = "nl_BE.UTF-8";
    LC_TIME = "nl_BE.UTF-8";
  };

  # De Pantheon desktop (als je die wilt houden naast Hyprland)
  services.xserver.enable = true;
  services.xserver.displayManager.lightdm.enable = true;
  services.desktopManager.pantheon.enable = true;

  # Keymap
  services.xserver.xkb = {
    layout = "au";
    variant = "";
  };

  services.printing.enable = true;

  # Audio setup
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Allow unfree packages (Slechts één keer nodig!)
  nixpkgs.config.allowUnfree = true;

  # Systeem pakketten (Samengevoegd tot één lijst)
  environment.systemPackages = with pkgs; [
    librewolf
    hyprland
    libreoffice
    git
    curl
    wget
    vim
    zsh
    docker
    ani-cli
    lobster
    obsidian
    exfat
    exfatprogs
    githubcli
  ];

  # Nix-LD voor compatibiliteit met externe binaries
  programs.nix-ld.enable = true;

  system.stateVersion = "25.11";

  # user fix
  users.users.brik = {
	isNormalUser = true;
	description = "brik";
	extraGroups = ["networkmanager" "wheel" "docker" "video" "audio"];
  };

  # sda1 mountpoint
  fileSystems."/mnt/sda1" = {
	device = "/dev/disk/by-uuid/2dc376c7-e6da-458a-b427-90527ef997d9";
	fsType = "ext4";
	options = [ "nofail" "defaults" ];

  };

  # sdb1 mountpoint
  fileSystems."/mnt/sdb1" = {
	device = "/dev/disk/by-uuid/1E0C-1FCE";
	fsType = "exfat";
	options = [ "nofail" "uid=1000" "gid=100" ];
  };

  # nvme0n1p2 mountpoint (games)
  fileSystems."/mnt/nvme0n1p2" = {
	device = "/dev/disk/by-uuid/4fc6c446-fa7d-4248-acc8-5e014151363c";
	fsType = "ext4";
	options = [ "nofail" "defaults" ];
  };

  virtualisation.docker.enable = true;
}
