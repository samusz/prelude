;;; evil mode keybindings

;; evil-leader should enable before evil,
;; otherwise evil-leader will not work.
(use-package evil-leader
  :config 
  (global-evil-leader-mode)
  (setq evil-leader/in-all-states t)
  (setq evil-leader/non-normal-prefix "S-")
  (evil-leader/set-leader "<SPC>")
  )  

(use-package evil)
;;; vim-like keybindings for Emacs
(evil-leader/set-key
  "e" 'find-file
  "b" 'switch-to-buffer
  "k" 'kill-buffer)
(global-anzu-mode +1)
(global-set-key [remap query-replace] 'anzu-query-replace)
(global-set-key [remap query-replace-regexp] 'anzu-query-replace-regexp)
;; Emacs 24.4 or higher
(with-eval-after-load 'evil
  (use-package evil-anzu))

;;;;;;;;;;; evil for org-mode  ;;;;;;;
(use-package evil-org
  :after org evil
  :config
  (add-hook 'org-mode-hook 'evil-org-mode)
  (add-hook 'evil-org-mode-hook
            (lambda ()
              (evil-org-set-key-theme)))
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))
;; see also https://github.com/Somelauw/evil-org-mode/blob/master/doc/example_config.el
;; for theses more complete example config
(use-package evil-leader
  :ensure t
  :after evil-mode)
(use-package hydra
  :ensure t)

(setf evil-org-key-theme '(navigation insert textobjects additional))
(setf org-special-ctrl-a/e t)
(evil-org-agenda-set-keys)

(add-hook 'org-mode-hook
 (lambda ()
   (evil-org-mode)

   ;; Custom mappings
   (evil-define-key 'normal evil-org-mode-map
     (kbd "-") 'org-ctrl-c-minus
     (kbd "|") 'org-table-goto-column
     (kbd "M-o") (evil-org-define-eol-command org-insert-heading)
     (kbd "M-t") (evil-org-define-eol-command org-insert-todo))

   ;; Configure leader key
   (evil-leader/set-key-for-mode 'org-mode
     "." 'hydra-org-state/body
     "t" 'org-todo
     "T" 'org-show-todo-tree
     "v" 'org-mark-element
     "a" 'org-agenda
     "c" 'org-archive-subtree
     "l" 'evil-org-open-links
     "C" 'org-resolve-clocks)

   ;; Define a transient state for quick navigation
   (defhydra hydra-org-state ()
     ;; basic navigation
     ("i" org-cycle)
     ("I" org-shifttab)
     ("h" org-up-element)
     ("l" org-down-element)
     ("j" org-forward-element)
     ("k" org-backward-element)
     ;; navigating links
     ("n" org-next-link)
     ("p" org-previous-link)
     ("o" org-open-at-point)
     ;; navigation blocks
     ("N" org-next-block)
     ("P" org-previous-block)
     ;; updates
     ("." org-ctrl-c-ctrl-c)
     ("*" org-ctrl-c-star)
     ("-" org-ctrl-c-minus)
     ;; change todo state
     ("H" org-shiftleft)
     ("L" org-shiftright)
     ("J" org-shiftdown)
     ("K" org-shiftup)
     ("t" org-todo))))

;;;; Evil-markdown ;;;;;;
;; require markdown-mode, http://jblevins.org/projects/markdown-mode/
;;; install the package from MELPA Stable using package.el
;; and of course
;; evil-mode, https://github.com/emacs-evil/evil

;;; evil cursor style
(defun emacs-state-cursor-bar ()
  "Change cursor for emacs state to bar."
  (set (make-local-variable 'evil-emacs-state-cursor)
       'bar))

(add-hook 'text-mode-hook 'emacs-state-cursor-bar)
(add-hook 'prog-mode-hook 'emacs-state-cursor-bar)
;;;;;;;;;didn't work.
;(use-package evil-markdown
;  :quelpa '(evil-markdown            :fetcher url  :url https://github.com/Somelauw/evil-markdown/blob/master/evil-markdown.el)  :after evil-mode)
;; check if inall is done

(use-package evil-easymotion
  :config
  (evilem-default-keybindings "SPC")
  )


(use-package evil-expat)


(use-package general)

(use-package evil-tabs)
(use-package evil-tex)
(use-package evil-rsi) 
