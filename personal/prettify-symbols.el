;;;; Prettity stuff

;; prettify-symbols
(push '(">=" . ?≥) prettify-symbols-alist)
(push '("<=" . ?≤) prettify-symbols-alist)
(push '("->" . ?→) prettify-symbols-alist)

(global-prettify-symbols-mode +1)

;; (use-package fira-code-mode
;;   :custom (fira-code-mode-disabled-ligatures '("[]" "#{" "#(" "#_" "#_(" "x")) ;; List of ligatures to turn off
;;   :hook prog-mode) ;; Enables fira-code-mode automatically for programming major modes

(use-package fira-code-mode
	:config
	;; List of ligatures to turn off
	(setq fira-code-mode-disabled-ligatures
		'("[]" "#{" "#(" "#_" "#_(" "x"))
	;; Enable fira-code-mode automatically for programming major modes
	;; (add-hook 'prog-mode-hook 'fira-code-mode) Or, you can use the
	;;global mode instead of adding a hook:
	(global-fira-code-mode)
	)

;; prettufy org stars eg Prettify headings and plain lists in Org mode
(use-package org-superstar
	:config
	(add-hook 'org-mode-hook
		(lambda () (org-superstar-mode 1)))
	)

;;; prettitfy mode
(use-package pretty-mode
	:config
	(global-pretty-mode 1)

	;; Greek letters for prettify symbols
	(add-hook 'emacs-lisp-mode-hook
		(lambda ()
			(setq prettify-symbols-alist prettify-greek-lower)
			(prettify-symbols-mode t)))
	)
