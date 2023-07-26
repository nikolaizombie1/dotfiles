;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Fabio Matos"
      user-mail-address "fabio.matos999@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
(setq doom-font (font-spec :family "mononoki Nerd Font" :size 16)
      doom-variable-pitch-font (font-spec :family "mononoki Nerd Font" :size 16)
      doom-big-font (font-spec :family "mononoki Nerd Font" :size 32))
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:

(defun random-doom-theme ()
  "Returns a random doom-theme from a hardcoded list"
  (seq-random-elt
        '(doom-Iosvkem
          doom-horizon
          doom-molokai
          doom-old-hope
          doom-laserwave
          doom-tomorrow-night
          doom-challenger-deep
          doom-monokai-classic
          doom-outrun-electric
          doom-shades-of-purple)))

(setq doom-theme (random-doom-theme))

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(set-frame-parameter (selected-frame) 'alpha '(90 . 90))
(add-to-list 'default-frame-alist '(alpha . (90 . 90)))
(setq confirm-kill-processes nil)
(setq confirm-kill-emacs nil)
(setq dap-auto-configure-mode t)
(require 'dap-cpptools)
(setq default-input-method "japanese")
(evil-define-key 'normal dired-mode-map
  (kbd "h") 'dired-up-directory
  (kbd "l") 'dired-find-file)
(map! :leader
 (:after dired
         (:map dired-mode-map
               :desc "Peep-dired image previews" "d p" #'peep-dired
               :desc "Dired view file" "d v" #'dired-view-file)))
(evil-define-key 'normal peep-dired-mode-map (kbd "<SPC>") 'peep-dired-scroll-page-down
                                             (kbd "C-<SPC>") 'peep-dired-scroll-page-up
                                             (kbd "<backspace>") 'peep-dired-scroll-page-up
                                             (kbd "j") 'peep-dired-next-file
                                             (kbd "k") 'peep-dired-prev-file)
(add-hook 'peep-dired-hook 'evil-normalize-keymaps)
(setq dired-listing-switches "-ahlt -v --group-directories-first")
(setq peep-dired-cleanup-on-disable t)
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.
