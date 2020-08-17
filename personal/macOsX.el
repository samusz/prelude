;; On MacOS also add the following to fix your $PATH environment variable:
(package-install 'exec-path-from-shell)
(exec-path-from-shell-initialize)


(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)
