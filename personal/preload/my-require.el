
;; https://julien-montmartin.github.io/dot-emacs/emacs.html#sec-4


;; Un wrapper pour require, qui n'empêche pas le chargement du .emacs
;; lorsqu'un module n'est pas disponible, et génère des traces dans
;;  *Messages*, avec en cas de succès, le temps passé par Emacs pour
;; charger le module.


;; (defun my-require(feature)
;;   (condition-case nil
;;       (let ((ts (current-time)))
;;         (progn
;;           (require feature)
;;           (let ((elapsed (float-time (time-subtract (current-time) ts))))
;;             (message "Successfully load '%s' in %.3fs" feature elapsed))))
;;     (file-error
;;      (progn (message "Fail to load required feature '%s'" feature) nil))))


;; superceded by use of the benchmark parckage
