(setq shell-file-name "git-bash")
(use-package shell
  :after general
  :ensure nil
  :config
  (octo/keybinder-toplevel
    "s" '(shell :which-key "Bash here"))
  )


