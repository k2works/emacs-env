;; HTML
;; HTML編集のデフォルトモードをnxml-modeにする
(add-to-list 'auto-mode-alist '("\\.[sx]?html?\\(\\.[a-zA-Z_]+\\)?\\'" . nxml-mode))
;; HTML5
(eval-after-load "rng-loc"
  '(add-to-list 'rng-schema-locating-files "~/.emacs.d/public_repos/html5-el/schemas.xml"))

(when (require 'whattf-dt nil t)
  ;; nxml-modeの基本設定
  ;; </を入力すると自動的にタグを閉じる
  (setq nxml-slash-auto-complete-flag t)
  ;; M-TABでタグを補完する
  (setq nxml-bind-meta-tab-to-complete-flag t)
  ;; nxml-modeでauto-complete-modeを利用する
  (add-to-list 'ac-modes 'nxml-mode))

;;cssm-modeの基本設定
(defun css-mode-hooks ()
  "css-mode hooks"
  ;; インデントをCスタイルにする
  (setq cssm-indent-function #'cssm-c-style-indenter)
  ;; インデント幅を2にする
  (setq cssm-indent-level 2)
  ;; インデントにタブ文字を使わない
  (setq-default indent-tabs-mode nil)
  ;; 閉じ括弧の前に改行を挿入する
  (setq cssm-newline-before-closing-bracket t))

(add-hook 'css-mode-hook 'css-mode-hooks)

;; XML用Flymakeの設定
(defun flymake-xml-init ()
  (list "xmllint" (list "--valid"
                        (flymake-init-create-temp-buffer-copy
                         'flymake-create-temp-inplace))))
