;; Change theme based on time
(use-package circadian
  :config
  (setq calendar-latitude 48.86)
  (setq calendar-longitude 2.33)
  (setq circadian-themes '((:sunrise . wombat)
                           ("8:00"   . tango)
                           (:sunset  . adwaita)
                           ("23:30"  . tango)))
  (circadian-setup))
