;;; Org-Mode config file
                                        ; WIP some things still missing
                                        ; nicer bullets , easy agenda, captures
(use-package org) 
(add-hook 'org-mode-hook 'turn-on-font-lock)
  ;;; Global Org-capture keys ;;;

(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)

(setq org-src-fontify-natively t
      org-src-preserve-indentation nil
      ;; Don't ask if we already have an open Edit buffer
      org-src-ask-before-returning-to-edit-buffer nil
      ;; Where the org files live
      org-directory "~/org/"
      ;; Where should notes go to?
      org-default-notes-file (concat org-directory "notes.org")
      ;; Should everything be hidden?
      org-startup-folded t
      ;; If idle for more than 15 mins, resolve by asking what to do with clock
      org-clock-idle-time 15
      ;; Show more clocking history
      org-clock-history-length 10
      ;; Include running time in clock reports
      org-clock-report-include-clocking-task t
      ;; Setup default clocktable summary
      org-clock-clocktable-default-properties '( :maxlevel 2 :scope file
                                                           :formula % :properties ("Effort" "Points")
                                                           :sort (5 . ?t) :compact t :block today)
      ;; Show as utf-8 chars
      org-pretty-entities t
      ;; global Effort estimate values
      org-global-properties '(("EFFORT_ALL" .
                               ;; hotkeys when doing C-c C-x e
                               ;; 1   2    3    etc  etc
                               "0:30 1:00 2:00 3:00 4:00 5:00 6:00 7:00 10:00")
                              ("POINTS_ALL" .
                               "1 2 3 5 8 13")
                              )
      ;; See down arrow instead of "..." when we have subtrees
      ;; org-ellipsis "⤵"
      ;; Count all children TODO's not just direct ones
      org-hierarchical-todo-statistics nil
      ;; For agenda, only show work related stuff
      org-agenda-files (directory-files-recursively "~/org/" "\.org$")
      org-edit-src-content-indentation 0 
      ;; The right side of | indicates the DONE states
      org-todo-keywords '(
                          (sequence "TODO" "IN-PROGRESS" "PR-PHASE" "BLOCKED" "|" "DONE" "DELEGATED")
                          (sequence "|" "CANCELED")
                          (sequence "CS-TODO" "WAITING-ON-INFOs" "|" "CS-DELEGATED" "CS-DONE")
                          (sequence "UNREAD" "|" "READ")
                          )
      ;; Don't allow TODO's to close without their dependencies done
      org-enforce-todo-dependencies t
      ;; Unchecked boxes will block switching the parent to DONE
      org-enforce-todo-checkbox-dependencies t
      ;; put timestamp when finished a todo
      org-log-done t
      ;; Indent the stars instead of piling them
      org-startup-indented t
      ;; catch invisible edit
      org-catch-invisible-edits 'error
      ;; dont create a bookmark when calling org-capture
      org-capture-bookmark nil

      ;; make TODO entries that cannot be marked as done b/c of unmarked children are shown in a dimmed font or even made invisible in agenda views
      org-agenda-dim-blocked-tasks t
   
      ;; ;; shortcut for links [[SASB:1234][This points to SASB-1234 \o/]]
      ;; org-link-abbrev-alist '(
      ;;                         ("SASB" . "https://datatheorem.atlassian.net/browse/SASB-%s")
      ;;                         ("POR" . "https://datatheorem.atlassian.net/browse/POR-%s")
      ;;                         ("CS" . "https://datatheorem.atlassian.net/browse/CS-%s")
      ;;                         ("CUSTSUP" . "https://datatheorem.atlassian.net/browse/CUSTSUP-%s")
      ;;                         ("API" . "https://datatheorem.atlassian.net/browse/API-%s")
      ;;                         )

      ;; For built in rss reading org-feed
      ;; org-feed-retrieve-method 'curl
      ;; Format for the feeds
    ;;  org-feed-default-template "\n* UNREAD %h\n  %U\n  %description\n  %a\n"
    ;;  org-feed-file (concat org-directory "feed.org")
      ;; Only useful for property searching only but can slow down search :(
      org-use-property-inheritance t
      ;; Don't ask every time when I run a code block
      org-confirm-babel-evaluate nil

      ;; Org agenda
      org-agenda-custom-commands '(
                                   ("h" "Agenda and Home tasks"
                                    ((agenda)
                                     (tags-todo "freetime|break"))
                                    ((org-agenda-sorting-strategy '(priority-down))))
                                   ("w" "Agenda and Work tasks"
                                    ((agenda)
                                     (tags-todo "work|break"))
                                    ((org-agenda-sorting-strategy '(priority-down)))))

      ;; src and babel
      org-startup-folded nil
      org-startup-truncated t
      org-startup-with-inline-images t
      org-archive-mark-done t
      org-src-tab-acts-natively t
      org-edit-src-content-indentation 0
      org-confirm-babel-evaluate nil
      org-use-speed-commands t
      org-refile-targets (quote ((org-agenda-files :maxlevel . 3)))
      org-refile-use-outline-path (quote file)
      org-html-postamble nil
      org-enforce-todo-checkbox-dependencies t
    ;;  org-speed-commands-user (quote (("S" . org-schedule)))

      ;; org directory 
  
  ;    (org-image-actual-width nil)
      org-log-repeat nil
   ;;   (org-tags-exclude-from-inheritance (quote ("song")))
  ;    (org-blank-before-new-entry (quote ((heading) (plain-list-item))))




      ;; org-capture-templates '(
      ;;                         ("t" "Todo" entry (file+headline "~/.emacs.d/org/captured-tasks.org"  "Tasks")
      ;;                          "* TODO %? :break:\n %t\n %i")
      ;;                         )

   ;;    org-capture-templates
;;             `(
;;               ("t" "Task" entry (file "") "* TODO %? %a" :prepend t)
;;               ("s" "Simple Task" entry (file+headline "" "capture") "* TODO %?
;; ")
;;               ("l" "Link" entry (file "") "* TODO %a %T" :prepend t)
;;               ("u"    ;; snipppet from https://orgmode.org/worg/org-contrib/org-drill.html
;;                "Task: Read this URL"
;;                entry  (file+headline "tasks.org" "Articles To Read")
;;                ,(concat "* TODO Read article: '%:description'\nURL: %c\n\n")
;;                :empty-lines 1  :immediate-finish t)
;;               ("w" "Capture web snippet"
;;                entry (file+headline "my-facts.org" "Inbox")
;;                ,(concat "* Fact: '%:description'        :"
;;                         (format "%s" org-drill-question-tag)
;;                         ":\n:PROPERTIES:\n:DATE_ADDED: %u\n:SOURCE_URL: %c\n:END:\n\n%i\n%?\n")
;;                :empty-lines 1               :immediate-finish t)
;;               ;; ...other capture templates...
;;               )
    )





;;; org-agenda
;;     org-agenda-property-list:
;;     This should be a list of all properties you want displayed in the buffer. Default is "LOCATION".
;;     org-agenda-property-position:
;;     This is where you want the properties to be displayed (besides the title or below the title?).

(my-require 'org-beautify-theme)

  ;; Configure org-starter
(my-require 'org-starter)
  ;; ;; Enable external configuration files loaded from
  ;; ;; org-starter-path
(setq org-starter-load-config-files t)

;; Setup DONE 
;; Your custom-file: Set org-starter-path
;; (custom-set-variables
;; ...
;; '(org-starter-path (quote ("~/org/")))
;; ...
;; )

;; Now you can put your configuration in ~/org/.org-config.el
;; (org-starter-def "cpb.org")
;; ----- end of org-starter configuration --- 


;; (require 'swiper);; check swiper is installed 
;; (add-to-list 'org-starter-extra-alternative-find-file-map
;;              '(";" org-starter-swiper-config-files "config")
;;              t)



;;; org-alert ;;;
;; TODO

;; org-async  ;;;
; makes org-babel fluid 
(my-require 'ob-async)

;;;;; ORG BABEL ;;;;;;
;; org babel eval;;;;
;; Keywords: literate programming reproducible research async execution 
;; This package allows you to execute org-mode (babel) source code blocks with eval-in-repl.
;; ## Features
;- Async execution (because it uses an external process!)
;- Babel execution without the output written in the buffer (Less visual distraction! Output is reproducible as long as the code is saved)

; ## Usage
(with-eval-after-load "ob"
  (require 'org-babel-eval-in-repl)
  (define-key org-mode-map (kbd "C-<return>") 'ober-eval-in-repl)
  (define-key org-mode-map (kbd "C-c C-c") 'ober-eval-block-in-repl))

; ## Recommended config (optional):
(with-eval-after-load "eval-in-repl"
  (setq eir-jump-after-eval nil))


;;;; org-board ;;; TODO

;;; org-books ;; TODO org-brains

(my-require 'org-brain)
;; org-caldav ??


;;; org- context ;;

;; https://github.com/thisirs/org-context
(my-require 'org-context)
(org-context-activate)
;;; also need per project configuration eg context ;) see documentation


;;; org-drill ;;;
;; https://orgmode.org/worg/org-contrib/org-drill.html
;; launch a drill with M-x
;; org-drill
;; org-drill-again
;; org-drill-resume
;; org-drill-cram 
(my-require 'org-drill)
(setq org-drill-maximum-items-per-session 22); 22 questions max 
(setq org-drill-maximum-duration 30)   ; 30 minutes
(setq org-drill-add-random-noise-to-intervals-p t) ; avoids lumpiness see docs 
(setq org-drill-learn-fraction 0.45)   ; change the value as desired
;;;; evil-org-mode
;; See evil.el if you use evil vim like keybindings (I do and loves' it's gramar of shortcuts)

;;; org-gcal ;;;

;; ⚠ see this version of org-gcal :: https://github.com/kidd/org-gcal.el/


;; org-gcal-286003 
;;API key created  AIzaSyC_ZRa4sjX3yh7UtJGeAXZfhWVu6EzOixc
;; client ID:
;;;;;;;;;;      861662682642-7dq9j6lticsokdjuso6dr0tbiue927ev.apps.googleusercontent.com
;; client secret: 
;;; wriBAsKmqs_-4_zpc_VNIJSe
(my-require 'org-gcal)
(setq org-gcal-client-id "861662682642-7dq9j6lticsokdjuso6dr0tbiue927ev.apps.googleusercontent.com"
      org-gcal-client-secret "ywriBAsKmqs_-4_zpc_VNIJSe"
      org-gcal-fetch-file-alist '(("smuszlak@gmail.com" .  "~/schedule.org")
                                  ("agkc8bq33a55pnevl9t4v78vp4@group.calendar.google.com" .  "~/org/task.org")
                                  ("avodq1186bdtc3md3576kb0rl8@group.calendar.google.com" . "~/org/scheduleZachary.org")
                                  ("7720pn7nd171ptm5mreqegt1qs@group.calendar.google.com" . "~/org/scheduleGaby.org")
                                  ))
                                        ; 1. to sync use ```org-gcal-fetch```
                                        ; 2. To create a Google Calendar event from an Org-mode
                                        ; event, run ``org-gcal-post-at-point``` command on a headline

;;  TODOist calendar id, agkc8bq33a55pnevl9t4v78vp4@group.calendar.google.com
;; my Zachary's calendar avodq1186bdtc3md3576kb0rl8@group.calendar.google.com
;; my   Gaby 's calendar  7720pn7nd171ptm5mreqegt1qs@group.calendar.google.com


;; org-habit ;;;
;; TODO 


;; idle-org-agenda  >>> see org-agenda
;; TODO 

;;; shoplist
;; pour les listes de courses et les recettes gérées dans org-mode.
(use-package org-shoplist
  :ensure t)
;;; org-paredit TODO

;;; org-magit TODO
(use-package org-timeline
  
  (add-hook 'org-agenda-finalize-hook
            'org-timeline-insert-timeline
            :append))

;; ;; Indent the org-mode file at startup
(org-startup-indented t)
;; ;; All headings visible at startup
;; (org-startup-folded "content")
;; ;; align tables
;; (org-startup-align-all-tables t)

;; ;; Bog mode
(use-package bog
  :ensure t
  :hook
  (org-mode-hook . bog-mode)
  ;;; a hook is in the form
  ;; :hook (prog-mode . highlight-indent-guides-mode)
  )

;;;;;; ;; ;; ;; ;; ;; 
;; Omni-Org
;; (setq ivy-omni-org-file-sources '(org-agenda-files))
;;;; using Org-Starter (Yeah !)
;;; (setq ivy-omni-org-file-sources '(org-starter-known-files))



;; (use-package org-ql

;;:quelpa (org-ql :fetcher github :repo
;;  "alphapapa/


