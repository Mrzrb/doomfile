;;; private/org-slide/config.el -*- lexical-binding: t; -*-

(use-package! org-tree-slide
  :custom
  (define-key org-mode-map (kbd "<f8>") 'org-tree-slide-mode)
  (define-key org-mode-map (kbd "S-<f8>") 'org-tree-slide-skip-done-toggle)
  )
