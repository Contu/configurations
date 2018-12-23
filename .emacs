;;; package --- Summary

;;; Commentary:

;;; Code:

(menu-bar-mode -1)
(scroll-bar-mode -1)

(put 'upcase-region 'disabled nil)

(setq inhibit-startup-screen t)
(setq make-backup-files nil)
(global-auto-revert-mode t)
(defvar calendar-week-start-day 1)

(set-cursor-color "#058E02")

;; printing
(setq ps-paper-type 'a4)
(defvar ps-print-header nil)

(require 'package)
(add-to-list 'package-archives
             '("MELPA" . "http://melpa.milkbox.net/packages/") t)
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

(use-package markdown-mode
  :ensure t
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

(use-package yasnippet
  :ensure t)

;; (use-package auto-complete
;;   :ensure t)

(use-package company
  :ensure t)
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)

(use-package company-c-headers
  :ensure t)
(add-to-list 'company-backends 'company-c-headers)

(use-package anzu
  :ensure t)

(use-package auctex
  :defer t
  :ensure t)
(require 'tex)

(use-package cdlatex
  :ensure t)
(add-hook 'LaTeX-mode-hook 'turn-on-cdlatex)
(add-hook 'LaTeX-mode-hook 'auto-fill-mode)
(add-hook 'LaTeX-mode-hook (lambda () (setq fill-column 80)))
(setq TeX-view-program-selection
      '((output-pdf "PDF Viewer")))
(setq TeX-view-program-list
      '(("PDF Viewer" "zathura %o")))

(use-package graphviz-dot-mode
  :ensure t)

(use-package web-mode
  :ensure t)
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

;; rust IDE
(use-package rust-mode
  :ensure t)
(use-package flymake-rust
  :ensure t)
(use-package racer
  :ensure t)
(use-package cargo
  :ensure t)

;; (add-hook 'rust-mode-hook)
;; (add-hook 'racer-mode-hook)
(add-hook 'rust-mode-hook 'cargo-minor-mode)

;; (use-package noxml-fold
;;   :ensure t)
;; (add-hook 'nxml-mode-hook (lambda () (require 'noxml-fold)))
;;(add-hook 'nxml-mode-hook 'noxml-fold-mode)

;; start auto-complete
;;(require 'auto-complete)
;;(require 'auto-complete-config)
;;(ac-config-default)
;;start yasnippet
(require 'yasnippet)
(yas-global-mode 1)

(setq ac-disable-faces nil)

(add-hook 'c-mode-hook
          (lambda () (setq flycheck-clang-include-path
                           (list (expand-file-name "/usr/include/libxml2/")))))


;; set minor modes
;; (global-linum-mode)
(column-number-mode)
(size-indication-mode)
(show-paren-mode)
(electric-pair-mode)

;; major and minor mode settings
(add-to-list 'auto-mode-alist '("\\.gv\\'" . graphviz-dot-mode))
(global-anzu-mode +1)

(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "S-C-e") 'enlarge-window)
(global-set-key (kbd "S-C-s") 'shrink-window)

;;Load external script
;;(load "~/.emacs.d/lisp/c_cpp.el")

(server-start)

(desktop-read)
(put 'narrow-to-region 'disabled nil)


(set-face-background 'mode-line "#FF6633")
(set-face-foreground 'mode-line "black")
(set-face-background 'mode-line-inactive "darkgrey")
(set-face-foreground 'mode-line-inactive "black")

(set-face-background 'minibuffer-prompt "blue")
(set-face-foreground 'minibuffer-prompt "white")

(set-face-attribute 'default nil :height 105)

;; Set transparency of emacs
(defun transparency (value)
  "Set the transparency VALUE of the frame window.  0=transparent/100=opaque."
  (interactive "nTransparency Value 0 - 100 opaque:")
  (set-frame-parameter (selected-frame) 'alpha value))

(transparency 93)

;; Set emacsclient background colour for terminal
(add-hook 'server-visit-hook '(lambda () (set-background-color "default")))

(put 'dired-find-alternate-file 'disabled nil)
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
 '(package-selected-packages
   (quote
    (noxml-fold web-mode graphviz-dot-mode yasnippet which-key use-package flycheck cdlatex anzu)))
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

 (setq abbrev-file-name "~/.emacs.d/my_abbrevs")

;;; .emacs ends here


