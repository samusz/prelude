;;; airline-theme  package config
;; theme-airline.el to sort under theme ....
;; Powerline
(use-package powerline)
;; airline
(use-package airline-themes
	:config (powerline-vim-theme)
	)
