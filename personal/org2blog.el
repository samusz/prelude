;; Pour blog sur WordPress
(require 'org2blog)
(setq org2blog/wp-blog-alist
      '(("blog"
         :url "https://samusz.wordpress.com/xmlrcp.php"
         :username "samusz")))

;; pour les listes de courses et les recettes gérées dans org-mode.
(require 'org-shoplist)
