;;; -*- lexical-binding: t -*-
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(c-basic-offset 4)
 '(completion-styles '(basic partial-completion flex))
 '(custom-safe-themes
   '("d453a6c05d97483ff577476a53188fa190e2a06e14ecb98d2d44034f5d825205"
     default))
 '(dired-dwim-target 'dired-dwim-target-recent)
 '(dired-listing-switches "-alh")
 '(dired-use-ls-dired t)
 '(display-buffer-alist
   '(("\\\\*Compilation\\\\*"
      (display-buffer-reuse-window display-buffer-at-bottom)
      (window-height . 0.35))
     ("\\\\*Help\\\\*" display-buffer-at-bottom (window-height . 0.35))
     ("\\\\*Completions\\\\*" display-buffer-in-side-window
      (window-height . 0.25) (slot . 0))
     ("\\\\*eldoc\\\\*" display-buffer-in-side-window
      (window-height . 0.25) (slot . 1))
     ("\\\\*xref\\\\*" display-buffer-in-side-window
      (window-width . 0.4) (slot . 0) (side . right))))
 '(eglot-ignored-server-capabilities
   '(:referencesProvider :documentHighlightProvider
                         :documentSymbolProvider
                         :workspaceSymbolProvider :codeActionProvider
                         :codeLensProvider
                         :documentOnTypeFormattingProvider
                         :colorProvider :foldingRangeProvider
                         :executeCommandProvider :inlayHintProvider
                         :typeHierarchyProvider :callHierarchyProvider))
 '(envrc-global-mode t)
 '(envrc-show-summary-in-minibuffer nil)
 '(font-use-system-font t)
 '(gdb-many-windows t)
 '(icomplete-hide-common-prefix nil)
 '(icomplete-mode t)
 '(imenu-flatten 'annotation)
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(isearch-lazy-count t)
 '(make-backup-files nil)
 '(menu-bar-mode nil)
 '(mode-line-collapse-minor-modes t)
 '(mode-line-compact t)
 '(package-selected-packages '(company envrc yasnippet))
 '(project-mode-line t)
 '(repeat-mode t)
 '(savehist-mode t)
 '(scroll-bar-mode nil)
 '(show-paren-style 'mixed)
 '(straight-check-for-modifications '(find-when-checking only-once))
 '(tool-bar-mode nil)
 '(typescript-ts-mode-indent-offset 4)
 '(use-short-answers t)
 '(which-function-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
