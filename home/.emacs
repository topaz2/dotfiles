;; Basic settings
(menu-bar-mode 0)
(setq inhibit-startup-message t
      gc-cons-threshold 8000000
      user-mail-address "topaz2.3333@gmail.com"
      debug-on-error nil
      large-file-warning-threshold nil
      split-width-threshold nil
      mouse-drag-copy-region t
      frame-title-format (format "%%f - Emacs@%s" (system-name)))
(fset 'yes-or-no-p 'y-or-n-p)
(server-start)

;; Set charset
(set-language-environment "Japanese")
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq buffer-file-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; Set lib path
(let ((default-directory (expand-file-name "~/.emacs.d/site-lisp")))
  (add-to-list 'load-path default-directory)
  (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
      (normal-top-level-add-subdirs-to-load-path)))

(require 'init-loader)
(setq init-loader-show-log-after-init nil)
(init-loader-load "~/.emacs.d/inits")

;; Store all back file in ~/.saves
(setq backup-directory-alist `(("." . "~/.saves"))
      backup-by-copying t
      delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)

;; Init abbrev
(setq abbrev-file-name "~/.emacs.d/.abbrev_defs"
      save-abbrevs nil)
(quietly-read-abbrev-file)

;; Custom key bindings
(global-set-key "\C-h" 'backward-delete-char)
(global-set-key "\C-w" 'backward-kill-word)
;; (global-set-key "\M-w" 'kill-region)
(global-set-key "\M-?" 'help)
(global-set-key "\C-cc" 'comment-region)
(global-set-key "\C-cu" 'uncomment-region)
(global-set-key "\M-g" 'goto-line)

;; Byte compile if new *.el found or modified
(if (file-newer-than-file-p "~/.emacs" "~/.emacs.elc" )
    (save-excursion
      (byte-compile-file "~/.emacs")))

(add-hook 'after-save-hook
    (function (lambda ()
          (if (eq major-mode 'emacs-lisp-mode)
        (save-excursion
          (byte-compile-file buffer-file-name))))))

;; Underline current line
(global-hl-line-mode)
(setq hl-line-face 'underline)

;; Highlight special characters
(defface my-face-r-1 '((t (:background nil))) "r-1" :group 'font-lock-highlighting-faces)
(defface my-face-b-1 '((t (:background "gray"))) "b-1" :group 'font-lock-highlighting-faces)
(defface my-face-b-2 '((t (:background "gray26"))) "b-2" :group 'font-lock-highlighting-faces)
(defface my-face-u-1 '((t (:foreground "hotpink" :underline t))) "u-1" :group 'font-lock-highlighting-faces)
(defface my-face-u-2 '((t (:foreground "DarkSlateBlue" :underline t))) "u-2" :group 'font-lock-highlighting-faces)
(defvar my-face-r-1 'my-face-r-1)
(defvar my-face-b-1 'my-face-b-1)
(defvar my-face-b-2 'my-face-b-2)
(defvar my-face-u-1 'my-face-u-1)
(defvar my-face-u-2 'my-face-u-2)

(defadvice font-lock-mode (before my-font-lock-mode ())
  (font-lock-add-keywords
   major-mode
   '(("\t" 0 my-face-b-2 append)
     ("　" 0 my-face-b-1 append)
     ("[\t]+$" 0 my-face-u-1 append)
     ("[\s]+$" 0 my-face-u-2 append)
     ("[\r]*\n" 0 my-face-r-1 append)
     )))
(ad-enable-advice 'font-lock-mode 'before 'my-font-lock-mode)
(ad-activate 'font-lock-mode)
(global-font-lock-mode t)

;; Highlight parenthesis
(require 'paren)
(setq show-paren-style 'parenthesis)
(show-paren-mode +1)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(helm-selection ((t (:underline t))))
 '(show-paren-match ((t (:background "DodgerBlue4")))))

;; Set mode
(setq auto-mode-alist
      (append
       '(
         ("\\.h$". c++-mode)
         ("\\.hpp$". c++-mode)
         ("\\.txt$". text-mode)
         ("\\.message$" . text-mode)
         ) auto-mode-alist))

(setq-default tab-width 2
              c-basic-offset 2
              indent-tabs-mode nil)

(add-hook 'emacs-lisp-mode
    '(lambda ()
       (setq tab-width 2
             c-basic-offset 2
             indent-tabs-mode nil)
       ))

(eval-when-compile
  (require 'flyspell)
  (require 'ispell))
(if (file-executable-p "/usr/bin/aspell")
    (setq-default ispell-program-name "aspell")
  (setq-default ispell-program-name "ispell"))

;; pbf-mode
;(require 'pbf-mode)
;(pbf-setup)
;(pbf-mode t)

;; (defun recenter-and-fontify-buffer ()
;;   "comment..."
;;   (interactive)
;;   (recenter)
;;   (font-lock-fontify-buffer))
;; (define-key esc-map "\C-l" 'recenter-and-fontify-buffer)

;; ;; develock
;; ;; http://www.jpl.org/elips/
;; (require 'develock nil t)
;; (if (featurep 'develock)
;;     (progn
;;       (setq develock-max-column-plist
;;             (list 'java-mode  300
;;                   'jde-mode   300
;;                   'emacs-lisp-mode 300
;;                   'lisp-interaction-mode 300
;;                   'html-mode  nil
;;                   'html-helper-mode nil
;;                   'cperl-mode 300
;;                   'perl-mode  300))
;;       (let ((elem (copy-sequence (assq 'message-mode develock-keywords-alist))))
;;         (setcar elem 'html-helper-mode)
;;         (setq develock-keywords-alist
;;               (cons elem (delq (assq 'html-helper-mode develock-keywords-alist)
;;                                develock-keywords-alist))))
;;       ))

(require 'android-mode)
(require 'gud)

(defun android-mode-settings()
  (setq android-mode-sdk-dir "~/usr/local/bin/android-sdk-linux")
  )

(add-hook 'android-mode-hook 'android-mode-settings)
(add-hook 'gud-mode-hook
          (lambda ()
            (add-to-list 'gud-jdb-classpath "~/usr/local/bin/android-sdk-linux/platforms/android-17/android.jar")
            ))

(defun touch ()
     "updates mtime on the file for the current buffer"
     (interactive)
     (shell-command (concat "touch " (shell-quote-argument (buffer-file-name))))
     (clear-visited-file-modtime))
(global-set-key (kbd "C-c C-t") 'touch)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (typescript-mode yasnippet yaml-mode w3m vagrant twittering-mode tumble ruby-end ruby-electric ruby-block rspec-mode rsense rinari puppet-mode psvn pos-tip php-extras multi-web-mode mew markdown-mode magit js3-mode inf-php highlight-parentheses helm-rubygems-local helm-rb helm-rails helm-gtags helm-flymake helm-dired-recent-dirs helm-delicious google-translate google-maps google-c-style git-rebase-mode git-commit-mode geben fuzzy flymake-yaml flymake-shell flymake-ruby flymake-puppet flymake-php flymake-json flymake-jshint flymake-cursor flymake facemenu+ elscreen elmine ctags color-theme-solarized auto-compile android-mode ac-js2 ac-ja ac-ispell ac-helm ac-etags ac-dabbrev ac-c-headers))))
