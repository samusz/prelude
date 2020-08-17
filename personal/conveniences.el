;; this file configures
;; utillity packages that are mostly nice convieniences
;; all the icons
;; autocorrection with compagny-mode  completion


;;; Usefull defaults
;; cancel bells
;; (ring-bell-function (quote ignore))
; (visible-bell t)

;; terminal Xfce
;;(set-default-font "Liberation Mono 10" t t)


;;parens
(show-paren-mode 1)
(my-require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-mode) ; activation

;; Aggressive fill paragraph
;; see https://github.com/davidshepherd7/aggressive-fill-paragraph-mode

(afp-setup-recommended-hooks)
(add-to-list 'afp-fill-comments-only-mode-list 'python-mode)

;;; All the icons 



;;; Paths ;;;
;; Bin paths for external binaries 
(add-to-list 'exec-path "/opt/local/bin")
(add-to-list 'exec-path "/Users/samusz/.local/bin")
(setenv "PATH" (mapconcat 'identity exec-path ":"))

