;;; Git and magit related config

(require 'magit-delta)
(global-git-gutter-mode +1)

(custom-set-variables
	'(git-gutter:lighter " GG"))


;; https://stackoverflow.com/questions/11403407/git-asks-for-username-every-time-i-push

;; $ git config credential.helper store
;; $ git push http://example.com/repo.git
;; Username: <type your username>
;; Password: <type your password>

;; Do this once then git wont ask for credential ever again on the machine you typed this
;; (warn security risks involved)

(use-package magithub
	:after magit
	:config
	(magithub-feature-autoinject t)
	(setq magithub-clone-default-directory "~/github"))
(use-package magit-todos)
