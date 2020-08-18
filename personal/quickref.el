
;; Quick ref
;;; C-c q by default
(use-package quickref
	:config
	;; to change the key binding
	;; (setq quickref-command-prefix (kbd "C-M-q"))
	(quickref-global-mode +1)
	(setq quickref-save-file "~/org/quickref.org")
	)
