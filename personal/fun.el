(use-package 2048-game)


(use-package encourage-mode
  ;; Activate encourage-mode
	:config
	(encourage-mode t)
	(setq encourage-encouragements
		(nconc encourage-encouragements
			'("Excellent!"
				 "Hot sandwich!"
				 "Mein lieber Schwan!"
				 "Nice!"
				 "Outstanding!"
				 "Ossum!"
				 "Quit it!"
				 "Scwhanky!"
				 "Spanakopita!"
				 "SPHINX!"
				 "Supergood!"
				 "Sweet!"
				 "That is so Batman!"
				 "Well done, you!"
				 "Whoa!"
				 "Blinking Flip")))
	)

(use-package kaomoji
	:config
	(setq kaomoji-table
		(append
			'((("angry" "furious") . "(／‵Д′)／~ ╧╧ ")
				 (("angry" "punch") . "#ﾟÅﾟ）⊂彡☆))ﾟДﾟ)･∵"))
			kaomoji-table))

(use-package parrot
	;; To see the party parrot in the modeline, turn on parrot mode:
	:config (parrot-mode)
	)

(use-package poke-line
  :config  (poke-line-mode 1)
  )

(use-package minesweeper)
