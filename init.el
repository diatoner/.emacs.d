(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-hl-line-mode 1)
(blink-cursor-mode 1)

(setq-default tab-width 2 indent-tabs-mode nil)

(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode 1)

(size-indication-mode 1)
(setq inhibit-startup-screen t)
(fset 'yes-or-no-p 'y-or-n-p) 

(global-prettify-symbols-mode t)

(load-theme 'modus-vivendi)
(let ((f "Rec Mono Linear-9"))
  (set-face-attribute 'default nil :font f)
  (set-frame-font f nil t))

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-and-compile
  (setq use-package-always-ensure t
        use-package-expand-minimally t))

(load "~/.emacs.d/lisp/evil.el")
(load "~/.emacs.d/lisp/which-key.el")
(load "~/.emacs.d/lisp/keybinds.el")
(load "~/.emacs.d/lisp/helm.el")
(load "~/.emacs.d/lisp/org.el")
(load "~/.emacs.d/lisp/shell.el")

;; Autocomplete
(use-package company)
(add-hook 'after-init-hook 'global-company-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; EVERYTHING AFTER THIS LINE IS AUTOGENERATED. DO NOT TOUCH
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(org-evil evil-collection org-roam-ui org-roam helm company which-key use-package general evil)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
