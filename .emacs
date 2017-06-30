
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

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

(global-set-key (kbd "C-x C-b") 'buffer-menu)

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
 '(show-trailing-whitespace t)
)

(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
