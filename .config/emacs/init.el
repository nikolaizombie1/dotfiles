(setq vc-follow-symlinks t)

;; Use-Package Setup
(require 'package)
(require 'use-package)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/"))
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/")) ;; installed by default
(add-to-list 'package-archives '("nongnu" . "https://elpa.nongnu.org/nongnu/")) ;; installed by default from Emacs 28 onwards
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(setq use-package-always-ensure t)
(setq use-package-verbose t)

;; Auto Updates
(use-package auto-package-update
  :defer
  :config
  (setq auto-package-update-interval 7)
  (setq auto-package-update-delete-old-versions t))

;; GCMH (Garbage Collection Optimization)
(use-package gcmh
  :init (gcmh-mode 1))

;; Evil (Vim Emulation)
(use-package evil
  :init
  (setq evil-want-keybinding nil)
  :custom
  (setq evil-want-integration t)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-i-jump nil)
  :config
  (evil-mode 1)

  ;; Use visual line motions even outside of visual-line-mode buffers
  (evil-global-set-key 'motion "j" 'evil-next-visual-line)
  (evil-global-set-key 'motion "k" 'evil-previous-visual-line)

  (evil-set-initial-state 'messages-buffer-mode 'normal)
  (evil-set-initial-state 'dashboard-mode 'normal))

(use-package evil-collection
  :hook (after-init . evil-collection-init))


;; Undo Tree (Persistent Undo History)
(use-package undo-tree
  :hook (after-init . global-undo-tree-mode)
  :config
  (setq undo-tree-auto-save-history t)
  (let ((expanded-dir (expand-file-name "~/.config/emacs/undo")))
    (setq undo-tree-history-directory-alist (list (cons "." expanded-dir))))
  (global-undo-tree-mode)
  (evil-set-undo-system 'undo-tree))

;; Which-Key (Key-Suggestions)
(use-package which-key
  :hook (after-init . which-key-mode)
  :diminish which-key-mode
  :config
  (which-key-mode)
  (setq which-key-idle-delay 1))

;; Ivy (Search Engine)
(use-package ivy-rich
  :after counsel
  :config
  (ivy-rich-mode 1))

(use-package all-the-icons-ivy-rich
  :after ivy-rich
  :config (all-the-icons-ivy-rich-mode 1))

(use-package counsel
  :hook (after-init . counsel-mode)
  (after-init . recentf-mode)
  :bind (("M-x" . counsel-M-x)
	 ("C-x b" . counsel-ibuffer)
	 ("C-x C-f" . counsel-find-file)
	 :map minibuffer-local-map
	 ("C-r" . 'counsel-minibuffer-history)))


(use-package prescient
  :after counsel)
(use-package ivy-prescient
  :after prescient
  :config
  (ivy-prescient-mode))


;; Electric Pair Mode (Automatic Delimiter Insertion)
(electric-pair-mode)

;; Rainbow Delimiters
(use-package rainbow-delimiters
  :hook
  (prog-mode . rainbow-delimiters-mode))

;; Helpful (Enhanced Help Functions)
(use-package helpful
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ([remap describe-function] . counsel-describe-function)
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . counsel-describe-variable)
  ([remap describe-key] . helpful-key))

;; Auto Revert Mode (Sync File Changes)
(global-auto-revert-mode)
(setq dired-auto-revert-buffer t)

;; Eglot (LSP Support)

;; Evil Nerd Commenter (Better Line Commenting)
(use-package evil-nerd-commenter
  :defer
  :config (evilnc-default-hotkeys))

(use-package ripgrep
  :defer)

;; Company (Autosuggestion)
(use-package company
  :init
  (setq company-minimum-prefix-length 0)
  (setq company-idle-delay 0.0)
  :bind (:map company-active-map
  	      ("<tab>" . company-complete-selection)))
(add-hook 'after-init-hook 'global-company-mode)

;; (use-package company-box
;;   :hook (company-mode . company-box-mode))

;; Projectile
(use-package projectile
  :hook (after-init . projectile-mode)
  :config (projectile-mode)
  :custom ((projectile-completion-system 'ivy)))
(use-package counsel-projectile
  :after projectile
  :config (counsel-projectile-mode))

;; Format All (format code)
(use-package format-all
  :hook
  (prog-mode . format-all-mode)
  (LaTeX-mode . format-all-mode)
  :config
  (setq format-all-formatters '(("python" (yapf)))))


;; LSP Integration
(use-package eglot
  :config
  ;; Ensure `nil` is in your PATH.
  (add-to-list 'eglot-server-programs '(nix-mode . ("nil")))
  :hook
  (nix-mode . eglot-ensure)
  (cmake-mode . eglot-ensure))

;; Rustic (Rust Language Support)
(use-package rust-mode
  :mode ("\\.rs\\'" . rust-mode))
(add-hook 'rust-mode-hook 'eglot-ensure)
(add-hook 'rust-mode-hook 'global-company-mode)

;; C Mode (C/C++ Language Support)
(add-hook 'c-mode-hook 'eglot)

;; Python Mode (Python Language Support)
(use-package python-mode
  :mode "\\.py\\'"
  :hook
  (python-mode . eglot)
  :config
  (setq python-shell-interpreter "python3"))

(use-package pyvenv
  :hook (python-mode . pyvenv-mode)
  :config (pyvenv-mode 1)
  (pyvenv-activate (concat (file-name-directory buffer-file-name) "venv")))

;; YAML Mode (YAML Language Support)
(use-package yaml-mode
  :mode "\\.yaml\\'"
  :mode "\\.yml\\'"
  :config
  (add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))
  (add-to-list 'auto-mode-alist '("\\.yaml\\'" . yaml-mode)))

;; Nix Language Support
(use-package nix-mode
  :mode "\\.nix\\'")

(use-package direnv
  :hook
  (nix-mode . direnv-mode)
  (eglot . direnv-mode))

;; CMAKE Mode (CMAKE Language Support)
(use-package cmake-mode
  :mode "CMakeLists\.txt\\'"
  :hook
  (cmake-mode . direnv-mode))

(use-package cmake-font-lock
  :after cmake-mode)

(use-package cmake-ide
  :after cmake-ide
  :config
  (cmake-ide-setup))

;; Fullframe (Maximize buffer)
(use-package fullframe
  :after magit
  :config
  (fullframe magit-status magit-mode-quit-window))

;; Magit (Git Client)
(use-package magit
  :commands (magit-status))

;; General (Global Hot Keys)
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
(use-package general
  :config
  (general-create-definer global-definer
    :keymaps 'override
    :states '(insert emacs normal hybrid motion visual operator)
    :prefix "SPC"
    :non-normal-prefix "S-SPC")
  (global-definer
    "."   '(counsel-find-file :which-key "find-file")
    "o"   '(nil :which-key "open")
    "o t" '((lambda () (interactive)
	      (evil-window-split)
	      (evil-window-next 0)
	      (evil-window-decrease-height 6)
	      (if (projectile-project-p)
		  (projectile-run-vterm 1)
		(vterm))
	      ) :which-key "vterm")
    "o T" '((lambda () (interactive)
	      (if (projectile-project-p)
		  (projectile-run-vterm 1)
		(vterm))) :which-key "vterm fullscreen")
    "f"   '(nil :which-key "file")
    "f r" '(counsel-recentf :which-key "recent files")
    "b"   '(nil :which-key "buffer")
    "b p" '(previous-buffer :which-key "previous buffer")
    "b n" '(next-buffer :which-key "next buffer")
    "b i" '(ivy-switch-buffer-other-window :which-key "list buffers")
    "SPC" '(projectile-find-file :which-key "search file")
    "p f" '(counsel-projectile-rg :which-key "search string")
    "p r" '(projectile-replace :which-key "replace string")
    "p R" '(projectile-replace-regexp :which-key "replace regex")
    "w"   '(nil :which-key "window")
    "w w" '(evil-window-next :which-key "next window")
    "w v" '(evil-window-vsplit :which-key "verticle split")
    "w h" '(evil-window-split :which-key "horizontal split")
    "w c" '(evil-window-delete :which-key "close window")
    "g"   '(nil :which-key "magit")
    "g g" '(magit :which-key "magit-status")
    "d e" '(emms-play-dired :which-key "dired play emms")
    "y"   '(ivy-yasnippet :which-key "yasnippet")
    "c d" '(debug-code :which-key "debug code")))

;; Frame Settings
(tool-bar-mode -1)
(menu-bar-mode -1)
(setq confirm-kill-processes nil)
(scroll-bar-mode -1)
(set-fringe-mode 10)
(setq global-font-lock-mode t)
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
(setq mouse-autoselect-window t)
(setq large-file-warning-threshold nil)
(setq byte-compile-warnings nil)

;; Prompt Settings
(defalias 'yes-or-no-p 'y-or-n-p)

;; Themes and Icons
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
     doom-shades-of-purple
     doom-ayu-dark
     doom-dracula)))
(defun setup-doom-theme ()
  "Setup doom theme."
  (setq doom-themes-enable-bold t)
  (setq doom-themes-enable-italic t)
  (load-theme (random-doom-theme) t)
  )
(use-package doom-themes
  :after doom-modeline
  :config (setup-doom-theme))
(use-package all-the-icons
  :defer)
(use-package nerd-icons
  :defer
  :custom (nerd-icons-font-family "Mononoki Nerd Font"))
(use-package all-the-icons-dired
  :hook (dired-mode . all-the-icons-dired-mode))
(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)

;; Font Configuration
(add-to-list 'default-frame-alist '(font . "Mononoki Nerd Font-18" ))
(set-face-attribute 'default t :font "Mononoki Nerd Font-18" )

;; Frame Transparency
(set-frame-parameter nil 'alpha-background 90)
(add-to-list 'default-frame-alist '(alpha-background . 90))

;; PDF Tools (PDF Viewer)
;;(use-package pdf-tools
;;:defer 1
;;:config
;; (pdf-loader-install)) ; On demand loading, leads to faster startup time

;; Vterm Setup
(use-package vterm
  :commands (vterm)
  :custom
  (setq vterm-shell "/usr/bin/fish")
  (evil-set-initial-state 'vterm-mode 'insert))


;; Eshell Setup
(use-package esh-autosuggest
  :after eshell
  :hook (eshell-mode . esh-autosuggest-mode))
(use-package eshell-syntax-highlighting
  :after eshell
  :config
  (eshell-syntax-highlighting-global-mode +1))
;;(use-package eshell-git-prompt
;;  :after eshell
;;  :config
;;  (eshell-git-prompt-use-theme 'powerline)
;;(setq ivy-do-completion-in-region t)) ; this is the default

(defun setup-eshell-ivy-completion ()
  ;; only if you want to use the minibuffer for completions instead of the
  (setq-local ivy-display-functions-alist
	      (remq (assoc 'ivy-completion-in-region ivy-display-functions-alist)
		    ivy-display-functions-alist)))

(add-hook 'eshell-mode-hook #'setup-eshell-ivy-completion)
(setq eshell-banner-message "")

;; Exec Path From Shell

(use-package exec-path-from-shell
  :hook
  (after-init . exec-path-from-shell-initialize))

;; Flyspell (Spellcheck)
(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'prog-mode-hook 'flyspell-prog-mode)
(add-hook 'after-save-hook 'flyspell-buffer)
(add-hook 'flyspell-mode-hook #'(lambda () (evil-define-key 'normal flyspell-mode-map (kbd ";") 'flyspell-correct-wrapper)))
(setq flyspell-issue-message-flag nil)
(use-package flyspell-correct-ivy
  :after flyspell)
(use-package auto-dictionary
  :hook flyspell)

;; Dired Configuration
(setq dired-listing-switches "-Al --group-directories-first")
(add-hook 'dired-mode-hook 'dired-sort-toggle-or-edit)
(setq dired-dwim-target t)
(evil-define-key 'normal dired-mode-map
  (kbd "h") 'dired-up-directory
  (kbd "l") 'dired-find-file)

;; Line Numbers
(global-display-line-numbers-mode)
(column-number-mode)
(dolist (mode '(org-mode-hook
		term-mode-hook
		vterm-mode-hook
		shell-mode-hook
		treemacs-mode-hook
		eshell-mode-hook
		pdf-view-mode))
  (add-hook mode (lambda() (display-line-numbers-mode 0))))

;; Suppress Warnings
(setq warning-minimum-level-level ":error")

;; Mode Line Customization
(use-package doom-modeline
  :hook (after-init . doom-modeline-mode))

;; Bluetooth
(use-package bluetooth
  :commands (bluetooth-list-devices))

;; Debug message
(message "Init Time: %s with %d garbage collections." (float-time (time-subtract after-init-time before-init-time)) gcs-done)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(global-company-mode nil nil nil "Customized with use-package company")
 '(package-selected-packages
   '(all-the-icons-dired all-the-icons-ivy-rich auto-dictionary
			 auto-package-update auto-package-updates
			 bluetooth cmake-font-lock cmake-ide
			 company-box counsel-projectile direnv
			 doom-modeline doom-themes esh-autosuggest
			 eshell-syntax-highlighting evil-collection
			 evil-nerd-commenter exec-path-from-shell
			 flyspell-correct-ivy format-all fullframe
			 gcmh general helpful ivy-prescient magit
			 nix-mode python-mode pyvenv
			 rainbow-delimiters ripgrep rust-mode
			 tree-sitter-langs undo-tree vterm yaml-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
