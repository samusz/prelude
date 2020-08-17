
; ** LSP

;; In order to be able to use different /LSP/ (/Language Server
;; Protocol/) server according to the programming language that we
;; want  to use, we need a client for LSP. That's where
;; [[https://github.com/emacs-lsp/lsp-mode][lsp-mode]] comes in!

;; #+begin_src emacs-lisp :tangle yes
(use-package lsp-mode
  :hook ((c-mode c++-mode dart-mode java-mode json-mode python-mode typescript-mode xml-mode) . lsp)
  :custom
  (lsp-clients-typescript-server-args '("--stdio" "--tsserver-log-file" "/dev/stderr"))
  (lsp-enable-folding nil)
  (lsp-enable-links nil)
  (lsp-enable-snippet nil)
  (lsp-prefer-flymake nil)
  (lsp-session-file (expand-file-name (format "%s/emacs/lsp-session-v1" xdg-data)))
  (lsp-restart 'auto-restart))

(use-package lsp-ui)

(use-package dap-mode
  :after lsp-mode
  :config
  (dap-mode t)
  (dap-ui-mode t))
;;  #+end_src

;; (use-package lsp-haskell)


;; Another benefit of using LSP to configure the management of your
;; programming language is that LSP servers are also used by other
;; text editors. This increases contributions to these packages. 
