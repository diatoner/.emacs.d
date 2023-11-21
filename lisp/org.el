;; org
(use-package org
  :ensure nil
  :config
  (add-hook 'org-mode-hook (lambda nil
          (auto-fill-mode 1)
          (set-fill-column 78))))

;; org-publish
(use-package ox-publish
  :after org
  :ensure nil
  :init
  (setq
   org-publish-project-alist
   '(
     ("blog-static"
      :base-directory "~/repos/blog/src/"
      :base-extension "png\\|jpg\\|gif\\|svg\\|otf\\|css"
      :recursive t
      :publishing-function org-publish-attachment
      :publishing-directory "~/repos/blog/dist")

     ("blog-copywriting"
      :base-directory "~/repos/blog/src/"
      :base-extension "org"
      :recursive t
      :publishing-function org-html-publish-to-html
      :publishing-directory "~/repos/blog/dist"

      :section-numbers nil
      :with-toc nil
      :with-author nil
      :with-creator nil

      :html-doctype ""
      :html-xml-declaration ""

      :html-content-class "content"
      :html-indent t

      :html-preamble nil
      :html-postamble nil ))))

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
