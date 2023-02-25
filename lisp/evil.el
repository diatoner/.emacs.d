(use-package evil
  :ensure t
  :init
  (setq evil-want-C-u-scroll t)
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  :config
  (evil-mode))

(use-package evil-collection
  :after evil
  :ensure t
  :config (evil-collection-init '(dired magit)))

(use-package org-evil
  :after evil
  :ensure t)
