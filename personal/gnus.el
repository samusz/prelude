(require 'gnus)
(global-set-key  (kbd "C-c G")          'gnus)

;; Valuable keybindings:

;; Action on client                Result in Gmail on the web         Command in Gnus
;; ----------------                --------------------------         --------------
;; Refresh inbox                   Refresh                            M-g
;; Open a message                  Mark a message as read             RET
;; Flag a message                  Apply a star to the message        !
;; Unflag a message                Remove the star from the message   M-u
;; Move a message to a folder      Apply a label to the messageB      m
;; Create a folder                 Create a label                     B m to nonexistent folder will create it.
;; Move a message to [Gmail]/Spam  Report a message as spam           B m [Gmail]Spam RET
;; Move a message to [Gmail]/Trash Move a message to Trash            B m [Gmail]Trash RET
;; Send a message                  Store message in Sent Mail         m
;; Delete a message in inbox       Remove the message from inbox      B DEL
;; Delete a message from a folder  Remove that label from the message B DEL

(setq nnml-directory "~/gmail")
(setq message-directory "~/gmail")

(setq gnus-ignored-newsgroups "")

;; Try to avoid these version if possible...
(setq mm-discouraged-alternatives '( "text/html" "text/richtext" ))

;; Don't start a browser for text/html only mails
(setq mm-automatic-display
      '("text/plain" "text/enriched" "text/richtext"
        "image/.*" "message/delivery-status" "multipart/.*" "message/rfc822"
                    "text/x-patch" "application/pgp-signature" "application/emacs-lisp"))

(setq gnus-select-method
      '(nnimap "gmail"
               (nnimap-address "imap.gmail.com")
               (nnimap-server-port 993)
               (nnimap-stream ssl)))

;; hc/... are specified in personal-ids.el; see Makefile  These must
;; be loaded first...
;;; (require 'personal-ids)

(setq message-send-mail-function 'smtpmail-send-it
      smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil))
      smtpmail-auth-credentials '(("smtp.gmail.com" 587 "smuszlak@gmail.com" "smuszlak117344!"))
      smtpmail-default-smtp-server "smtp.gmail.com"
      smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-smtp-service 587
      starttls-use-gnutls t)

(setq user-full-name "Sacha Muszlak")
(setq user-mail-address "smuszlak@gmail.com")
