;;;; Time related Packages

;; timeclock config (built-in) ;;

(use-package timeclock
	:config
	(define-key ctl-x-map "ti" 'timeclock-in)
	(define-key ctl-x-map "to" 'timeclock-out)
	(define-key ctl-x-map "tc" 'timeclock-change)
	(define-key ctl-x-map "tr" 'timeclock-reread-log)
	(define-key ctl-x-map "tu" 'timeclock-update-mode-line)
	)
