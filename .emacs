;;; package --- Summary

;;; Commentary:

;;; Code:
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#2d3743" "#ff4242" "#74af68" "#dbdb95" "#34cae2" "#008b8b" "#00ede1" "#e1e1e0"])
 '(column-number-mode t)
 '(custom-enabled-themes (quote (wheatgrass)))
  '(show-paren-mode t)
 '(size-indication-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(menu-bar-mode -1)
(scroll-bar-mode -1)

(put 'upcase-region 'disabled nil)

(setq inhibit-startup-screen t)
(setq make-backup-files nil)
(global-auto-revert-mode t)
(defvar calendar-week-start-day 1)

;; printing
(setq ps-paper-type 'a4)
(defvar ps-print-header nil)

(require 'package)

(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(appt-activate 8)

(setq package-enable-at-startup nil)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package which-key
	     :ensure t
	     :config (which-key-mode))

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(use-package yasnippet
  :ensure t)

(use-package auto-complete
  :ensure t)

(use-package anzu
  :ensure t)

(use-package cdlatex
  :ensure t)
(add-hook 'LaTeX-mode-hook 'turn-on-cdlatex)
(defvar TeX-view-program-selection
      '((output-pdf "PDF Viewer")))
(defvar TeX-view-program-list
      '(("PDF Viewer" "mupdf %o")))


(use-package web-mode
  :ensure t)
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

(use-package noxml-fold
  :ensure t)
(add-hook 'nxml-mode-hook (lambda () (require 'noxml-fold)))

;; start auto-complete
(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)
;;start yasnippet
(require 'yasnippet)
(yas-global-mode 1)

(setq ac-disable-faces nil)


;; set minor modes
;; (global-linum-mode)
(column-number-mode)
(size-indication-mode)
(show-paren-mode)
(electric-pair-mode)

;; major and minor mode settings
(add-to-list 'auto-mode-alist '("\\.gv\\'" . graphviz-dot-mode))
(global-anzu-mode +1)
(add-hook 'nxml-mode-hook 'noxml-fold-mode)

(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "S-C-e") 'enlarge-window)
(global-set-key (kbd "S-C-s") 'shrink-window)

;;Load external script
;;(load "~/.emacs.d/lisp/c_cpp.el")

(server-start)

(desktop-read)
(put 'narrow-to-region 'disabled nil)


(set-face-background 'mode-line "green")
(set-face-foreground 'mode-line "black")
(set-face-background 'mode-line-inactive "grey")

(set-face-background 'minibuffer-prompt "blue")
(set-face-foreground 'minibuffer-prompt "white")

;;; .emacs ends here
(put 'dired-find-alternate-file 'disabled nil)
