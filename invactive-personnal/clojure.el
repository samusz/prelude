(use-package clojure-essential-ref)

(use-package clojure-essential-ref-nov
  :quelpa (clojure-essential-ref-nov :fetcher github :repo "p3r7/clojure-essential-ref")
  :after clojure-essential-ref
  :init
  (setq clojure-essential-ref-nov-epub-path "~/Downloads/Clojure_The_Essential_Reference_v29_MEAP.epub"))
(use-package clojure-essential-ref
  ;; ...
  :bind (
         :map cider-mode-map
         ("C-h F" . clojure-essential-ref)
         :map cider-repl-mode-map
         ("C-h F" . clojure-essential-ref)))
;; WIP

;; add Cider
;; inf-clojure
;; config for snippets necessairy ? 
