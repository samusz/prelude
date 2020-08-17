;;;; markdown-mode.el 
(use-package markdown-mode)

(setq markdown-enable-math t)
;; 

;; A GitHub Flavored Markdown mode, gfm-mode,

;; Use visual-line-mode in gfm-mode
(defun my-gfm-mode-hook ()
  (visual-line-mode 1))
(add-hook 'gfm-mode-hook 'my-gfm-mode-hook)
