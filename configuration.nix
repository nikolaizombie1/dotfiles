let
  username = "uwu";
in
{
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

  home-manager = {
    useGlobalPkgs = true;
    extraSpecialArgs = { inherit inputs; };
    users = {
      ${username} = import ./nix/home.nix;
    };
  };

  # Bootloader.
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub = {
    enable = true;
    device = "nodev";
    efiSupport = true;
    useOSProber = true;
  };

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

  services.displayManager.gdm.enable = true;
  services.desktopManager.plasma6.enable = true;
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "uwu";
  services.displayManager.defaultSession = "hyprland";
  security.polkit.enable = true;

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
    tombi
    jq
    playerctl
    git
    btop
    gamemode
    mangohud
    mpv
    ripgrep
    unzip
    hyprland-qtutils
    nwg-look
    ffmpeg
    inputs.waytrogen.packages.x86_64-linux.waytrogen
    inputs.audio_output_switcher.packages.x86_64-linux.default
    (aspellWithDicts (
      ds: with ds; [
        en
        en-computers
        en-science
        ca
        es
      ]
    ))
    hyprpaper
    swaybg
    mpvpaper
    awww
    stow
    fish
    steam
    speedcrunch
    cmake
    gimp-with-plugins
    clang
    clang-tools
    cmake-language-server
    transmission_4-gtk
    mangohud
    gamescope
    heroic
    cyanrip
    picard
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.mononoki
    emacs-all-the-icons-fonts
  ];
  hardware.graphics.extraPackages32 = with pkgs.pkgsi686Linux; [
    libva
    pipewire
  ];

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


  networking.firewall.enable = false;

  system.stateVersion = "23.11";
}
