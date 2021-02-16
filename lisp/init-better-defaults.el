(global-linum-mode t)

(recentf-mode 1)			
(setq recentf-max-menu-items 25)

(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

(delete-selection-mode t)

(setq c-basic-offset 4)
(setq c-default-style "linux")
(setq default-tab-width 4)
(setq kill-ring-max 200)

(provide 'init-better-defaults)
