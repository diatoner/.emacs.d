(use-package general
  :ensure t
  :config
  (general-evil-setup)
  (general-define-key
   :states 'motion
   ";" 'evil-ex
   ":" 'evil-repeat-find-char)
  (general-create-definer octo/keybinder-toplevel
    :keymaps '(normal visual emacs magit)
    :prefix "SPC"
    :non-normal-prefix "M-SPC")
  (octo/keybinder-toplevel "d" 'dired)
  (defmacro octo/make-keybinder (infix-key name parent)
    `(general-create-definer
       ,(intern (concat "octo/keybinder-" name))
       :wrapping ,parent
       :prefix-map (quote ,(intern (concat "octo/prefix-map-" name)))
       :infix ,infix-key
       :wk-full-keys nil
       "" '(:ignore t :which-key ,name)))
  (octo/make-keybinder "f" "file" octo/keybinder-toplevel)
  (octo/keybinder-file
    "f" 'find-file
    "n" 'make-empty-file)
  (octo/make-keybinder "b" "buffer" octo/keybinder-toplevel)
  (octo/keybinder-buffer
    "a" 'list-buffers
    "s" 'save-buffer
    "d" 'kill-buffer
    "b" 'switch-to-buffer)
  (octo/make-keybinder "q" "quit" octo/keybinder-toplevel)
  (octo/keybinder-quit
    "q" 'quit)
  (octo/make-keybinder "m" "local" octo/keybinder-toplevel)
  (octo/keybinder-local
    :states '(normal visual emacs)
    :keymaps 'lisp-mode-map
    "" '(:ignore t :which-key "LISP")
    "x" 'eval-defun)
  (octo/keybinder-local
    :states '(normal visual emacs)
    :keymaps 'emacs-lisp-mode-map
    "x" 'eval-defun))
