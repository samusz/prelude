;;;;Tramp related stuff


;; Tramp

;; Transfère les fichiers en utilisant ssh, plutôt que ftp

;; tramp default transfer protocol
(setq tramp-default-method "ssh")



;; from https://github.com/emacs-helm/helm-system-packages

;; Transactions such as installing and removing packages are run via the `sudo` command in Eshell.
;; If you’d like to cache the password for, say, an hour, you can configure Eshell to use its own version of sudo via TRAMP:

(use-package em-tramp
	:config
	(setq password-cache t)
	(setq password-cache-expiry 3600)
	)
