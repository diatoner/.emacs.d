;; org-roam
;; to be loaded after keybinds.el
(use-package org-roam
  :after org
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

  (general-define-key
   :states '(normal insert)
   :keymaps 'org-mode-map "TAB" 'org-cycle)

  (octo/make-keybinder "n" "org" octo/keybinder-toplevel)
  (octo/keybinder-org
   "l" '(org-insert-link :which-key "Insert link")
   "t" '(org-todo :which-key "Cycle TODO")
   "i" '(org-roam-node-insert :which-key "Insert link to node")
   "n" '(org-roam-node-find :which-key "Find or create node")
   "r" '(org-roam-buffer-toggle :which-key "Toggle roam buffer"))

  (org-roam-db-autosync-mode))

(use-package org-roam-ui
  :after org-roam
  :ensure t
  :config
  (setq org-roam-ui-sync-theme t
        org-roam-ui-follow t
        org-roam-ui-update-on-save t
        org-roam-ui-open-on-start t)
  (octo/keybinder-org
    "u" '(org-roam-ui-mode :which-key "Show graph in browser"))
  )
