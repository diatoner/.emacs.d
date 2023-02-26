(use-package shell
  :after general
  :ensure nil
  :config
  (octo/keybinder-toplevel
    "s" '((lambda () (interactive) (shell-command "git-bash")) :which-key "Bash here"))
  )
