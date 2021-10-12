;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Zhangruobin"
      user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one-light)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
;;

;; mirror setting
(setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
                           ("melpa" . "http://elpa.emacs-china.org/melpa/")))


;; Font
(setq doom-font (font-spec :family "FiraMono Nerd Font" :size 12))

;; Java config
;; (setenv "JAVA_HOME" "/Library/Java/JavaVirtualMachines/jdk-15.0.2.jdk/Contents/Home")
(setq lsp-java-vmargs '("-Xmx2G" "-Xms1G" "-XX:+UseG1GC" "-XX:+UseStringDeduplication" "-javaagent:/Users/zhangruobin/.emacs.d/.local/etc/lsp/eclipse.jdt.ls/lombok.jar"))
(setq lsp-java-configuration-runtimes '[(:name "JavaSE-1.8"
                                         :path "/Library/Java/JavaVirtualMachines/jdk1.8.0_291.jdk/Contents/Home")
                                        (:name "JavaSE-15"
                                         :path "/usr/local/Cellar/openjdk/15.0.1/"
                                         :default t)])


;; lsp ui mapper
(map! :leader
      :desc "Code Outline"
      "c O" #'lsp-ui-imenu)

(map! :leader
      :desc "Find Refrence"
      "c F" #'lsp-ui-peek-find-references)

(map! :leader
      :desc "Find Refrence"
      "c D" #'lsp-ui-peek-find-definitions)

(map! :leader
      :desc "Find Refrence"
      "c K" #'lsp-ui-doc-glance)

;;evil escape

(setq-default evil-escape-key-sequence "jj")

;; org download
(add-hook 'dired-mode-hook 'org-download-enable)
(setq-default org-download-image-dir "~/org/pics")
