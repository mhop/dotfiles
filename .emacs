;;; mh.emacs --- Summary 


(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives '(("gnu"       . "https://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa"     . "https://melpa.org/packages/")
                         ("org"       . "http://orgmode.org/elpa/")))
(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(setq make-backup-files nil) ;; stop creating those backup~ files
(setq auto-save-default nil) ;; stop creating those #autosave# files

;; keine "yes-or-no"-Fragen - "y-or-n" reicht aus
(defalias 'yes-or-no-p 'y-or-n-p)

;; Zusammengehoerende Klammern hervorheben
(show-paren-mode 1)
;; Text zwischen den Klammern nicht hervorheben
(setq show-paren-style 'parenthesis)


(use-package which-key
  :ensure t
  :config
  (which-key-mode))

; Buffer Menu
(global-set-key (kbd "C-x C-b") 'buffer-menu)

(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode t))

(require 'xcscope)
  (setq ido-enable-flex-matching t)
  (setq ido-everywhere t)
  (ido-mode 1)
(cscope-setup)
;(setq cscope-command-args -R )
;(add-hook 'vhdl-mode-hook (function cscope-minor-mode))

(require 'ecb)
  (setq ido-enable-flex-matching t)
  (setq ido-everywhere t)
(ido-mode 1)

(require 'cedet)
(global-ede-mode t)

; Make umlauts work
(set-language-environment 'german)
(set-terminal-coding-system 'utf-8-emacs)

(setq c-default-style "linux"
          c-basic-offset 4)

(org-babel-do-load-languages
      'org-babel-load-languages
      '((emacs-lisp . t)
        (R . t) (perl . t) (C . t)  ))

;; Frame title bar formatting to show full path of file
(setq-default
 frame-title-format
 (list '((buffer-file-name " %f" (dired-directory
                                  dired-directory
                                  (revert-buffer-function " %b"
                                  ("%b - Dir:  " default-directory)))))))

(setq-default
 icon-title-format
 (list '((buffer-file-name " %f" (dired-directory
                                  dired-directory
                                  (revert-buffer-function " %b"
                                  ("%b - Dir:  " default-directory)))))))



(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

;; --------- Smart-tabs -------------

(setq-default c-basic-offset 4
              tab-width 4
              indent-tabs-mode nil)

(smart-tabs-add-language-support c++ c++-mode-hook
  ((c-indent-line . c-basic-offset)
   (c-indent-region . c-basic-offset)))
(smart-tabs-advice vhdl-indent-line vhdl-basic-offset)

(smart-tabs-insinuate 'c 'c++ 'javascript)


;; ------ Flycheck ------------------

(add-hook 'after-init-hook #'global-flycheck-mode)

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(flycheck-define-checker vhdl-nvc
 "A VHDL syntax checker using nvc."
 :command ("nvc" "--message=compact" "-a" source)
 :error-patterns ((error line-start (file-name) ":" line ":" column ": error: " (message) line-end))
 :modes vhdl-mode)

;; ---------------------------------------------------

'(package-selected-packages
	 (quote
		(which-key use-package s flymake-cppcheck flycheck-elixir flycheck-cython eval-in-repl ecb cppcheck)))
'(show-trailing-whitespace t)

(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

;; ----------------------------------

(add-hook 'term-exec-hook
          (function
           (lambda ()
             (set-buffer-process-coding-system 'utf-8-unix 'utf-8-unix))))

(prefer-coding-system 'utf-8)
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(show-trailing-whitespace t)
 '(vhdl-indent-tabs-mode nil))

