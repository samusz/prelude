(use-package spaceline-all-the-icons
  :after spaceline all-the-icons
	:config
	(spaceline-all-the-icons-theme)
	(spaceline-all-the-icons--setup-anzu)            ;; Enable anzu searching
	(spaceline-all-the-icons--setup-package-updates) ;; Enable package update indicator
	(spaceline-all-the-icons-theme--setup-git-ahead)       ;; Enable # of commits ahead of upstream in git
	(spaceline-all-the-icons--setup-paradox)         ;; Enable Paradox mode line
	(spaceline-all-the-icons--setup-neotree)         ;; Enable Neotree mode line
	)
