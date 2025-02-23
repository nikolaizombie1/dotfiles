# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  imports = [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  fileSystems."/home/uwu/Mass_Storage" = {
    device = "/dev/disk/by-uuid/d0f46174-ef95-41f7-a866-235038b5cd25";
    fsType = "ext4";
  };

  # nix = {
  #   package = pkgs.nixFlakes;
  #   extraOptions = ''
  #     experimental-features = nix-command
  #   '';
  # };

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "uwu"; # Define your hostname.

  # networking.interfaces.enp5s0.ipv4.addresses = [{
  #   address = "10.0.0.70";
  #   prefixLength = 24;
  # }];

  # networking.defaultGateway = "10.0.0.138";
  networking.nameservers = [ "8.8.8.8" "1.1.1.1" "1.0.0.1" ];
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  nixpkgs.config.allowBroken = true;
  boot.extraModulePackages = with config.boot.kernelPackages; [ r8125 ];

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs;
    [
      # Add any missing dynamic libraries for unpackaged programs
      # here, NOT in environment.systemPackages
    ];

  # Enable networking

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n = {
    defaultLocale = "en_US.UTF-8";
    supportedLocales = [ "es_ES.UTF-8/UTF-8" "en_US.UTF-8/UTF-8" ];
    extraLocaleSettings = {
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
  };

  # i18n.inputMethod.type = "fcitx5";
  # i18n.inputMethod.enable = true;

  # i18n.inputMethod = {
  #   fcitx5.addons = with pkgs; [ fcitx5-mozc fcitx5-gtk ];
  # };
  # i18n.inputMethod.fcitx5.waylandFrontend = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  # services.xserver.desktopManager.plasma5.enable = true;

  services.gvfs.enable = true;

  # Configure keymap in X11
  services.xserver = {
    xkb.layout = "us";
    xkb.variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  #sound.enable = true;
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  xdg.portal.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.uwu = {
    isNormalUser = true;
    description = "uwu";
    extraGroups = [ "wheel" "docker" ];
    shell = pkgs.fish;
    packages = with pkgs; [ kate stow fish steam ];
  };

  programs.fish.enable = true;
  programs.fish.interactiveShellInit = ''
    ${pkgs.any-nix-shell}/bin/any-nix-shell fish --info-right | source
  '';

  programs.steam = {
    enable = true;
    remotePlay.openFirewall =
      true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall =
      true; # Open ports in the firewall for Source Dedicated Server
  };
  services.flatpak.enable = true;
  programs.hyprland.enable = true;

  # Install firefox.
  # programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  networking.firewall.checkReversePath = "loose";
  networking.wireguard.enable = true;
  services.mullvad-vpn.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  environment.systemPackages = with pkgs; [
    emacs-gtk
    starship
    keychain
    alacritty
    gammastep
    fuzzel
    neovim
    xwayland
    eza
    nil
    aspell
    aspellDicts.en
    aspellDicts.en-computers
    aspellDicts.es
    cmake
    gnumake
    gcc
    libtool
    nixfmt-classic
    waybar
    cargo
    rustc
    rust-analyzer
    rustfmt
    clippy
    vscode
    grim
    slurp
    wl-clipboard
    mako
    pulseaudio
    brave
    fastfetch
    pulsemixer
    ghc
    haskell-language-server
    multimarkdown
    nautilus
    go
    python312Packages.python-lsp-server
    bash-language-server
    yaml-language-server
    jq
    playerctl
    python3
    pkg-config
    git
    gparted
    python312Packages.importlib-metadata
    python312Packages.pillow
    python312Packages.platformdirs
    python312Packages.pycairo
    python312Packages.pygobject3
    python312Packages.zipp
    gopls
    btop
    gamemode
    mangohud
    transmission_4-qt
    picard
    filezilla
    mpv
    emmet-ls
    ripgrep
    mullvad-vpn
    ncdu
    waypaper
    lutris
    unzip
    vim
    prismlauncher
    hakuneko
    fastfetch
    nodejs
    gsettings-desktop-schemas
    hyprland-qtutils
    nwg-look
    glib
    ffmpeg
    obs-studio
    inputs.waytrogen.packages.x86_64-linux.waytrogen
    gimp
    inkscape
    dconf-editor
    glibcLocales
    glibcLocalesUtf8
    aspell
    (aspellWithDicts (ds: with ds; [en en-computers en-science ca]))
    firefox
    hyprpaper
    swaybg
    mpvpaper
    swww
  ];

  

  fonts.packages = with pkgs; [ nerd-fonts.mononoki ];

  programs.virt-manager.enable = true;

  users.groups.libvirtd.members = [ "uwu" ];

  virtualisation.libvirtd.enable = true;

  virtualisation.spiceUSBRedirection.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
  services.udev.packages = [ pkgs.yubikey-personalization ];
  security.pam.services = {
    login.u2fAuth = true;
    sudo.u2fAuth = true;
  };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  services.openssh.ports = [ 39801 ];

  services.gnome.gnome-keyring.enable = true;

  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
