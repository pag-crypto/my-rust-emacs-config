(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))
(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)
(set-face-attribute 'default nil :height 150)
(setq x-super-keysym 'meta)
(setq inhibit-startup-message t)
(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-ts-mode))
(add-hook 'rust-ts-mode-hook #'eglot-ensure)
(setq eglot-workspace-configuration
      '(:rust-analyzer (:check (:command "clippy")
			:cargo (:features "all")
			:procMacro (:enable t)
			:inlayHints (:enable t))))
(use-package marginalia
	     :ensure t
	     :init (marginalia-mode))
(use-package corfu
	     :ensure t
	     :custom
	     (corfu-auto t)
	     (corfu-auto-delay 0.2)
	     (corfu-auto-prefix 2)
	     (corfu-cycle t)
	     (corfu-popupinfo-delay '(0.5 . 0.2))
	     :init
	     (global-corfu-mode)
	     (corfu-popupinfo-mode))
(require 'yasnippet)
(yas-global-mode 1)
(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic)))
(use-package vertico
	     :ensure t
	     :init (vertico-mode))
;; Structural editing for delimiters
(use-package smartparens
  :ensure t
  :hook (rust-ts-mode . smartparens-mode))

;; Project-wide search and navigation
(use-package consult
  :ensure t
  :bind (("C-s" . consult-line)
         ("M-g g" . consult-goto-line)
         ("C-c s" . consult-ripgrep)))

;; LLM integration (Claude, GPT, etc.)
(use-package gptel
  :ensure t
  :config
  (setq gptel-model 'claude-sonnet-4-20250514
        gptel-backend (gptel-make-anthropic "Claude"
                        :stream t
                        :key #'gptel-api-key-from-auth-source)))

;; Show available keybindings in popup
(use-package which-key
  :ensure t
  :init (which-key-mode))

;; Context actions on any target
(use-package embark
  :ensure t
  :bind (("C-." . embark-act)
         ("C-;" . embark-dwim)))
(use-package embark-consult
  :ensure t
  :after (embark consult))

;; Debug Adapter Protocol (use with codelldb for Rust)
(use-package dape
  :ensure t)

;; Show git changes in fringe
(use-package diff-hl
  :ensure t
  :hook ((prog-mode . diff-hl-mode)
         (magit-post-refresh . diff-hl-magit-post-refresh)))

;; Additional completion-at-point backends for corfu
(use-package cape
  :ensure t
  :init
  (add-to-list 'completion-at-point-functions #'cape-file)
  (add-to-list 'completion-at-point-functions #'cape-dabbrev))

;; Auto-install tree-sitter grammars
(use-package treesit-auto
  :ensure t
  :config
  (global-treesit-auto-mode))

;; envrc: Per-project environment variables via direnv
;; Reads .envrc files for project-specific env (e.g., different Rust toolchains)
;; Requires direnv to be installed: pkg install direnv
;; (use-package envrc
;;   :ensure t
;;   :hook (after-init . envrc-global-mode))
