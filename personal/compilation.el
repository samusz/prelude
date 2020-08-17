;;;;Compilation

;; Définit run-compilation et end-compilation qui sauvegardent et
;;restaurent l'affichage des buffers lors d'une séance de compilation
;;: Si l'on doit faire plusieurs allers / retours entre le buffer de
;;compilation et les sources, pour comprendre et corriger les erreurs,
;;on peut ensuite restaurer son environnement de travail.


(defun get-compilation-buffer ()
  "Get the compilation buffer, or nil if it does not exist."
  ;; Voir aussi `compilation-buffer-name-function'
  (car (cl-remove-if-not
        (lambda (b)
          (equal "*compilation*" (buffer-name b)))
        (buffer-list))))

(defun get-compilation-layout-register ()
  "Returns the register used to save the layout before compilation,
and restore it later."
  (message "get-compilation-layout-register ()")
  ;; It seems we can use more than one letter register !
  'comp-layout-reg)

(defun start-new-compilation ()
  "Prompt for command and run a new compilation"
  ;; Passer en plein écran
  ;; (let ((current-prefix-arg '(4))) ; C-u
  ;; (call-interactively 'compile)))
  (call-interactively 'compile))

(defun return-to-compilation ()
  "Get compilation buffer back in full screen"
  ;; Relancer la compil automatiquement ?
  (switch-to-buffer (get-compilation-buffer))
  (delete-other-windows))

(setq ongoing-compilation-session nil)

(defun start-compilation-session ()
  "Save layout and start a new compilation session"
  (frame-configuration-to-register (get-compilation-layout-register))
  (start-new-compilation)
  (setq ongoing-compilation-session t))

(defun end-compilation-session ()
  "Restore pre-compilation layout and terminate compilation session"
  ;; Supprimer le buffer de compil ?
  (setq ongoing-compilation-session nil)
  (jump-to-register (get-compilation-layout-register)))

(defun run-compilation ()
  "Start new compilation session or restore an old one"
  (interactive)
  (if (and ongoing-compilation-session (get-compilation-buffer))
      (return-to-compilation)
    (start-compilation-session)))

(defun end-compilation ()
  "Terminate a compilation session"
  (interactive)
  (if ongoing-compilation-session
      (end-compilation-session)))

;; Le buffer *compilation* défile jusqu'à la première erreur

(setq compilation-scroll-output 'first-error)

;; Dans ce buffer, un clic sur une erreur emmène dans les sources, et g
;;permet de relancer une nouvelle compilation.
