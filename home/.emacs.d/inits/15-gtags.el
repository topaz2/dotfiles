(defun gtags-update ()
(start-process-shell-command "/bin/sh" nil "if global -pr; then global -u; fi"))

(add-hook 'after-save-hook #'gtags-update)
