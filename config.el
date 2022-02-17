(setq display-line-numbers-type t)
(setq fancy-splash-image "/Users/zhangruobin/.doom.d/static/mc.png")
(with-eval-after-load 'evil-maps
  (define-key evil-normal-state-map (kbd ",w") 'evil-write))

(exec-path-from-shell-copy-env "GOPROXY")
(exec-path-from-shell-copy-env "GOROOT")

(setq doom-theme 'doom-xcode)

;; Font
(setq doom-font (font-spec :family "Cascadia Code PL" :size 13))
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)


(when (window-system)
  (set-frame-font "Fira Code"))
(let ((alist '((33 . ".\\(?:\\(?:==\\|!!\\)\\|[!=]\\)")
               (35 . ".\\(?:###\\|##\\|_(\\|[#(?[_{]\\)")
               (36 . ".\\(?:>\\)")
               (37 . ".\\(?:\\(?:%%\\)\\|%\\)")
               (38 . ".\\(?:\\(?:&&\\)\\|&\\)")
               (42 . ".\\(?:\\(?:\\*\\*/\\)\\|\\(?:\\*[*/]\\)\\|[*/>]\\)")
               (43 . ".\\(?:\\(?:\\+\\+\\)\\|[+>]\\)")
               (45 . ".\\(?:\\(?:-[>-]\\|<<\\|>>\\)\\|[<>}~-]\\)")
               (46 . ".\\(?:\\(?:\\.[.<]\\)\\|[.=-]\\)")
               (47 . ".\\(?:\\(?:\\*\\*\\|//\\|==\\)\\|[*/=>]\\)")
               (48 . ".\\(?:x[a-zA-Z]\\)")
               (58 . ".\\(?:::\\|[:=]\\)")
               (59 . ".\\(?:;;\\|;\\)")
               (60 . ".\\(?:\\(?:!--\\)\\|\\(?:~~\\|->\\|\\$>\\|\\*>\\|\\+>\\|--\\|<[<=-]\\|=[<=>]\\||>\\)\\|[*$+~/<=>|-]\\)")
               (61 . ".\\(?:\\(?:/=\\|:=\\|<<\\|=[=>]\\|>>\\)\\|[<=>~]\\)")
               (62 . ".\\(?:\\(?:=>\\|>[=>-]\\)\\|[=>-]\\)")
               (63 . ".\\(?:\\(\\?\\?\\)\\|[:=?]\\)")
               (91 . ".\\(?:]\\)")
               (92 . ".\\(?:\\(?:\\\\\\\\\\)\\|\\\\\\)")
               (94 . ".\\(?:=\\)")
               (119 . ".\\(?:ww\\)")
               (123 . ".\\(?:-\\)")
               (124 . ".\\(?:\\(?:|[=|]\\)\\|[=>|]\\)")
               (126 . ".\\(?:~>\\|~~\\|[>=@~-]\\)")
               )
             ))
  (dolist (char-regexp alist)
    (set-char-table-range composition-function-table (car char-regexp)
                          `([,(cdr char-regexp) 0 font-shape-gstring]))))

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
(setq lsp-enable-symbol-highlighting t)
(setq lsp-ui-doc-enable t)
(setq lsp-ui-doc-enable t)
(setq lsp-lens-enable nil)



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



(defvar leetcode-l "golang")
(setq leetcode-save-solutions 't)
(setq leetcode-prefer-language leetcode-l)
(setq leetcode-directory (concat "~/leetcode/" leetcode-l))

(map! :leader
      :desc "leetcode"
      "l t" #'leetcode)
(map! :leader
      :desc "leetcode-test"
      "l T" #'leetcode-try)
(map! :leader
      :desc "leetcode-submit"
      "l s" #'leetcode-submit)

(setq org-hugo-base-dir "/Users/zhangruobin/ZRB-DATA/commerce/blogs")



(setq org-roam-directory "/Users/zhangruobin/home/personal/learn/notes")

(use-package! websocket
    :after org-roam)

(use-package! org-roam-ui
    :after org-roam ;; or :after org
;;         normally we'd recommend hooking orui after org-roam, but since org-roam does not have
;;         a hookable mode anymore, you're advised to pick something yourself
;;         if you don't care about startup time, use
;;  :hook (after-init . org-roam-ui-mode)
    :config
    (setq org-roam-ui-sync-theme t
          org-roam-ui-follow t
          org-roam-ui-update-on-save t
          org-roam-ui-open-on-start t))

;;(add-to-list 'load-path "~/.emacs.d/site-lisp/emacs-application-framework/")
;;(require 'eaf)
;;(require 'eaf-browser)
;;(require 'eaf-pdf-viewer)
;;(require 'eaf-terminal)

(require 'org-download)
(setq-default org-download-image-dir "/Users/zhangruobin/home/personal/learn/notes/assets/pics/")

(setq global-tree-sitter-mode t)
