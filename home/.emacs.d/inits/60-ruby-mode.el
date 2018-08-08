(require 'ruby-mode)
(require 'rinari)
(global-rinari-mode)

(mapc
 (lambda (file)
   (add-to-list 'auto-mode-alist
                (cons (concat (regexp-quote file) "\\'") 'ruby-mode)))
 '(".erb" "Berksfile" "Capfile" "Gemfile" "Guardfile" "Rakefile"
   "Vagrantfile"))

(defun ruby-mode-settings ()
  (setq tab-width 2
        ruby-indent-level tab-width
        ruby-deep-indent-paren-style nil)
  (define-key ruby-mode-map [return] 'ruby-reindent-then-newline-and-indent)

  ;; Enable flyspell for comments in source code
  (flyspell-prog-mode)

  (require 'ruby-block)
  (ruby-block-mode t)
  (setq ruby-block-highlight-toggle t)
  (setq ruby-insert-encoding-magic-comment nil)
  (require 'ruby-end)
)

(add-hook 'ruby-mode-hook 'ruby-mode-settings)
(add-hook 'ruby-mode-hook 'helm-gtags-mode)
(add-hook 'ruby-mode-hook 'flymake-ruby-load)
(add-hook 'ruby-mode-hook 'robe-mode)
(autoload 'robe-mode "robe" "Code navigation, documentation lookup and completion for Ruby" t nil)
(add-hook 'robe-mode-hook 'ac-robe-setup)

(require 'rcodetools)
(define-key ruby-mode-map (kbd "C-c C-d") 'xmp)

;; rsense
;; (setq rsense-home "/usr/local/src/rsense/0.3/libexec")
;; (require 'rsense)
;; (add-hook 'ruby-mode-hook
;;           '(lambda ()
;;              (add-to-list 'ac-sources 'ac-source-rsense-method)
;;              (add-to-list 'ac-sources 'ac-source-rsense-constant)
;;              (define-key ruby-mode-map (kbd "C-x .") 'ac-complete-rsense)))

;; ;; add frozen_string_literal
;; (defun ruby-mode-set-frozen-string-literal-true ()
;;   (when (eq major-mode 'ruby-mode)
;;     (save-excursion
;;       (widen)
;;       (goto-char (point-min))
;;       (unless (looking-at "^# frozen_string_literal: true")
;;         (insert "# frozen_string_literal: true\n\n")))))

;; (add-hook 'ruby-mode-hook (lambda()
;;                             (add-hook 'before-save-hook 'ruby-mode-set-frozen-string-literal-true)))
