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
