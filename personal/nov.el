;; Nov-mode, major mode for reading epubs

;; (use-package nov-el
;;   :defer t
;;   :quelpa '(nov-el
;;             :fetcher git
;;             :url https://depp.brause.cc/nov.el.git)
;;   :init

;;   :config 
;;   (add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))

;; ;; default font 
;; (defun my-nov-font-setup ()
;;   (face-remap-add-relative 'variable-pitch :family "Fira Code"
;;                            :height 1.0))
;; (add-hook 'nov-mode-hook 'my-nov-font-setup)

;; ;; Change to justification algorithm
;; ;; use Knth/Plass see https://github.com/Fuco1/justify-kp
;; (use-package justify-kp
;;   :defer t
;;   :init
;;   (setq nov-text-width t)
;;   )


;; (defun my-nov-window-configuration-change-hook ()
;;   (my-nov-post-html-render-hook)
;;   (remove-hook 'window-configuration-change-hook
;;                'my-nov-window-configuration-change-hook
;;                t))

;; (defun my-nov-post-html-render-hook ()
;;   (if (get-buffer-window)
;;       (let ((max-width (pj-line-width))
;;             buffer-read-only)
;;         (save-excursion
;;           (goto-char (point-min))
;;           (while (not (eobp))
;;             (when (not (looking-at "^[[:space:]]*$"))
;;               (goto-char (line-end-position))
;;               (when (> (shr-pixel-column) max-width)
;;                 (goto-char (line-beginning-position))
;;                 (pj-justify)))
;;             (forward-line 1))))
;;     (add-hook 'window-configuration-change-hook
;;               'my-nov-window-configuration-change-hook
;;               nil t)))

;; (add-hook 'nov-post-html-render-hook 'my-nov-post-html-render-hook)
;; )
