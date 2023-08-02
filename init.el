(tool-bar-mode -1)
(menu-bar-mode -1)
(setq confirm-kill-processes nil)

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))


(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/")
	       '("gnu" . "http://elpa.gnu.org/packages/"))
(setq evil-want-keybinding nil)

;;(straight-use-package '(evil :host github :repo "emacs-evil/evil"))
;; (straight-use-package 'evil
;; :config (evil-mode t))
;; (use-package evil-collection
;; 	     :after (evil)
;; 	     :straight (evil-collection :type git
;; 					:host github
;; 					:repo "emacs-evil/evil-collection"))
(straight-use-package 'evil)
(setq evil-overriding-maps nil)
(evil-mode t)
(straight-use-package 'evil-collection)
(evil-collection-init)
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
	  doom-ayu-dark)))
(straight-use-package 'doom-themes)
(straight-use-package 'all-the-icons)
(straight-use-package 'all-the-icons-dired)
(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)
(setq doom-themes-enable-bold t)
(setq doom-themes-enable-italic t)
(load-theme (random-doom-theme) t)
(doom-themes-org-config)
(straight-use-package 'page-break-lines)
(straight-use-package 'dashboard)
(dashboard-setup-startup-hook)
(setq initial-buffer-choice (lambda () (get-buffer-create "*dashboard*")))

(straight-use-package 'rustic)
(setq rustic-cargo-check-exec-command "clippy")

(straight-use-package 'lsp-mode)
(straight-use-package 'projectile)
(straight-use-package 'helm)
(straight-use-package 'helm-lsp)
(straight-use-package 'helm-projectile)
(straight-use-package 'lsp-ui)
(setq lsp-inlay-hint-enable t)
(straight-use-package 'company)
(straight-use-package 'company-mode)
(global-company-mode)
(straight-use-package 'lsp-treemacs)
(lsp-treemacs-sync-mode 1)
(straight-use-package 'treemacs)
(straight-use-package 'dap-mode)
(require 'dap-cpptools)
(require 'dap-gdb-lldb)
(straight-use-package 'vterm)
(setq vterm-shell "/usr/bin/fish")
(straight-use-package 'exec-path-from-shell)
(exec-path-from-shell-initialize)
(straight-use-package 'nerd-icons)
(setq nerd-icons-font-family "Mononoki Nerd Font")
(straight-use-package 'doom-modeline)
(doom-modeline-mode 1)
(straight-use-package 'magit)
(straight-use-package 'undo-tree)
(straight-use-package 'fish-mode)
(straight-use-package 'lua-mode)
(straight-use-package 'org-mode)

(add-to-list 'default-frame-alist '(font . "Mononoki Nerd Font-18" ))
(set-face-attribute 'default t :font "Mononoki Nerd Font-18" )
(set-frame-parameter (selected-frame) 'alpha '(90 . 90))
(add-to-list 'default-frame-alist '(alpha . (90 . 90)))

(evil-set-leader 'normal (kbd "SPC"))
(evil-set-leader 'emacs (kbd "SPC"))
(evil-define-key 'normal 'global (kbd "<leader>.") 'find-file)
(evil-define-key 'normal 'global (kbd "<leader> o t") 'vterm)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(setq recentf-max-saved-items 25)
(evil-define-key 'normal 'global (kbd "<leader> f r") 'recentf-open-files)
(evil-define-key 'normal 'global (kbd "<leader> b p") 'previous-buffer)
(evil-define-key 'normal 'global (kbd "<leader> b n") 'next-buffer)
(evil-define-key 'normal 'global (kbd "<leader> SPC") 'projectile-find-file)
(evil-define-key 'normal 'global (kbd "<leader> w w") 'evil-window-next)
(evil-define-key 'normal 'global (kbd "<leader> w v") 'evil-window-vsplit)
(evil-define-key 'normal 'global (kbd "<leader> w h") 'evil-window-split)
(evil-define-key 'normal 'global (kbd "<leader> w c") 'evil-window-delete)
(evil-define-key 'normal dired-mode-map
  (kbd "h") 'dired-up-directory
  (kbd "l") 'dired-find-file)
(evil-define-key 'normal 'global (kbd "<leader> c l") 'org-store-link)
(evil-define-key 'normal 'global (kbd "<leader> c a") 'org-agenda)
(evil-define-key 'normal 'global (kbd "<leader> c c") 'org-capture)
(evil-set-undo-system 'undo-tree)
(global-undo-tree-mode 1)
(global-display-line-numbers-mode)
(electric-pair-mode)

(setq warning-minimum-level-level ":error")

(setq evil-want-keybinding t)
(setq tab-always-indent 'complete)
(add-to-list 'completion-styles 'initials t)
(global-font-lock-mode)
(setq rustic-rustfmt-args "--edition 2021")
