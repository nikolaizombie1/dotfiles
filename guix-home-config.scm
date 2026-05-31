;; This is a sample Guix Home configuration which can help setup your
;; home directory in the same declarative manner as Guix System.
;; For more information, see the Home Configuration section of the manual.
(define-module (guix-home-config)
  #:use-module (gnu home)
  #:use-module (gnu home services)
  #:use-module (gnu home services shells)
  #:use-module (gnu services)
  #:use-module (gnu system shadow)
  #:use-module (gnu home services sound)
  #:use-module (gnu home services desktop)
  #:use-module (guix gexp)
  )

(define home-config
  (home-environment
   (services
    (append
     (list
      (service home-fish-service-type
               (home-fish-configuration
		(aliases
		 '(("ls" . "eza --icons -s=changed -T -L 1 --group-directories-first")
		   ("la" . "eza --icons -s=changed -T -L 1 --group-directories-first -a")
		   ("ll" . "eza -lma -s=changed --icons")
		   ("vim" . "nvim")))
		(environment-variables
		 '(("fish_greeting" . "")))
		(config (list (plain-file "config.fish" "
# Vi key bindings
fish_vi_key_bindings

# Starship prompt
starship init fish | source

# PATH
fish_add_path $HOME/.cargo/bin
fish_add_path $HOME/.local/bin
fish_add_path /usr/local/go/bin

# Keychain (interactive shells only)
if status --is-interactive
    keychain --nogui --clear ~/.ssh/id_ed25519_personal -q
    [ -e $HOME/.keychain/$hostname-fish ]; and source $HOME/.keychain/$hostname-fish
end
")))))
      (service home-dbus-service-type)
      (service home-pipewire-service-type)

      (service home-files-service-type
               `((".guile" ,%default-dotguile)
		 (".Xdefaults" ,%default-xdefaults)))

      (service home-xdg-configuration-files-service-type
               `(("gdb/gdbinit" ,%default-gdbinit)
		 ("nano/nanorc" ,%default-nanorc))))

     %base-home-services))))

home-config
