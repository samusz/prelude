
;; DONE put this in secret file
;; TODO check it works
(setq paradox-github-token "f593570e16bb65181211310ca9133538a999e77e" )

;;; Quelpa
;; moved to ./preload/packages.el

;; <leaf-install-code>

  (unless (package-installed-p 'leaf)
    (package-refresh-contents)
    (package-install 'leaf))

  (leaf leaf-keywords
    :ensure t
    :init
    ;; optional packages if you want to use :hydra, :el-get, :blackout,,,
    (leaf hydra :ensure t)
    (leaf el-get :ensure t)
    (leaf blackout :ensure t)

    :config
    ;; initialize leaf-keywords.el
    (leaf-keywords-init))
;; </leaf-install-code>

;; Now you can use leaf!
(leaf leaf-tree :ensure t)
(leaf leaf-convert :ensure t)
(leaf transient-dwim
  :ensure t
  :bind (("M-=" . transient-dwim-dispatch)))

;; You can also configure builtin package via leaf!
(leaf cus-start
	:doc "define customization properties of builtins"
	:tag "builtin" "internal"
	:custom
	((user-full-name . "Sacha Muszlak")
		(user-mail-address . "smuszlak@gmail.com")
		(user-login-name . "smuszlak")
		(truncate-lines . t)
		(menu-bar-mode . t)
		(tool-bar-mode . t)
		(scroll-bar-mode . nil)
		(indent-tabs-mode . nil)))


(leaf autorevert
  :doc "revert buffers when files on disk change"
  :tag "builtin"
  :custom ((auto-revert-interval . 0.1))
  :global-minor-mode global-auto-revert-mode)

;; Nest package configurations
(leaf flycheck
  :doc "On-the-fly syntax checking"
  :emacs>= 24.3
  :ensure t
  :bind (("M-n" . flycheck-next-error)
         ("M-p" . flycheck-previous-error))
  :custom ((flycheck-emacs-lisp-initialize-packages . t))
  :hook (emacs-lisp-mode-hook lisp-interaction-mode-hook)
  :config
  (leaf flycheck-package
    :doc "A Flycheck checker for elisp package authors"
    :ensure t
    :config
    (flycheck-package-setup))

  (leaf flycheck-elsa
    :doc "Flycheck for Elsa."
    :emacs>= 25
    :ensure t
    :config
    (flycheck-elsa-setup))

  ;; ...
  )


;; https://github.com/emacs-helm/helm-system-packages

;; (use-package helm-system-packages)


;; All VLF operations are grouped under the C-c C-v prefix by default.


;;; (use-package vlf)
(require 'vlf-setup)
(eval-after-load "vlf"
	'(define-key vlf-prefix-map "\C-c \C-v" vlf-mode-map))

;; for mutlithreaded package download and compilation
(use-package feather)
