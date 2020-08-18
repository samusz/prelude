;;; Unicode and UTF-8 stuffs
;;;
(set-default-coding-systems utf8)

;; Unicode Fonts améliore l'affichage de certains caractères Unicode en
;;choisissant des correspondances entre fontes plus appropriées que
;;l'algorithme par défaut d'Emacs. Particulièrement utile avec
;;Prettify Symbols car sans ça Emacs sous Windows 10 est incapable par
;;exemple d'afficher l'opérateur d'égalité

(use-package unicode-fonts
	:config
	(unicode-fonts-setup)
	(setq inhibit-compacting-font-caches t)
	(set-language-environment 'utf-8)
	)

(use-package unicode-whitespace
	:ocnfig
	(unicode-whitespace-setup 'subdued-faces)  ; 'subdued-faces is optional
	(setq global-whitespace-cleanup-mode t)
	)
