(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   (vector "#c5c8c6" "#cc6666" "#b5bd68" "#f0c674" "#81a2be" "#b294bb" "#8abeb7" "#373b41"))
 '(custom-enabled-themes (quote (zweilight)))
 '(custom-safe-themes
   (quote
    ("5d3e0746023fc5e246eb3e0e48c1ccb5ce0387fc4273896c6cf02ee349c2eba8" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" default)))
 '(fci-rule-color "#373b41")
 '(package-selected-packages
   (quote
    (omnisharp csharp-mode company-racer company-try-hard company-quickhelp company-shell company-php company-go company-c-headers ix magit rhtml-mode cider smart-mode-line-powerline-theme smart-mode-line aggressive-indent counsel-projectile rainbow-delimiters racer evil-smartparens flycheck js2-mode web-mode php-mode company-web company which-key zweilight-theme color-theme-sanityinc-tomorrow counsel ivy evil)))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#cc6666")
     (40 . "#de935f")
     (60 . "#f0c674")
     (80 . "#b5bd68")
     (100 . "#8abeb7")
     (120 . "#81a2be")
     (140 . "#b294bb")
     (160 . "#cc6666")
     (180 . "#de935f")
     (200 . "#f0c674")
     (220 . "#b5bd68")
     (240 . "#8abeb7")
     (260 . "#81a2be")
     (280 . "#b294bb")
     (300 . "#cc6666")
     (320 . "#de935f")
     (340 . "#f0c674")
     (360 . "#b5bd68"))))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#1b1a24" :foreground "#8584ae" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 98 :width normal :foundry "simp" :family "Hack")))))

;; Custom
(evil-mode 1) ;; Enables EVIL
(menu-bar-mode -1) ;; Removes Menu Bar
(tool-bar-mode -1) ;; Removes Toolbar
(setq ring-bell-function `ignore) ;; Removes Bell Noise
(setq inhibit-startup-message t) ;; removes startup message
(setq initial-scratch-message nil) ;; removes scratch message
(global-linum-mode t) ;; enables line numbers
(setq linum-format "%2d \u2502 ") ;; Padding between numbers and text
(scroll-bar-mode -1) ;; Removes scroll bar
(require 'recentf) ;; Recent files
(recentf-mode 1)
(setq recentf-max-menu-items 10)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)
(global-set-key (kbd "C-x j") 'smartparens-mode) ;; Toggle Smartparens
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))
(setq scroll-step 1)
(which-key-mode)
(global-company-mode)
(dired-async-mode 1)
(async-bytecomp-package-mode 1)
(define-key global-map (kbd "RET") 'newline-and-indent)

;; Powerline Stuff
(setq sml/no-confirm-load-theme t)
(setq sml/theme 'powerline)
(sml/setup)

;; Ivy stuff
(setq ivy-use-virtual-buffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-c k") 'counsel-ag)
(global-set-key (kbd "C-x l") 'counsel-locate)
(define-key read-expression-map (kbd "C-r") 'counsel-expression-history)
(ivy-mode 1)

;; function to close all buffers
(defun close-all-buffers ()
(interactive)
  (mapc 'kill-buffer (buffer-list)))
(global-set-key (kbd "\C-c\ \c") 'close-all-buffers)

;; web mode stuff
(setq company-dabbrev-downcase 0)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html\\.twig\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
