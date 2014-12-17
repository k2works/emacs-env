;; Ruby
;; ファイル関連付け
(autoload 'ruby-mode "ruby-mode"
"Mode for editing ruby source files" t)
(add-to-list 'auto-mode-alist '("\\.rb$latex " . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))

;; ruby-modeのインデント設定
(setq ruby-indent-level 3 ; インデント幅を3に。初期値は2
      ruby-deep-indent-paren-style nil ; 改行時のインデントを調整する
      ;; ruby-mode実行時にindent-tabs-modeを設定値に変更
      ruby-indent-tabs-mode t) ; タブ文字を使用する。初期値はnil
;; 括弧の自動挿入
(require 'ruby-end)
(add-hook 'ruby-mode-hook
          '(lambda ()
             (abbrev-mode 1)
             (electric-pair-mode t)
             (electric-indent-mode t)
             (electric-layout-mode t)))
;; インタラクティブRubyを利用する
(require 'inf-ruby)
(add-hook 'ruby-mode-hook 'inf-ruby-minor-mode)
(setq inf-ruby-default-implementation "pry")
(setq inf-ruby-eval-binding "Pry.toplevel_binding")
(add-hook 'inf-ruby-mode-hook 'ansi-color-for-comint-mode-on)
(add-hook 'after-init-hook 'inf-ruby-switch-setup)

;; ruby-mode-hook用の関数を定義
(defun ruby-mode-hooks ()
  (inf-ruby-keys)
  (ruby-end-mode t)
  (ruby-block-mode t))
;; ruby-mode-hookに追加
(add-hook 'ruby-mode-hook 'hs-minor-mode)

;; ruby-block.el --- highlight matching block
(require 'ruby-block)
(ruby-block-mode t)
(setq ruby-block-highlight-toggle t)

;; rcodetools
(require 'rcodetools)
(setq rct-find-tag-if-available nil)
(defun make-ruby-scratch-buffer ()
(with-current-buffer (get-buffer-create "*ruby scratch*")
(ruby-mode)
(current-buffer)))
(defun ruby-scratch ()
(interactive)
(pop-to-buffer (make-ruby-scratch-buffer)))
(defun ruby-mode-hook-rcodetools ()
(define-key ruby-mode-map "\M-\C-i" 'rct-complete-symbol)
(define-key ruby-mode-map "\C-c\C-t" 'ruby-toggle-buffer)
(define-key ruby-mode-map "\C-c\C-d" 'xmp)
(define-key ruby-mode-map "\C-c\C-f" 'rct-ri))
(add-hook 'ruby-mode-hook 'ruby-mode-hook-rcodetools)
;; rdefs
(require 'anything)
(require 'anything-rdefs)
(add-hook 'enh-ruby-mode-hook
  (lambda ()
  (define-key enh-ruby-mode (kbd "C-@") 'anything-rdefs)))
;; リファクタリング
(require 'anzu)
(global-anzu-mode +1)

(set-face-attribute 'anzu-mode-line nil
  :foreground "yellow" :weight 'bold)
  (custom-set-variables
    '(anzu-mode-lighter "")
    '(anzu-deactivate-region t)
    '(anzu-search-threshold 1000)
    '(anzu-use-mimego t)
    '(anzu-replace-to-string-separator " => "))

(require 'ruby-refactor)
  (add-hook 'ruby-mode-hook 'ruby-refactor-mode-launch)
;; コーディング支援
;; smart-compile
(require 'smart-compile)
(define-key ruby-mode-map (kbd "C-c c") 'smart-compile)
(define-key ruby-mode-map (kbd "C-c C-c") (kbd "C-c c C-m"))
(setq compilation-window-height 15) ;; default window height is 15
;; robe
(require 'robe)
(add-hook 'ruby-mode-hook 'robe-mode)
(require 'helm-robe)
(custom-set-variables '(robe-completing-read-func 'helm-robe-completing-read))

(autoload 'robe-mode "robe" "Code navigation, documentation lookup and completion for Ruby" t nil)
(autoload 'robe-ac-setup "robe-ac" "robe auto-complete" nil nil)
(add-hook 'robe-mode-hook 'robe-ac-setup)

(custom-set-variables
  '(robe-completing-read-func 'helm-robe-completing-read))

;; Ruby用Flymakeの設定
(add-hook 'ruby-mode-hook 'flymake-ruby-load)
;; Ruby用Flycheckの設定
(require 'flycheck)
(setq flycheck-check-syntax-automatically '(mode-enabled save))
(add-hook 'ruby-mode-hook 'flycheck-mode)
;; rubcop
(require 'rubocop)
(add-hook 'ruby-mode-hook 'rubocop-mode)
(flycheck-define-checker ruby-rubocop
  "A Ruby syntax and style checker using the RuboCop tool."
  :command ("rubocop" "--format" "emacs" "--silent"
  (config-file "--config" flycheck-rubocoprc)
  source)
  :error-patterns
  ((warning line-start
    (file-name) ":" line ":" column ": " (or "C" "W") ": " (message)
    line-end)
    (error line-start
      (file-name) ":" line ":" column ": " (or "E" "F") ": " (message)
      line-end))
      :modes (enh-ruby-mode motion-mode))
;; definition for flycheck
(flycheck-define-checker ruby-rubylint
  "A Ruby syntax and style checker using the rubylint tool."
  :command ("ruby-lint" source)
  :error-patterns
  ((warning line-start
    (file-name) ":" line ":" column ": " (or "C" "W") ": " (message)
    line-end)
    (error line-start
    (file-name) ":" line ":" column ": " (or "E" "F") ": " (message)
    line-end))
    :modes (enh-ruby-mode ruby-mode))

;; フレームワーク専用拡張機能
(require 'helm-rails)
(define-key global-map (kbd "s-t") 'helm-rails-controllers)
(define-key global-map (kbd "s-y") 'helm-rails-models)
(define-key global-map (kbd "s-u") 'helm-rails-views)
(define-key global-map (kbd "s-o") 'helm-rails-specs)
(define-key global-map (kbd "s-r") 'helm-rails-all)
