;;mouse related stuff



;; copy and paste
(setq mouse-yank-at-point t)
(setq save-interprogram-paste-before-kill t)
(setq mouse-drag-copy-region t)


;; https://julien-montmartin.github.io/dot-emacs/emacs.html#sec-38
;;  La molette de la souris fait défiler les lignes deux par deux
(setq mouse-wheel-scroll-amount '(2)) 

;; Le défilement à l'écran suit la molette, et le pas reste constant
;;quand elle accélère
(setq mouse-wheel-progressive-speed nil)

