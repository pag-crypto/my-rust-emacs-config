(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(modus-vivendi-tinted))
 '(package-selected-packages
   '(corfu-terminal exec-path-from-shell magit marginalia vertico
		    yasnippet)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)
(set-face-attribute 'default nil :height 150)
(setq x-super-keysym 'meta)
(setq inhibit-startup-message t)
(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-ts-mode))
(add-hook 'rust-ts-mode-hook #'eglot-ensure)
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
