(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
						   ("melpa" . "http://elpa.emacs-china.org/melpa/"))))

;; cl - Common Lisp Extension
(require 'cl)

;; Add Packages
(defvar my/packages '(
					  company
					  hungry-delete
					  swiper
					  counsel
					  smartparens
					  monokai-theme
					  rainbow-delimiters
					  company-ycmd
					  company-anaconda
					  solarized-theme
					  ) "Default packages")

(setq package-selected-packages my/packages)

(defun my/packages-installed-p ()
  (loop for pkg in my/packages
		when (not (package-installed-p pkg)) do (return nil)
		finally (return t)))

(defun check-my/packages()
  (interactive)
  (unless (my/packages-installed-p)
	(message "%s" "Refreshing package database...")
	(package-refresh-contents)
	(dolist (pkg my/packages)
	  (when (not (package-installed-p pkg))
		(package-install pkg)))))

;; hungry-delete
(global-hungry-delete-mode)

;; smartparens
(smartparens-global-mode t)

;; swiper&&counsel
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)

;; company
(global-company-mode t)

;; monokai
;;(load-theme 'monokai t)

;; solarized
(load-theme 'solarized-light t)

;; rainbow-delimiters
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; company-ycmd
(require 'company-ycmd)
(company-ycmd-setup)

;; company-anaconda
(add-hook 'python-mode-hook
		  (lambda ()
			(set (make-local-variable 'company-backends) '(company-anaconda))))

(provide 'init-packages)
