(setq display-line-numbers-type t)
(setq fancy-splash-image "/Users/zhangruobin/.doom.d/static/mc.png")
(with-eval-after-load 'evil-maps
    (define-key evil-normal-state-map (kbd ",w") 'evil-write))

(setq doom-theme 'vscode-dark-plus)

;; Font
(setq doom-font (font-spec :family "Cascadia Code PL" :size 12))

(setq url-proxy-services '(("http" . "127.0.0.1:7890")
                           ("https" . "127.0.0.1:7890")))

;; mirror setting
(setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
                        ("melpa" . "http://elpa.emacs-china.org/melpa/")))

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

(map! :leader
      :desc "find in project"
      "/" #'consult-ripgrep)

(global-set-key (kbd "M-j") 'drag-stuff-down)
(global-set-key (kbd "M-k") 'drag-stuff-up)
(global-set-key (kbd "M-f") 'avy-goto-word-or-subword-1)

(setq lsp-file-watch-threshold 3000)

;;Add this for bug of org mode
(defun native-comp-available-p () nil)
(setq org-directory "~/org/")

;; Java config
;; (setenv "JAVA_HOME" "/Library/Java/JavaVirtualMachines/jdk-15.0.2.jdk/Contents/Home")
(setq lsp-java-vmargs '("-Xmx2G" "-Xms1G" "-XX:+UseG1GC" "-XX:+UseStringDeduplication" "-javaagent:/Users/zhangruobin/.emacs.d/.local/etc/lsp/eclipse.jdt.ls/lombok.jar"))
(setq lsp-java-configuration-runtimes '[(:name "JavaSE-1.8"
                                        :path "/Library/Java/JavaVirtualMachines/jdk1.8.0_291.jdk/Contents/Home")
                                        (:name "JavaSE-15"
                                        :path "/usr/local/Cellar/openjdk/15.0.1/"
                                        :default t)])

(setq dap-auto-configure-features '(sessions locals controls tooltip))

(setq-default evil-escape-key-sequence "jj")
