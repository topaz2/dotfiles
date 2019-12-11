(require 'typescript-mode)

(defun typescript-mode-settings ()
  (setq typescript-indent-level 2
        indent-tabs-mode nil)
  )

(add-hook 'typescript-mode-hook 'typescript-mode-settings)

(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))
(add-to-list 'auto-mode-alist '("\\.vue\\'" . typescript-mode))
