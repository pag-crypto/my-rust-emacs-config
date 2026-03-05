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
