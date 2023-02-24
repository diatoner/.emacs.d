;; Fuzzy finder
;; to be loaded after keybinds.el
(use-package helm
  :ensure t
  :defer 2
  :config
  (helm-mode 1)
  (setq helm-locate-fuzzy-match t)
  (setq helm-split-window-inside-p t
        helm-move-to-line-cycle-in-source t)
  (setq helm-autoresize-max-height 0)
  (setq helm-autoresize-min-height 32)
  (helm-autoresize-mode 1)
  (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
  (define-key helm-map (kbd "C-i") 'helm-execute-persistent-action)
  (define-key helm-map (kbd "C-z")  'helm-select-action)
  (octo/keybinder-toplevel
    ":" '(helm-M-x :which-key "M-x command"))
  (octo/keybinder-buffer
    "b" '(helm-mini :which-key "Search open buffers"))
  (octo/keybinder-file
    "f" '(helm-find-files :which-key "Search for file")))
