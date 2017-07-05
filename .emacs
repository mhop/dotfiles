

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

;; ausgewÃ¤hlten Text bei Eingabe lÃ¶schen
(delete-selection-mode 1)

;; keine "yes-or-no"-Fragen - "y-or-n" reicht aus
(defalias 'yes-or-no-p 'y-or-n-p)

;; ZusammengehÃ¶rende Klammern hervorheben
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
(add-hook 'vhdl-mode-hook (function cscope-minor-mode))

(require 'ecb)
  (setq ido-enable-flex-matching t)
  (setq ido-everywhere t)
  (ido-mode 1)

(require 'cedet)
(global-ede-mode t)

; Make umlauts work
(set-language-environment 'german)
(set-terminal-coding-system 'iso-latin-1)

(setq c-default-style "stroustrup"
          c-basic-offset 4)

(setq-default c-basic-offset 2
                  tab-width 2
                  indent-tabs-mode t)

(defconst knf-c-style
  '((c-basic-offset . 2)
    (c-indent-level . 2)
    (c-continued-statement-offset . 2)
    (c-brace-offset . -2)
    (c-argdecl-indent . 2)
    (c-label-offset . -2)
    (c-offsets-alist . ((knr-argdecl-intro . +)
                        (knr-argdecl . 0)
                        (block-open . -)
                        (label . -)
                        (statement-cont . 2)
                        (arglist-cont . 2)
												(innamespace . 0)
												(statement-case-intro . 2)
                        (substatement-open . 0)
                        (case-label 2)
                        (inline-open 0)
                        (arglist-cont-nonempty 2))))
  "BSD KNF")

(c-add-style "knf" knf-c-style)
(setq c-default-style "knf")

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
 '(package-selected-packages
	 (quote
		(which-key use-package s flymake-cppcheck flycheck-elixir flycheck-cython eval-in-repl ecb cppcheck)))
 '(show-trailing-whitespace t))

(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

						(global-set-key "\M-l" '(lambda () (interactive) (insert "@")))
						(global-set-key "\M-5" '(lambda () (interactive) (insert "[")))
						(global-set-key "\M-6" '(lambda () (interactive) (insert "]")))
						(global-set-key "\M-7" '(lambda () (interactive) (insert "|")))
						(global-set-key "\M-/" '(lambda () (interactive) (insert "\\")))
						(global-set-key "\M-8" '(lambda () (interactive) (insert "{")))
						(global-set-key "\M-9" '(lambda () (interactive) (insert "}")))
						(global-set-key "\M-n" '(lambda () (interactive) (insert "~")))
;						))))
