
;; ------------------------------ package stuff --------------------

(require 'cl)
(require 'package)

(unless (assoc-default "melpa" package-archives)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t))
(unless (assoc-default "org" package-archives)
  (add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t))
(unless (assoc-default "gnu" package-archives)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/") t))
(unless (assoc-default "marmalade" package-archives)
  (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t))

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

;;use package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)

;;-------------------------------------- load the settings.org file --------

;;; Load the config
(org-babel-load-file (concat user-emacs-directory "settings.org"))

