(use-package easy-hugo
	:init
	(setq easy-hugo-basedir "/Users/samusz/web/test_Hugo_website/") ; Directory where hugo html source code is placed on your laptop
	(setq easy-hugo-image-directory "img") ; default image directory name
	;; (setq easy-hugo-url " url " ) ;; Url of the blog
	(setq easy-hugo-url "https://samusz.github.io")
	;; (setq easy-hugo-sshdomain "domainname") ;; Domain written in ~/.ssh/config
	;; (setq easy-hugo-root "/home/blog/");; Root directory of hugo at your server
	(setq easy-hugo-postdir "content/posts") ;; default easy-hugo-postdir will be "content/post". Easy-hugo will NOT start if easy-hugo-postdir doesn't exist.
	(setq easy-hugo-previewtime "300")
	(setq easy-hugo-server-flags "-D") ;; draft preview
	:bind
	(global-set-key (kbd "C-; h") 'easy-hugo)
	)


(use-package consel-ag); comlpletion


;; If you deploy your blog at Firebase.

;; M-x easy-hugo-firebase-deploy

;; To use easy-hugo-firebase-deploy, you make project at firebase hosting using your browser. Next run command.

;; npm install -g firebase-tools
;; cd [your-hugo-directory]
;; firebase login
;; firebase init
;; firebase deploy

;;Githup pages
;; M-x easy-hugo-github-deploy
;; Execute deploy.sh which exists in directory easy-hugo-basedir


;; M-x easy-hugo-put-image
;; M-x easy-hugo-put-figure

;; Move image to 'easy-hugo-image-directory' and generate image link. You can change the initial launch position with 'easy-hugo-default-picture-directory'.

;; M-x easy-hugo-pull-image
;; M-x easy-hugo-pull-figure

;; Pull image from internet to image directory and generate image link. Copy the URL of the image you want to download with your browser. Execute M-x easy-hugo-pull-image.

;; See ? describe mode
