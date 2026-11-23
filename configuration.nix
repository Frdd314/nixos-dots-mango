{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
  ];

  boot.loader.systemd-boot.enable = false;

  boot.loader.grub = {
    device = "nodev";
    efiSupport = true;
    useOSProber = true;
  };
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot";

  boot.initrd.kernelModules = ["amdgpu"];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  services.xserver.enable = true;
  services.xserver.videoDrivers = ["amdgpu"];

  xdg.portal = {
    enable = true;
    extraPortals = [pkgs.xdg-desktop-portal-gtk];
    config.common.default = "gtk";
  };

  networking.hostName = "nixos-btw";

  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Kyiv";

  services.printing.enable = true;

  users.users.frdd = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = ["wheel" "video" "network" "input"];
    packages = with pkgs; [
      tree
    ];
  };

  security.sudo.wheelNeedsPassword = false;

  programs.zsh.enable = true;

  environment.shells = with pkgs; [zsh];

  programs.firefox.enable = true;

  services.flatpak.enable = true;

  programs.dconf.enable = true;

  programs.mango = {
    enable = true;
  };

  services.libinput.enable = true;

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = false;
  };

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    vim
    wget
    kitty
    git
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    symbola
  ];

  programs.localsend.enable = true;
  programs.localsend.openFirewall = true;

  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 3d";
  };

  nix.settings.experimental-features = ["nix-command" "flakes"];

  services.openssh.enable = true;

  system.stateVersion = "26.05";
}
