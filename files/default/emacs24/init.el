;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; キーバインドの設定                                         ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; C-hをバックスペースにする
;; ?\C-?はDELのキーシーケンス
(keyboard-translate ?\C-h ?\C-?)
;; 改行と同時にインデントする
;; C-mにnewline-and-indentを割り当てる
(global-set-key (kbd "C-m") 'newline-and-indent)
;; 行の折り返し表示を切り替える
(define-key global-map (kbd "C-c l") 'toggle-truncate-lines)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 環境変数の設定                                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; パスの設定
(add-to-list 'exec-path "/opt/local/bin")
(add-to-list 'exec-path "/usr/local/bin")
(add-to-list 'exec-path "~/bin")

;; 文字コードを指定する
(set-language-environment "Japanese")
(prefer-coding-system 'utf-8)
;; ファイル名の扱い
;; Mac OS Xの場合のファイル名の設定
(when (eq system-type 'darwin)
  (require 'ucs-normalize)
  (set-file-name-coding-system 'utf-8-hfs)
  (setq locale-coding-system 'utf-8-hfs))

;; Windowsの場合のファイル名の設定
(when (eq system-type 'w32)
  (set-file-name-coding-system 'cp923)
  (setq locale-coding-system 'cp923))


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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; インデントの設定                                          ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; タブ文字の表示幅
(setq-default tab-width 4)
;; タブ文字の利用
(setq-default indent-tabs-mode nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 表示・装飾に関する設定                                     ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; フェイス
;; リージョンの背景色を変更
(set-face-background 'region "darkgreen")
;; 表示テーマの設定
(when (require 'color-theme nil t)
  ;; テーマを読み込むための設定
  (color-theme-initialize))

;; フォントの設定
(when (eq window-system 'ns)
 ;; asciiフォントをMenloに
 (set-face-attribute 'default nil
   :family "Menlo"
   :height 120)
   ;; 日本語フォントをヒラギノ明朝 Proに
   (set-fontset-font
     nil 'japanese-jisx0208
     ;; 英語名の場合
     ;; (font-spec :family "Hiragino Mincho Pro"))
     (font-spec :family "ヒラギノ明朝 Pro"))
     ;; ひらがなとカタカナをモトヤシーダに
     ;; U+3000-303F	CJKの記号および句読点
     ;; U+3040-309F	ひらがな
     ;; U+30A0-30FF	カタカナ
   (set-fontset-font
     nil '(#x3040 . #x30ff)
     (font-spec :family "NfMotoyaCedar"))
     ;; フォントの横幅を調節する
   (setq face-font-rescale-alist
         '((".*Menlo.*" . 1.0)
           (".*Hiragino_Mincho_Pro.*" . 1.2)
           (".*nfmotoyacedar-bold.*" . 1.2)
           (".*nfmotoyacedar-medium.*" . 1.2)
           ("-cdac$" . 1.3))))

(when (eq system-type 'windows-nt)
  ;; asciiフォントをConsolasに
  (set-face-attribute 'default nil
                     :family "Consolas"
                     :height 120)
  ;; 日本語フォントをメイリオに
  (set-fontset-font
   nil
   'japanese-jisx0208
   (font-spec :family "メイリオ"))
   ;; フォントの横幅を調節する
   (setq face-font-rescale-alist
         '((".*Consolas.*" . 1.0)
           (".*メイリオ.*" . 1.15)
           ("-cdac$" . 1.3))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ハイライトの設定                                          ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; 現在行のハイライト
(defface my-hl-line-face
  ;; 背景がdarkならば背景色を紺に
  '((((class color) (background dark))
  (:background "NavyBlue" t))
  ;; 背景がlightならば背景色を緑に
  (((class color) (background light))
  (:background "LightGoldenrodYellow" t))
  (t (:bold t)))
  "hl-line's my face")
(setq hl-line-face 'my-hl-line-face)
(global-hl-line-mode t)

;; 括弧の対応関係のハイライト
;; paren-mode：対応する括弧を強調して表示する
(setq show-paren-delay 0) ; 表示までの秒数。初期値は0.125
(show-paren-mode t) ; 有効化
;; parenのスタイル: expressionは括弧内も強調表示
(setq show-paren-style 'expression)
;; フェイスを変更する
(set-face-background 'show-paren-match-face nil)
(set-face-underline-p 'show-paren-match-face "yellow")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; バックアップとオートセーブ                                  ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; バックアップとオートセーブの設定
;; バックアップファイルを作成しない
;;(setq make-backup-file nil) ; 初期値はt
;; オートセーブファイルは作らない
;;(setq auto-save-default nil) ; 初期値はt
;; バックアップとオートセーブファイルを~/.emacs.d/backups/へ集める
(add-to-list 'backup-directory-alist
  (cons "." "~/.emacs.d/backups/"))
  (setq auto-save-file-name-transforms
    `((".*" ,(expand-file-name "~/.emacs.d/backups/") t)))

;; オートセーブファイル作成までの秒間隔
(setq auto-save-timeout 15)
;; オートセーブファイル作成までのタイプ間隔
(setq auto-save-interval 60)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; フック                                                  ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; emacs-lisp-modeのフックをセット
(add-hook 'emacs-lisp-mode-hook
          '(lambda ()
             (when (require 'eldoc nil t)
               (setq eldoc-idle-delay 0.2)
               (setq eldoc-echo-area-use-multiline-p t)
               (turn-on-eldoc-mode))))

;; emacs-lisp-mode-hook用の関数を定義
(defun elisp-mode-hooks ()
  "lisp-mode-hooks"
  (when (require 'eldoc nil t)
    (setq eldoc-idle-delay 0.2)
    (setq eldoc-echo-area-use-multiline-p t)
    (turn-on-eldoc-mode)))

;; emacs-lisp-modeのフックをセット
(add-hook 'emacs-lisp-mode-hook 'elisp-mode-hooks)
