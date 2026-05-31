;; This is an operating system configuration generated
;; by the graphical installer.
;;
;; Once installation is complete, you can learn and modify
;; this file to tweak the system configuration, and pass it
;; to the 'guix system reconfigure' command to effect your
;; changes.


;; Indicate which modules to import to access the variables
;; used in this configuration.
(use-modules (gnu) (nongnu packages linux) (nongnu system linux-initrd) (selected-guix-works packages fonts) (gnu packages base) (gnu packages gcc) (gnu packages emacs-xyz) (nonguix)(nongnu packages game-client))
(use-service-modules cups desktop networking ssh xorg)
(use-package-modules vim wm package-management version-control terminals shells xdisorg emacs fonts pulseaudio cmake commencement pkg-config autotools perl rust-apps aspell scheme crypto shellutils gnupg tls guile guile-xyz music)

(operating-system
 (kernel linux)
 (initrd microcode-initrd)
 (firmware (list linux-firmware))
 (locale "en_US.utf8")
 (timezone "America/New_York")
 (keyboard-layout (keyboard-layout "us" "altgr-intl"))
 (host-name "uwu")

 ;; The list of user accounts ('root' is implicit).
 (users (cons* (user-account
                (name "uwu")
                (comment "uwu")
                (group "users")
                (home-directory "/home/uwu")
		(shell (file-append fish "/bin/fish")) 
                (supplementary-groups '("wheel" "netdev" "audio" "video")))
               %base-user-accounts))

 ;; Packages installed system-wide.  Users can also install packages
 ;; under their own account: use 'guix search KEYWORD' to search
 ;; for packages and 'guix install PACKAGE' to install a package.
 (packages (append (list 
		    vim 
		    neovim 
		    hyprland 
		    stow 
		    alacritty
		    kitty
		    flatpak
		    fish
		    rofi
		    fuzzel
		    git
		    emacs
		    wl-clipboard
		    pulsemixer
		    cmake
		    (specification->package "gcc-toolchain")
		    gnu-make
		    pkg-config
		    autoconf
		    automake
		    libtool
		    perl
		    eza
		    libvterm
		    aspell
		    aspell-dict-en
		    aspell-dict-es
		    emacs-geiser
		    emacs-geiser-guile
		    mit-scheme
		    waybar
		    starship
		    keychain
		    direnv
		    guile-gcrypt
		    guile-gnutls
		    guile-sqlite3
		    guile-zlib
		    guile-lzlib
		    guile-avahi
		    guile-git
		    playerctl
		    heroic
		    (specification->package "make")
		    (specification->package "guile-json")
		    (specification->package "font-nerd-fonts-mononoki")
		    (specification->package "steam")
		    (specification->package "rust")
                    (specification->package "wmenu")
                    (specification->package "foot")) %base-packages))

 ;; Below is the list of system services.  To search for available
 ;; services, run 'guix system search KEYWORD' in a terminal.
 (services
  (append (list
           (service openssh-service-type)
           (set-xorg-configuration
            (xorg-configuration (keyboard-layout keyboard-layout))))
          (modify-services %desktop-services
			   (gdm-service-type config =>
					     (gdm-configuration
					      (inherit config)
					      (auto-login? #t)
					      (default-user "uwu")))
			   (guix-service-type config => (guix-configuration
							 (inherit config)
							 (substitute-urls
							  (append (list "https://substitutes.nonguix.org")
								  %default-substitute-urls))
							 (authorized-keys
							  (append (list (plain-file "non-guix.pub"
										    "(public-key 
 (ecc 
  (curve Ed25519)
  (q #C1FD53E5D4CE971933EC50C9F307AE2171A2D3B52C804642A7A35F84F3A4EA98#)
  )
 )"))
								  %default-authorized-guix-keys))
							 ))
			   )))

 (bootloader (bootloader-configuration
              (bootloader grub-efi-bootloader)
              (targets (list "/boot/efi"))
              (keyboard-layout keyboard-layout)))
 (swap-devices (list (swap-space
                      (target (uuid
                               "c7cdc7f2-cb24-4915-9ac7-2e33788fd70a")))))

 ;; The list of file systems that get "mounted".  The unique
 ;; file system identifiers there ("UUIDs") can be obtained
 ;; by running 'blkid' in a terminal.
 (file-systems (cons* (file-system
                       (mount-point "/boot/efi")
                       (device (uuid "8CB6-DD9E"
                                     'fat32))
                       (type "vfat"))
                      (file-system
                       (mount-point "/")
                       (device (uuid
                                "66ce545e-939e-462e-a7f4-49f6844c22a2"
                                'ext4))
                       (type "ext4")) %base-file-systems)))
