;; E book reader with annotations in org-mode files xs

(use-package ereader
  :defer t
  :init
  (setq ereader-annotation-files '(
                                 ;; from issue #10
                                 ;;https://github.com/bddean/emacs-ereader/issues/10 
                                 ;;each book has an entry in the
                                 ;;list. Replace the title with the
                                 ;;value of the title from C-h v
                                 ;;ereader-meta-title RET and the path
                                 ;;with your own notes file. Text in
                                 ;;an org file after a link appear as
                                 ;;annotations to the linked position.
                                 ;;TODO defines org-mode file as
                                 ;;annotation target
                                        ;   ("After Virtue: A Study in Moral Theory, Third Edition" .
                                        ;    ("/home/ben/notes/ethics/ethics.org"))
                                   
                                        ;  ("Discipline & Punish: The Birth of the Prison" .
                                        ;   ("/home/ben/notes/ethics/ethics.org"))

                                   ))
  );; -use-package
