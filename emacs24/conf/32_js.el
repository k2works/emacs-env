;; JavaScript
;; ファイルの関連付け
(add-to-list 'auto-mode-alist '("\\.json$" . js-mode))
;; js2-modeに関連付け
(add-hook 'js-mode-hook 'js2-minor-mode)
(add-hook 'js2-mode-hook 'ac-js2-mode)
;; シンタックスハイライトレベル調整
(setq js2-highlight-level 3)
;; js-modeの基本設定
(defun js-indent-hook()
  ;; インデント幅を4にする
  (setq js-indent-level 2
        js-expr-indent-offset 2
        indent-tabs-mode nil)
  ;; switch文のcaseラベルをインデントする関数を定義する
  (defun my-js-indent-line ()
    (interactive)
    (let* ((parse-status (save-excursion (syntax-ppss (point-at-bol))))
           (offset (- (current-column) (current-indentation)))
           (indentation (js--proper-indentation parse-status)))
      (back-to-indentation)
      (if (looking-at "case\\s-")
          (indent-line-to (+ indentation 2))
        (js-indent-line))
      (when (> offset 0) (forward-char offset))))
  ;; caseラベルのインデント処理をセットする
  (set (make-local-variable 'indent-line-function) 'my-js-indent-line)
  ;; ここまでcaseラベルを調整する予定
  )
;; Hook
(add-hook 'js-mode-hook 'hs-minor-mode)
(add-hook 'js-mode-hook 'js-indent-hook)
(add-hook 'js-mode-hook 'flymake-jslint-load)

;; JSHint with Flycheck
(require 'flycheck)
(add-hook 'js-mode-hook
          (lambda () (flycheck-mode t)))

;; JSHint with Flymake
(add-to-list 'load-path "~/.emacs.d/public_reposjshint-mode")
(require 'flymake-jshint)
(add-hook 'js-mode-hook
          (lambda () (flymake-mode t)))

;; mozpel
(autoload 'moz-minor-mode "moz" "Mozilla Minor and Inferior Mozilla Modes" t)

(add-hook 'js-mode-hook 'javascript-custom-setup)
(defun javascript-custom-setup ()
(moz-minor-mode 1))

;; Tern.js - Intelligent Javascript tooling
(add-hook 'js-mode-hook (lambda () (tern-mode t)))
(eval-after-load 'tern
  '(progn
     (require 'tern-auto-complete)
           (tern-ac-setup)))
