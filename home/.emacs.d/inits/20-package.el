(defvar installing-package-list
  '(
    ac-c-headers
    ac-dabbrev
    ac-etags
    ac-helm
    android-mode
    auto-compile
    auto-complete
    ctags
;;    color-theme
    elscreen
    eydropper
    facemenu+
    flymake
    flymake-cursor
    flymake-easy
    flymake-jshint
    flymake-json
    flymake-php
    flymake-puppet
    flymake-ruby
    flymake-shell
    flymake-yaml
    fuzzy
    geben
    google-c-style
    google-maps
    google-translate
    helm
    helm-delicious
    helm-dired-recent-dirs
    helm-flymake
    helm-gtags
    helm-rails
    helm-rb
    helm-rubygems-local
;;    hl-line
    inf-php
    inf-ruby
    jshint
    js3-mode
    magit
    markdown-mode
    mew
    multi-web-mode
    org
    php-extras
    php-mode
;;    php-auto-yasnippet
    psvn
    pos-tip
    rinari
    robe
    rspec-mode
    ruby-block
    ruby-mode
    ruby-electric
    ruby-end
    typescript-mode
    tumble
    twitterling-mode
    vagrant
    w3m
    yasnippet
    yaml-mode
    ))
(when (not package-archive-contents)
  (package-refresh-contents))

(dolist (pkg installing-package-list)
  (when (and (not (package-installed-p pkg))
           (assoc pkg package-archive-contents))
    (package-install pkg)))
