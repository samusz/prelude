;; Ansible Mode ;;
;;  you will need to set up your ansible-vault password file.
; By default ansible-vault-mode assumes the file is located at ~/.vault-pass.
; make sure that file has the mode 0600 so other people cannot read it.


(use-package ansible)
(add-hook 'yaml-mode-hook #'ansible-doc-mode)

(use-package ansible-vault) ; to edit ansible-vault files


;; for encrypted ansible yaml files
(add-to-list 'auto-mode-alist '("/encrypted$" . yaml-mode))

(add-hook 'yaml-mode-hook
  (lambda ()
    (and (string= (file-name-base) "encrypted") (ansible-vault-mode 1))))

;; Automatic enabling based on file contents
(add-hook 'yaml-mode-hook 'ansible-vault-mode-maybe)

;; per directory pass file 
;;   first, create a .dir-locals.el file in your directory:
;; ((yaml-mode
;;  (ansible-vault-password-file . "/home/notroot/.ansible-vault/custom_vault_pass")))
;; then, if all your vaulted files are prefixed by "vault_",
;; you can load ansible-vault-mode in your init file this way:
(add-hook 'hack-local-variables-hook
          (lambda ()
            (when (and
                   (derived-mode-p 'yaml-mode)
                   (string-prefix-p "vault_" (file-name-base)))
              (ansible-vault-mode 1))))

;; Ansible 
(add-to-list 'company-backends 'company-ansible)
