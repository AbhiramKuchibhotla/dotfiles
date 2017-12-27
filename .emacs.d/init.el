;; Put this in /home/user/.emacs.d/init.el before starting Emacs for the first time
;;----------------------------------------------------------------------------------

;; -------------------------------------
;; Foundation of this config. Using use-package plugin instead of built-in manager for easier organization of packages and faster Emacs booting
(package-initialize)

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

;; Bootstrap use-package
(unless (package-installed-p 'use-package) 
  (package-refresh-contents) 
  (package-install 'use-package))
(setq use-package-always-ensure t)

;;(toggle-frame-maximized)	   ;; Maximize Emacs on startup
;; (set-frame-font "Hack 9" nil t)	   ;; Set font
(set-language-environment "UTF-8") ;; Set input
(menu-bar-mode -1)		   ;; Remove menu bar
(tool-bar-mode -1)		   ;; Remove toolbar
(scroll-bar-mode -1)		   ;; Remove scrollbar
(setq inhibit-startup-message t)   ;; Disable startup message
(setq ring-bell-function 'ignore) ;; Disable raping your ears with error ring tone
(setq initial-scratch-message nil) ;; Disable text in scratch
(setq tramp-default-method "ssh") ;; Default connection method for TRAMP - remote files plugin
(setq gc-cons-threshold (* 10 1024 1024)) ;; Reduce the frequency of garbage collection (default is 0.76MB, this sets it to 10MB)
(setq confirm-kill-emacs #'y-or-n-p)      ;; Confirm kill Emacs
(when (fboundp 'winner-mode)              ;; I don't remember
  (winner-mode 1))
(global-set-key (kbd "C-c t") 'term) ;; Emacs terminal emulator, real one
(global-set-key (kbd "C-c e") 'eshell) ;; Emacs shell shortcut
(global-prettify-symbols-mode +1) ;; Make symbols pretty e.g. lamba
(global-set-key (kbd "C-S-v") 'yank) ;; Make Pasting slightly better

;; Close everything without closing Emacs
(defun close-all-buffers () 
  (interactive) 
  (mapc 'kill-buffer (buffer-list)))
(global-set-key (kbd "\C-c\ \c") 'close-all-buffers)

;; Set Emacs window title to current file path
(setq frame-title-format '("" invocation-name ": " 
			   (:eval (if (buffer-file-name) 
				      (abbreviate-file-name (buffer-file-name)) "%b"))))
;; Change mini buffer startup message
(defun display-startup-echo-area-message () 
  (message "..."))

;; y/n for ye
(defalias 'yes-or-no-p 'y-or-n-p)

;; Page scroll
(defun gcm-scroll-down () 
  (interactive) 
  (scroll-up 4))
(defun gcm-scroll-up () 
  (interactive) 
  (scroll-down 4))
(global-set-key (kbd "M-p") 'gcm-scroll-up)
(global-set-key (kbd "M-n") 'gcm-scroll-down)

;; Quick Eshell per buffer
(defun eshell-here () 
  (interactive) 
  (let* ((parent (if (buffer-file-name) 
		     (file-name-directory (buffer-file-name)) default-directory)) 
	 (height (/ (window-total-height) 3)) 
	 (name   (car (last (split-string parent "/" t))))) 
    (split-window-vertically (- height)) 
    (other-window 1) 
    (eshell "new") 
    (rename-buffer (concat "*eshell: " name "*")) 
    (insert (concat "ls")) 
    (eshell-send-input)))
(global-set-key (kbd "C-!") 'eshell-here)
(defun eshell/x () ;; type x in eshell to exit
  (delete-window) 
  (eshell/exit))

;; Term paste
(eval-after-load "term" '(define-key term-raw-map (kbd "C-c C-y") 'term-paste))

;; Security
(setq tls-checktrust t)
(setq gnutls-verify-error t)

;;--------------------------------------------------------------------------------

(package-initialize)

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package) 
  (package-refresh-contents) 
  (package-install 'use-package))
(setq use-package-always-ensure t)

;; Theme
(use-package 
  doom-themes 
  :config ;; (setq solarized-high-contrast-mode-line t)
  (load-theme 'doom-one t))


;; Smooth Scrolling
(use-package 
  smooth-scrolling 
  :config (smooth-scrolling-mode 1) 
  (setq smooth-scroll-margin 5))

;; Try package without installing them
(use-package 
  try)

;; Emmet Mode
(use-package
  emmet-mode
  :mode (("\\.html\\'" . emmet-mode)
	 ("\\.css\\'" . emmet-mode))
  :bind ("C-x e" . emmet-mode))

(add-hook 'web-mode-hook 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.

;; Shows a nice and friendly panel with possible completions of your failed shortcut attemps
(use-package 
  which-key 
  :config (which-key-mode))

;; Search stuff
(use-package 
  swiper 
  :bind ("C-s" . swiper))

;; Makes sure Emacs commands use Ivy completion
(use-package 
  counsel 
  :bind ("M-x" . counsel-M-x) 
  ("C-x C-f" . counsel-find-file) 
  ("<f1> f" . counsel-describe-function) 
  ("<f1> v" . counsel-describe-variable) 
  ("<f1> l" . counsel-find-library) 
  ("<f2> i" . counsel-info-lookup-symbol) 
  ("<f2> u" . counsel-unicode-char) 
  ("C-c g" . counsel-git) 
  ("C-c j" . counsel-git-grep) 
  ("C-c k" . counsel-ag) 
  ("C-x l" . counsel-locate))

;; Completion mechanism for various things
(use-package 
  ivy 
  :config (setq ivy-use-virtual-buffers t) 
  :bind ("C-c C-r" . ivy-resume) 
  ("<f6>" . ivy-resume) 
  ("C-x b" . ivy-switch-buffer))

(use-package 
  avy 
  :bind ("M-s" . avy-goto-char))

(use-package 
  counsel-projectile)

(use-package
  fix-word)

;; Recent files
(use-package 
  recentf 
  :config (setq recentf-max-saved-items 100 recentf-max-menu-items 15 recentf-auto-cleanup 'never) 
  (recentf-mode 1) 
  :bind ("C-x C-r" . recentf-open-files))

;; Completion framework for text
(use-package 
  company 
  :defer t 
  :init (global-company-mode) 
  :config (progn (bind-key [remap completion-at-point] #'company-complete company-mode-map) 
		 (setq company-tooltip-align-annotations t company-show-numbers t) 
		 (setq company-dabbrev-downcase nil)) 
  :diminish company-mode)

(use-package 
  company-quickhelp 
  :defer t 
  :init (add-hook 'global-company-mode-hook #'company-quickhelp-mode))

(use-package 
  flycheck 
  :diminish flycheck-mode)

;; Project management plugin, uses version control like git to detect projects
(use-package 
  projectile 
  :commands (projectile-find-file projectile-switch-project) 
  :diminish projectile-mode 
  :config (projectile-global-mode))

;; Pastebinlike service text upload
(use-package 
  ix)

;; Automatic parenthesis, duh
(use-package 
  smartparens 
  :config (progn 
	    (require 'smartparens-config)) 
  :bind ("C-x j" . smartparens-mode))

;; Slick tree for undo
(use-package 
  undo-tree 
  :diminish undo-tree-mode 
  :config (global-undo-tree-mode t) 
  (setq undo-tree-visualizer-diff t))

;; Parenthesis change color depending on depth
(use-package 
  rainbow-delimiters 
  :defer t 
  :init (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))

;; Git on steroids
(use-package 
  magit 
  :bind ("C-x g" . magit-status))

(use-package 
  toml-mode)

(use-package 
  yaml-mode)

;; Rust
(use-package
  rust-mode 
  :defer t 
  :config ;;(add-hook 'rust-mode-hook #'flycheck-mode)
  (add-hook 'rust-mode-hook #'racer-mode)
  (add-hook 'racer-mode-hook #'eldoc-mode)
  (add-hook 'rust-mode-hook #'company-mode)
  (define-key rust-mode-map (kbd "M-.") #'racer-find-definition))

(use-package 
  cargo 
  :defer t 
  :config (add-hook 'rust-mode-hook 'cargo-minor-mode))

(use-package 
  racer)

;; Unix config files mode
(use-package 
  conf-mode)

(use-package 
  elisp-format)

;; Integrate Emacs with your user env variables / paths
(use-package 
  exec-path-from-shell 
  :config (when (memq window-system '(mac ns x)) 
	    (exec-path-from-shell-initialize)))

(use-package 
  async 
  :init (dired-async-mode +1) 
  :config (progn (async-bytecomp-package-mode 1)))

(use-package 
  markdown-mode 
  :commands (markdown-mode gfm-mode) 
  :mode (("README\\.md\\'" . gfm-mode) 
	 ("\\.md\\'" . markdown-mode) 
	 ("\\.markdown\\'" . markdown-mode)) 
  :init (setq markdown-command "multimarkdown"))

;; Emacs org mode, markdown on steroids
(use-package 
  org 
  :mode (("\\.org$" . org-mode)) 
  :config (progn
            ;; config stuff
            ))

(use-package 
  org-bullets 
  :config (progn (add-hook 'org-mode-hook (lambda () 
					    (org-bullets-mode 1)))))

;; Docker
(use-package 
  docker 
  :commands docker-mode)

(use-package 
  dockerfile-mode 
  :mode "Dockerfile.*\\'")

;; Web
(use-package 
  web-mode 
  :mode "\\.phtml\\'" 
  :mode "\\.volt\\'" 
  :mode "\\.html\\'")

;; Ansible
(use-package
  ansible)

;; Ansible Company
(use-package
  company-ansible)
;;---------------------
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(delete-selection-mode nil)
 '(package-selected-packages (quote (rust-mode company-ansible use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Puts temporary autosave files in one directory, so they do not clutter whole filesystem
(defvar user-temporary-file-directory "~/.emacs-autosaves/")
(make-directory user-temporary-file-directory t)
(setq backup-by-copying t)
(setq backup-directory-alist `(("." . ,user-temporary-file-directory) 
                   (tramp-file-name-regexp nil)))
(setq auto-save-list-file-prefix (concat user-temporary-file-directory ".auto-saves-"))
(setq auto-save-file-name-transforms `((".*" ,user-temporary-file-directory t)))
