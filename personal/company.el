
;;; company is for  Auto-completions ;;;

;; using Compagny-mode (ac is obsolete)
(add-hook 'after-init-hook 'global-company-mode)
;; global activation of the unicode symbol completion
(add-to-list 'company-backends 'company-math-symbols-unicode)

;;; Auto-correct
;; the following will tell auto-correct to only correct mistakes in
;;a programming mode buffer that fall within a comment:
(add-hook 'prog-mode-hook
   (lambda ()
     (setq auto-correct-predicate (lambda () (nth 8 (syntax-ppss (point)))))))

;; for text modes, work all the time:
(add-hook 'text-mode-hook
          (lambda ()
            (setq auto-correct-predicate (lambda () t))))

;; don't work in source blocks in Org mode:

(add-hook
 'org-mode-hook
 (lambda ()
   (setq auto-correct-predicate
         (lambda () (not (org-in-src-block-p))))))

;; local configuration for TeX modes (compagny-math see https://github.com/vspinu/company-math)
(defun my-latex-mode-setup ()
  (setq-local company-backends
              (append '((company-math-symbols-latex company-latex-commands))
                      company-backends)))

(add-hook 'TeX-mode-hook 'my-latex-mode-setup)


(use-package company-bibtex
	:config
	(add-to-list 'company-backends 'company-bibtex)
	)

;; completion by statistics
(add-hook 'after-init-hook 'company-statistics-mode)
;; in a nice box
(use-package company-box
	:config
	(add-hook 'company-mode-hook 'company-box-mode)
	(company-quickhelp-mode)  ;; documentation helps !

	(eval-after-load 'company
		'(define-key company-active-map (kbd "C-c h") #'company-quickhelp-manual-begin))
	)
