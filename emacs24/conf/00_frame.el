;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; フレームに関する設定                                       ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 行番号／カラム番号を表示する
(column-number-mode t)
(line-number-mode t)
;; ファイルサイズ、時計、バッテリー残量を表示する
(size-indication-mode t)
;; (setq display-time-day-and-date t) ; 曜日・月・日を表示
;; (setq display-time-24hr-format t) ; 24時表示
(display-time-mode t)
;; バッテリー残量を表示
(display-battery-mode t)
;; リージョン内の行数と文字数をモードラインに表示する(範囲指定時のみ)
(defun count-lines-and-chars ()
(if mark-active
    (format "%d lines,%d chars "
            (count-lines (region-beginning) (region-end))
            (- (region-end) (region-beginning)))
  ;; これだとエコーエリアがチラつく
  ;;(count-lines-region (region-beginning) (region-end))
  ""))

(add-to-list 'default-mode-line-format
             '(:eval (count-lines-and-chars)))

;; タイトルバーにファイルのフルパスを表示
(setq frame-title-format "%f")
;; ウィンドウの左に行番号を表示
(global-linum-mode t)

;; emacs-neotreeの設定
(when (require 'neotree nil t)
  (global-set-key (kbd "C-\\") 'neotree-toggle))
