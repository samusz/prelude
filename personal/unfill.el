;;Unfill

;;; La fonction fill permet de découper correctement les lignes trop
;;;longues, et le paquet unfill fournit la fonction inverse, celle qui
;;;recolle les lignes. Et même mieux, ce paquet fournit également
;;;unfill-toggle, qui passe d'un état à l'autre. Si simple et
;;;tellement utile ! Travaille sur la région si elle est définie, sur
;;;le paragraphe sinon.  Ref: https://julien-montmartin.github.io/dot-emacs/emacs.html#sec-38

(use-package 'unfill
	:config
	;; Le raccourci par défaut pour fill est remplacé sans états d'âme
	(global-set-key (kbd "M-q") 'unfill-toggle)
	)
