;; småfina inställningar
(blink-cursor-mode -1)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(show-paren-mode 1)
(display-time)
(column-number-mode 1)
(display-battery-mode t)
(setenv "LANG" "sv_SE.UTF-8")

;; Multiterm
(setq multi-term-program "/bin/zsh")

;; open to empty scratch
(setq initial-scratch-message "")
(setq inhibit-startup-message t)

;;color themes
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/emacs-color-theme-solarized-master/")
(load-theme 'solarized-dark t)

;;; Don't prompt so much
(fset 'yes-or-no-p 'y-or-n-p)
(setq confirm-nonexistent-file-or-buffer nil)

;; Don't ask to kill buffers with active processes
(setq kill-buffer-query-functions
  (remq 'process-kill-buffer-query-function
         kill-buffer-query-functions))

;; smex bindings
(autoload 'smex "smex")
(global-set-key (kbd "M-x") 'smex)
(setq smex-save-file "~/.emacs.d/plugin-data/smex/smex-items")

;;; Dired subtree viewing with 'i'
(require 'dired)
(define-key dired-mode-map (kbd "i") 'dired-subtree-toggle)

;;; Toggle show hidden files with C-c h
(require 'dired-x)
(setq dired-omit-files "^\\...+$")
(add-hook 'dired-mode-hook (lambda () (dired-omit-mode 1)))
(define-key dired-mode-map (kbd "C-c h") 'dired-omit-mode)

;; starting dir
(setq default-directory "~/")

;;Melpa package hittepå
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

;;; Put backup files in tmp directory
(setq backup-directory-alist `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))
(setq auto-save-list-file-prefix temporary-file-directory)

;;; ============================================================================
;;; Enable quicklisp
;;; ============================================================================
(load (expand-file-name "~/quicklisp/slime-helper.el"))
(setq inferior-lisp-program "clisp")


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


;;; Treat all themes as safe
(custom-set-variables
 '(custom-safe-themes t))

