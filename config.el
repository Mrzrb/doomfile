    (setq display-line-numbers-type t)

    (setq doom-theme 'doom-one-light)

    ;; Font
    (setq doom-font (font-spec :family "FiraMono Nerd Font" :size 12))

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

    (setq-default evil-escape-key-sequence "jj")
