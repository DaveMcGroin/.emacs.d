;; småfina inställningar
(blink-cursor-mode -1)
(menu-bar-mode 1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(show-paren-mode 1)
;;(global-linum-mode 1)
(display-time)
(column-number-mode 1)
;;(helm-mode 1)
(setenv "LANG" "sv_SE.UTF-8")

;; Multiterm
(setq multi-term-program "/bin/zsh")

;; FUCK YOU YASNIPPET DU DÖDAR MIN APA
(add-hook 'term-mode-hook (lambda()
        (setq yas-dont-activate t)))

;; open to empty scratch
(setq initial-scratch-message "")
(setq inhibit-startup-message t)

;;color themes
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/emacs-color-theme-solarized-master/")
(load-theme 'solarized-dark t)

;; path to os fucker
(setq exec-path (append exec-path '("/usr/local/bin/")))


;; smex bindings
(autoload 'smex "smex")
(global-set-key (kbd "M-x") 'smex)
(setq smex-save-file "~/.emacs.d/plugin-data/smex/smex-items")

;; starting dir
(setq default-directory "~/")

;;Melpa package hittepå
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

;; Yasnippet
(add-to-list 'load-path "/Users/mcgroin/.emacs.d/elpa/yasnippet-20141117.327")
(require 'yasnippet)
(setq yas-snippet-dirs '("~/.emacs.d/elpa/yasnippet-20141117.327/snippets" "~/.emacs.d/snippets/"))

(yas-global-mode 1)

;;; ============================================================================
;;; Prevent emacs from putting backup files everywhere
;;; ============================================================================
(setq
 backup-by-copying t ; don't clobber symlinks
 backup-directory-alist
 '(("." . "~/.saves")) ; don't litter my fs tree
 delete-old-versions t
 kept-new-versions 6
 kept-old-versions 2
 version-control t) ; use versioned backups

;; Omnisharpmode
(defun fuck-csharp-mode ()
;  (add-to-list 'company-backends 'company-omnisharp)
  (omnisharp-mode)
  (company-mode)
  (flycheck-mode)
  (eldoc-mode)
  (linum-mode))

(add-hook 'csharp-mode-hook 'fuck-csharp-mode)
(setq flycheck-idle-change-delay 2)

;;; ============================================================================
;;; Enable quicklisp
;;; ============================================================================
(load (expand-file-name "~/quicklisp/slime-helper.el"))
(setq inferior-lisp-program "clisp")

;;; ============================================================================
;;; Use C-c h to do -ls-git, for finding files in a git project
;;; ============================================================================
(global-set-key (kbd "C-c h") 'helm-ls-git-ls)



;; lisp extra fontlock
;≈(lisp-extra-font-lock-global-mode 1)
;;(require 'exec-path-from-shell) ;; if not using the ELPA package
;;ser till att shell fungerar rätt
;;(exec-path-from-shell-initialize)


;;; ============================================================================
;;; Fix some character issues with M-x ansi-term
;;; ============================================================================
(defadvice ansi-term (after advise-ansi-term-coding-system)
  (set-buffer-process-coding-system 'utf-8-unix 'utf-8-unix))
(ad-activate 'ansi-term)
;; Use Emacs terminfo, not system terminfo
(setq system-uses-terminfo nil)


;;; ============================================================================
;;mac skit
;;; ============================================================================
(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)


;;; ============================================================================
;;; Scroll half window height with C-v / M-v (TACK MAX)
;;; ============================================================================
(defun window-half-height ()
  (max 1 (/ (1- (window-height (selected-window))) 2)))

(defun scroll-up-half ()
  (interactive)
  (scroll-up (window-half-height)))

(defun scroll-down-half ()         
  (interactive)                    
  (scroll-down (window-half-height)))

(global-set-key (kbd "C-v") 'scroll-up-half)
(global-set-key (kbd "M-v") 'scroll-down-half)

;;äckeltext för att få solarized att bli glad
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(omnisharp-server-executable-path
   (quote ~/Git/OmniSharpServer/OmniSharp/bin/Debug/OmniSharp\.exe))
 '(custom-safe-themes (quote ("1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" "fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )