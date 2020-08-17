;;; Navigation dans les buffers
;; https://julien-montmartin.github.io/dot-emacs/emacs.html#sec-4 

;; Lorsqu'on navigue dans les buffers, on préfère sauter les buffers
;;ouverts automatiquement par Dired, Helm, ou autre, comme
;;*compilation* par exemple. On définit pour cela la fonction
;;navigate-nostar-buffer, qui cherche le prochain buffer ne commençant
;;pas par * (ou le précédent si appelé avec un argument).


(defun navigate-nostar-buffer (&optional previous)
"Navigate to next \"no star\" buffer, or previous one if PREVIOUS is t."
(let ((start-buffer (buffer-name)))
  (cl-flet ((next-f () (if previous (next-buffer) (previous-buffer))))
    (next-f)
    (while
        (and (string-match-p "^\*" (buffer-name))
             (not (equal start-buffer (buffer-name))))
      (next-f)))))

(defun navigate-next-nostar-buffer ()
  "Navigate to next \"no star\" buffer."
  (interactive)
  (navigate-nostar-buffer))

(defun navigate-previous-nostar-buffer ()
  "Navigate to previous \"no star\" buffer."
  (interactive)
  (navigate-nostar-buffer t))


;; Puis on utilise remap pour réaffecter les raccourcis de next-buffer
;;et previous-buffer, C-x ← et C-x → respectivement.

(global-set-key [remap next-buffer] 'navigate-next-nostar-buffer)
(global-set-key [remap previous-buffer] 'navigate-previous-nostar-buffer)
