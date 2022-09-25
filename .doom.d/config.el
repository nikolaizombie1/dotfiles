;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "John Doe"
      user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
(setq doom-font (font-spec :family "mononoki Nerd Font" :size 16)
      doom-variable-pitch-font (font-spec :family "mononoki Nerd Font" :size 16))
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;ght; `load-theme' function. This is the default:
(setq doom-theme 'doom-tokyo-night)

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
(require 'emms-setup)
(emms-all)
(emms-default-players)
(setq emms-source-file-default-directory "~/Music/")
(setq confirm-kill-emacs nil)
(after! org
  (setq org-directory "~/Documents/Emacs/org")
  (setq org-log-done 'time)
  (require 'org-bullets)
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))
;; Enabling only some features
(setq dap-auto-configure-features '(sessions locals controls tooltip))
(require 'dap-python)
(setq lsp-rust-server 'rust-server)
;(use-package rustic
;  :ensure
;  :bind (:map rustic-mode-map
;              ("M-j" . lsp-ui-imenu)
;              ("M-?" . lsp-find-references)
;              ("C-c C-c l" . flycheck-list-errors)
;              ("C-c C-c a" . lsp-execute-code-action)
;              ("C-c C-c r" . lsp-rename)
;              ("C-c C-c q" . lsp-workspace-restart)
;              ("C-c C-c Q" . lsp-workspace-shutdown)
;              ("C-c C-c s" . lsp-rust-analyzer-status))
;  :config
  ;; uncomment for less flashiness
  ;; (setq lsp-eldoc-hook nil)
  ;; (setq lsp-enable-symbol-highlighting nil)
;  ;; (setq lsp-signature-auto-activate nil)
;
;  ;; comment to disable rustfmt on save
;  (setq rustic-format-on-save t)
;  (add-hook 'rustic-mode-hook 'rk/rustic-mode-hook))
;
;(defun rk/rustic-mode-hook ()
;  ;; so that run C-c C-c C-r works without having to confirm, but don't try to
;  ;; save rust buffers that are not file visiting. Once
;  ;; https://github.com/brotzeit/rustic/issues/253 has been resolved this should
;  ;; no longer be necessary.
;  (when buffer-file-name
;    (setq-local buffer-save-without-query t))
;  (add-hook 'before-save-hook 'lsp-format-buffer nil t))
;
;(use-package lsp-mode
;  :ensure
;  :commands lsp
;  :custom
;  ;; what to use when checking on-save. "check" is default, I prefer clippy
;  (lsp-rust-analyzer-cargo-watch-command "clippy")
;  (lsp-eldoc-render-all t)
;  (lsp-idle-delay 0.6)
;  ;; enable / disable the hints as you prefer:
;  (lsp-rust-analyzer-server-display-inlay-hints t)
;  (lsp-rust-analyzer-display-lifetime-elision-hints-enable "skip_trivial")
;  (lsp-rust-analyzer-display-chaining-hints t)
;  (lsp-rust-analyzer-display-lifetime-elision-hints-use-parameter-names nil)
;  (lsp-rust-analyzer-display-closure-return-type-hints t)
;  (lsp-rust-analyzer-display-parameter-hints nil)
;  (lsp-rust-analyzer-display-reborrow-hints nil)
;  :config
;  (add-hook 'lsp-mode-hook 'lsp-ui-mode))
;
;(use-package lsp-ui
;  :ensure
;  :commands lsp-ui-mode
;  :custom
;  (lsp-ui-peek-always-show t)
;  (lsp-ui-sideline-show-hover t)
;  (lsp-ui-doc-enable nil))
;
;(use-package company
;  :ensure
;  :custom
;  (company-idle-delay 0.5) ;; how long to wait until popup
;  ;; (company-begin-commands nil) ;; uncomment to disable popup
;  :bind
;  (:map company-active-map
;	      ("C-n". company-select-next)
;	      ("C-p". company-select-previous)
;	      ("M-<". company-select-first)
;	      ("M->". company-select-last)
;              ("<tab>". tab-indent-or-complete)
;	      ("TAB". tab-indent-or-complete)))
;
;(use-package yasnippet
;  :ensure
;  :config
;  (yas-reload-all)
;  (add-hook 'prog-mode-hook 'yas-minor-mode)
;  (add-hook 'text-mode-hook 'yas-minor-mode))
;
;(defun company-yasnippet-or-completion ()
;  (interactive)
;  (or (do-yas-expand)
;      (company-complete-common)))
;
;(defun check-expansion ()
;  (save-excursion
;    (if (looking-at "\\_>") t
;      (backward-char 1)
;      (if (looking-at "\\.") t
;        (backward-char 1)
;        (if (looking-at "::") t nil)))))
;
;(defun do-yas-expand ()
;  (let ((yas/fallback-behavior 'return-nil))
;    (yas/expand)))
;
;(defun tab-indent-or-complete ()
;  (interactive)
;  (if (minibufferp)
;      (minibuffer-complete)
;    (if (or (not yas/minor-mode)
;            (null (do-yas-expand)))
;        (if (check-expansion)
;            (company-complete-common)
;          (indent-for-tab-command)))))
;
;(use-package flycheck :ensure)
;
;(setq lsp-rust-analyzer-server-display-inlay-hints t)
