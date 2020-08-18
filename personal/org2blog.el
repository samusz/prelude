;; Pour blog sur WordPress

;; pour blog created with WordPress
;; TODO xmlrcp connection fails
(use-package org2blog
	:config
	(setq org2blog/wp-blog-alist
		'(("blog"
			  :url "https://samusz.wordpress.com/xmlrcp.php"
			  :username "samusz")))
	)

;; pour les listes de courses et les recettes gérées dans org-mode.
(use-package org-shoplist)
