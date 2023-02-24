;; org-roam
;; to be loaded after keybinds.el
(use-package org-roam
  :ensure t
  :init
  (setq org-startup-indented t)
  (setq org-return-follows-link t)
  (setq org-hide-leading-stars t)

  (setq org-roam-directory "~/org")
  (add-to-list 'display-buffer-alist
               '("\\*org-roam\\*"
                 (display-buffer-in-side-window)
                 (side . right)
                 (slot . 0)
                 (window-width . 0.33)
                 (window-parameters . ((no-other-window . t)
                                       (no-delete-other-windows . t)))))
  :config
  (setf (cdr (assoc 'file org-link-frame-setup)) 'find-file)

  (general-define-key
   :states '(normal insert)
   :keymaps 'org-mode-map "RET" 'org-return)

  (octo/make-keybinder "n" "org" octo/keybinder-toplevel)
  (octo/keybinder-org
    "i" '(org-roam-node-insert :which-key "Insert link to node")
    "n" '(org-roam-node-find :which-key "Find or create node")
    "r" '(org-roam-buffer-toggle :which-key "Toggle roam buffer"))

  (org-roam-db-autosync-mode)
  )