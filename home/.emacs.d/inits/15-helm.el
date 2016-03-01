(require 'helm-config)

(define-key global-map (kbd "M-x") 'helm-M-x)
(define-key global-map (kbd "C-x b") 'helm-buffers-list)
(define-key global-map (kbd "C-x C-f") 'helm-find-files)
(define-key helm-map (kbd "C-h") 'delete-backward-char)
