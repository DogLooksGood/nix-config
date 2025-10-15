;; -*- lexical-binding: t; -*-

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

(set-frame-font "BigBlueTermPlus Nerd Font Mono:pixelsize=16" nil t)

(add-to-list 'load-path (expand-file-name "site-lisp" user-emacs-directory))

(require 'carbon-theme)
(load-theme 'carbon t)

(require 'init-straight)

(require 'project)

(global-completion-preview-mode 1)
(keymap-set global-map "M-g M-c" #'switch-to-completions)
(keymap-set global-map "M-n" #'completion-preview-complete)
(keymap-set completion-preview-active-mode-map "M-n" #'completion-preview-next-candidate)
(keymap-set completion-preview-active-mode-map "M-p" #'completion-preview-prev-candidate)
(require 'completion-preview-patch)

(which-function-mode 1)

(icomplete-mode 1)

(keymap-set icomplete-minibuffer-map "TAB" #'icomplete-force-complete)
(keymap-set icomplete-minibuffer-map "DEL" #'icomplete-fido-backward-updir)
(keymap-set icomplete-minibuffer-map "RET" #'icomplete-force-complete-and-exit)
(keymap-set icomplete-minibuffer-map "C-s" #'icomplete-forward-completions)
(keymap-set icomplete-minibuffer-map "C-r" #'icomplete-backward-completions)

(keymap-unset next-error-repeat-map "n")
(keymap-unset next-error-repeat-map "p")

(with-eval-after-load "dired"
  (keymap-unset dired-jump-map "j"))

(defvar-keymap duplicate-dwim-repeat-map :repeat t
	       "d" #'duplicate-dwim)

(require 'ansi-color)
(add-hook 'compilation-filter-hook 'ansi-color-compilation-filter)

(require 'bedit)
(keymap-set global-map "C-M-g" bedit-prefix-map)

(straight-use-package 'clojure-mode)
(straight-use-package 'nix-mode)
(straight-use-package 'geiser)
(straight-use-package 'geiser-guile)
(straight-use-package 'cider)
(straight-use-package 'gptel)
(straight-use-package 'paredit)
(straight-use-package 'yasnippet)
(straight-use-package 'envrc)

(require 'envrc)
(envrc-global-mode 1)

(require 'yasnippet)
(keymap-set global-map "C-c a" #'yas-expand)
(yas-load-directory (expand-file-name "snippets" user-emacs-directory))
(add-hook 'prog-mode-hook 'yas-minor-mode)
(add-hook 'conf-mode-hook 'yas-minor-mode)

(setq gptel-prompt-prefix-alist '((org-mode . "* "))
      gptel-use-curl t
      gptel-default-mode 'org-mode)

(gptel-make-ollama "Ollama"
  :host "localhost:11434"
  :stream t
  :models '(deepseek-r1:32b gemma3:27b-it-q8_0 devstral:24b magistral:24b gpt-oss:20b))

(require 'paredit)

(defun +use-paredit ()
  (paredit-mode 1)
  (keymap-unset paredit-mode-map "M-s")
  (keymap-set paredit-mode-map "M-i" #'paredit-splice-sexp))

(add-hook 'emacs-lisp-mode-hook #'+use-paredit)
(add-hook 'clojure-mode-hook #'+use-paredit)
(add-hook 'scheme-mode-hook #'+use-paredit)

(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-ts-mode))
(add-to-list 'auto-mode-alist '("\\.ya?ml\\'" . yaml-ts-mode))
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-ts-mode))
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . tsx-ts-mode))

(with-eval-after-load "cc-mode"
  (keymap-set c-mode-map "C-c C-c" #'ff-find-other-file))

(keymap-set global-map "C-c f" #'ffap)
(keymap-set prog-mode-map "C-c e" #'eglot)
(keymap-set global-map "C-c n" #'display-line-numbers-mode)
(keymap-set global-map "C-c d" #'duplicate-dwim)

(add-hook 'before-save-hook #'delete-trailing-whitespace)
