let
  username = "uwu";
in
{
  config,
  pkgs,
  inputs,
  ...
}:

{
  nixpkgs.overlays = [ (import inputs.emacs-overlay) ];
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.home-manager
  ];

  fileSystems."/home/uwu/Mass_Storage" = {
    device = "/dev/disk/by-uuid/d0f46174-ef95-41f7-a866-235038b5cd25";
    fsType = "ext4";
  };

  fileSystems."/home/uwu/NVME_Storage" = {
    device = "/dev/disk/by-uuid/dbe7e37d-213a-481a-bc8f-4ea28858c239";
    fsType = "ext4";
  };

  home-manager = {
    useGlobalPkgs = true;
    extraSpecialArgs = { inherit inputs; };
    users = {
      ${username} = import ./nix/home.nix;
    };
  };

  boot.kernelModules = [
    "kvm-amd"
    "vfio_pci"
    "vfio"
    "vfio_iommu_type1"
    "vfio_virqfd"

    "amdgpu"
  ];
  boot.kernelParams = [
    "amd_iommu=on"
    "vfio-pci.ids=1002:13c0,1002:1640"
    # "vfio-pci.ids=1002:744c,1002:ab30"
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  #boot.blacklistedKernelModules = ["amdgpu"];

  networking.hostName = "uwu"; # Define your hostname.

  #networking.nameservers = [ "8.8.8.8" "1.1.1.1" "1.0.0.1" ];

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        FastConnectable = true;
        Experimental = true;
      };
    };
  };

  services.blueman.enable = true;
  services.fwupd.enable = true;

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
  services.pcscd.enable = true;

  programs.gamemode.enable = true;

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    # Add any missing dynamic libraries for unpackaged programs
    # here, NOT in environment.systemPackages
  ];

  # Enable networking

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n = {
    defaultLocale = "en_US.UTF-8";
    # extraLocales = [
    #   "es_ES.UTF-8/UTF-8"
    #   "en_US.UTF-8/UTF-8"
    # ];
    # extraLocaleSettings = {
    #   LC_ADDRESS = "en_US.UTF-8";
    #   LC_IDENTIFICATION = "en_US.UTF-8";
    #   LC_MEASUREMENT = "en_US.UTF-8";
    #   LC_MONETARY = "en_US.UTF-8";
    #   LC_NAME = "en_US.UTF-8";
    #   LC_NUMERIC = "en_US.UTF-8";
    #   LC_PAPER = "en_US.UTF-8";
    #   LC_TELEPHONE = "en_US.UTF-8";
    #   LC_TIME = "en_US.UTF-8";
    # };
  };

  i18n.inputMethod.type = "fcitx5";
  i18n.inputMethod.enable = true;

  i18n.inputMethod = {
    fcitx5.addons = with pkgs; [
      fcitx5-mozc
      fcitx5-gtk
    ];
  };
  i18n.inputMethod.fcitx5.waylandFrontend = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.gdm.enable = true;
  services.desktopManager.plasma6.enable = true;
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "uwu";
  services.displayManager.defaultSession = "hyprland";
  security.polkit.enable = true;

  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    xwayland.enable = true;
    package = pkgs.swayfx;
  };

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
  };

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-hyprland
      xdg-desktop-portal-gtk
      xdg-desktop-portal-wlr
      xdg-desktop-portal
    ];
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.uwu = {
    isNormalUser = true;
    description = "uwu";
    extraGroups = [ "wheel" "libvirtd" ];
    shell = pkgs.fish;
    packages = with pkgs; [ ];
  };

  programs.fish.enable = true;
  programs.fish.interactiveShellInit = ''
    ${pkgs.any-nix-shell}/bin/any-nix-shell fish --info-right | source
  '';

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  };
  services.flatpak.enable = true;
  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true;
  };

  # Install firefox.
  # programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  networking.firewall.checkReversePath = "loose";
  networking.wireguard.enable = true;
  networking.interfaces.eno1.wakeOnLan.enable = true;
  # services.mullvad-vpn.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  services.input-remapper.enable = true;

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  programs.virt-manager.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;
  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
      runAsRoot = true;
      swtpm.enable = true;
    };
  };

  environment.systemPackages = with pkgs; [
    (emacsWithPackagesFromUsePackage {
      config = ./nix/emacs/init.el;
      alwaysEnsure = true;
      package = emacs-gtk;
      defaultInitFile = true;
    })
    starship
    keychain
    alacritty
    gammastep
    fuzzel
    neovim
    eza
    nil
    libtool
    waybar
    gopls
    rust-analyzer
    rustfmt
    clippy
    vscode
    grim
    slurp
    wl-clipboard
    mako
    pulseaudio
    pulsemixer
    nautilus
    bash-language-server
    yaml-language-server
    jq
    playerctl
    git
    btop
    gamemode
    mangohud
    mpv
    ripgrep
    unzip
    hakuneko
    hyprland-qtutils
    nwg-look
    ffmpeg
    inputs.waytrogen.packages.x86_64-linux.waytrogen
    inputs.audio_output_switcher.packages.x86_64-linux.default
    inputs.color_scheme_generator.packages.x86_64-linux.default
    inputs.hyprland_monitor_switcher.packages.x86_64-linux.default
    inputs.gslapper.packages.x86_64-linux.default
    (aspellWithDicts (
      ds: with ds; [
        en
        en-computers
        en-science
        ca
        es
      ]
    ))
    firefox
    hyprpaper
    swaybg
    mpvpaper
    awww
    stow
    fish
    steam
    speedcrunch
    wallust
    cmake
    gimp-with-plugins
    clang
    clang-tools
    cmake-language-server
    #librewolf
    transmission_4-gtk
    gnumake
    autotiling
    mangohud
    gamescope
    heroic
    cyanrip
    picard
    dnsmasq
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    protontricks
    gst_all_1.gstreamer
    gst_all_1.gst-plugins-base
    gst_all_1.gst-plugins-good
    gst_all_1.gst-plugins-bad
    gst_all_1.gst-plugins-ugly
    gst_all_1.gst-libav
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.mononoki
    emacs-all-the-icons-fonts
  ];
  hardware.graphics.extraPackages32 = with pkgs.pkgsi686Linux; [
    libva
    pipewire
    gst_all_1.gstreamer
    gst_all_1.gst-plugins-base
    gst_all_1.gst-plugins-good
    gst_all_1.gst-plugins-bad
    gst_all_1.gst-plugins-ugly
    gst_all_1.gst-libav
  ];

  programs.firefox.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  services.openssh.ports = [ 39801 ];

  services.gnome.gnome-keyring.enable = true;
  services.keyd = {
    enable = true;
    keyboards = {
      # The name is just the name of the configuration file, it does not really matter
      default = {
        ids = [ "*" ]; # what goes into the [id] section, here we select all keyboards
        # Everything but the ID section:
        settings = {
          # The main layer, if you choose to declare it in Nix
          main = {
            compose = "rightmeta"; # you might need to also enclose the key in quotes if it contains non-alphabetical symbols
          };
          otherlayer = {};
        };
        extraConfig = ''
                # put here any extra-config, e.g. you can copy/paste here directly a configuration, just remove the ids part
                      '';
      };
    };
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
