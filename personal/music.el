(use-package emms)
;; (emms-all);; generates an invalid function error
(emms-default-players)
  
(setq emms-source-file-default-directory "~/Music/")




(defun spotify/init-spotify ()
  (use-package spotify
    :defer t
    :init (progn
            (declare-prefix "am" "music")
            (declare-prefix "ams" "Spotify")
            (set-leader-keys
              "amsp" 'spotify-playpause
              "amsn" 'spotify-next
              "amsN" 'spotify-previous
              "amsQ" 'spotify-quit))))

(defun spotify/init-helm-spotify-plus ()
  (use-package helm-spotify-plus
    :defer t
    :init (spacemacs/set-leader-keys "amsg" 'helm-spotify-plus)))

(defun spotify/init-counsel-spotify ()
  (use-package counsel-spotify
    :defer t
    :commands (counsel-spotify-search-artist
               counsel-spotify-search-album
               counsel-spotify-search-track
               counsel-spotify-search-tracks-by-artist
               counsel-spotify-search-tracks-by-album)
    :init (progn
            (spacemacs/declare-prefix "amss" "search")
            (spacemacs/declare-prefix "amssT" "tracks")
            (spacemacs/set-leader-keys
              "amssa" 'counsel-spotify-search-artist
              "amssA" 'counsel-spotify-search-album
              "amsst" 'counsel-spotify-search-track
              "amssTa" 'counsel-spotify-search-tracks-by-artist
              "amssTA" 'counsel-spotify-search-tracks-by-album))))
