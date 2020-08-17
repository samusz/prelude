

(defun easy-camelcase (arg)
  (interactive "c")
  ;; arg is between a-z
  (cond ((and (>= arg 97) (<= arg 122))
         (insert (capitalize (char-to-string arg))))
        ;; If it's a new line
        ((= arg 13)
         (insert 10))
        ;; We probably meant a key command, so lets execute that
        (t (call-interactively
            (lookup-key (current-global-map) (char-to-string arg))))))

(defun easy-underscore (arg)
  "Convert all inputs of semicolon to an underscore.
If given ARG, then it will insert an acutal semicolon."
  (interactive "P")
  (if arg
      (insert ";")
    (insert "_")))

(defun font-exists-p (font-name)
  (when (member font-name (font-family-list))
    t))

(defun num-of-monitors ()
  "Return the number of monitors the computer is currently connected to."
  (length (display-monitor-attributes-list)))
