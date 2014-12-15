;; Ruby
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
(autoload 'run-ruby "inf-ruby"
  "Run an inferior Ruby process")
(autoload 'inf-ruby-keys "inf-ruby"
  "Set local key defs for inf-ruby in ruby-mode")

;; ruby-mode-hook用の関数を定義
(defun ruby-mode-hooks ()
  (inf-ruby-keys)
  (ruby-end-mode t)
  (ruby-block-mode t))
;; ruby-mode-hookに追加
(add-hook 'ruby-mode-hook 'ruby-mode-hooks)
(add-hook 'ruby-mode-hook 'hs-minor-mode)

;; Ruby用Flymakeの設定
(add-hook 'ruby-mode-hook 'flymake-ruby-load)

;; フレームワーク専用拡張機能
(require 'helm-rails)
(define-key global-map (kbd "s-t") 'helm-rails-controllers)
(define-key global-map (kbd "s-y") 'helm-rails-models)
(define-key global-map (kbd "s-u") 'helm-rails-views)
(define-key global-map (kbd "s-o") 'helm-rails-specs)
(define-key global-map (kbd "s-r") 'helm-rails-all)
