;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; キーバインドの設定                                         ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; C-hをバックスペースにする
;; ?\C-?はDELのキーシーケンス
;;(keyboard-translate ?\C-h ?\C-?)
(define-key key-translation-map [?\C-h] [?\C-?])
;; 改行と同時にインデントする
;; C-mにnewline-and-indentを割り当てる
(global-set-key (kbd "C-m") 'newline-and-indent)
;; 行の折り返し表示を切り替える
(define-key global-map (kbd "C-c l") 'toggle-truncate-lines)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 環境変数の設定                                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Caskの設定
(when (eq system-type 'gnu/linux)
(require 'cask "~/.cask/cask.el")
(cask-initialize))

(when (require 'cask nil t)
(cask-initialize))

(when (require 'pallet nil t)
  (pallet-mode t))

;;; パスの設定
(add-to-list 'exec-path "/opt/local/bin")
(add-to-list 'exec-path "/usr/local/bin")
(add-to-list 'exec-path "~/bin")

;; load-path を追加する関数を定義
(defun add-to-load-path (&rest paths)
(let (path)
(dolist (path paths paths)
(let ((default-directory
  (expand-file-name (concat user-emacs-directory path))))
  (add-to-list 'load-path default-directory)
  (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
  (normal-top-level-add-subdirs-to-load-path))))))

;; 引数のディレクトリとそのサブディレクトリをload-pathに追加
(add-to-load-path "elisp" "conf" "public_repos")

;; ターミナル以外はツールバー、スクロールバーを非表示
(when window-system
  ;; tool-barを非表示
  (tool-bar-mode 0)
  ;; scroll-barを非表示
  (scroll-bar-mode 0))

  ;; CocoaEmacs以外はメニューバーを非表示
  (unless (eq window-system 'ns)
  ;; menu-barを非表示
  (menu-bar-mode 0))

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

;; emacs-neotreeの設定
(when (require 'neotree nil t)
  (global-set-key (kbd "C-\\") 'neotree-toggle))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; インデントの設定                                          ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; タブ文字の表示幅
(setq-default tab-width 4)
;; タブ文字の利用
(setq-default indent-tabs-mode nil)

;; fold-dwimの設定
(when (require 'fold-dwim nil t)        
  (global-set-key (kbd "C-x t t")   'fold-dwim-toggle)
  (global-set-key (kbd "C-x t h")    'fold-dwim-hide-all)
  (global-set-key (kbd "C-x t s")  'fold-dwim-show-all))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 表示・装飾に関する設定                                     ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; フェイス
;; リージョンの背景色を変更
(set-face-background 'region "darkgreen")
;; 表示テーマの設定
;; Please set your themes directory to 'custom-theme-load-path
(add-to-list 'custom-theme-load-path
  (file-name-as-directory "~/.emacs.d/colorthemes"))

  ;; load your favorite theme
  ;;(load-theme 'aalto-dark t t)
  ;;(enable-theme 'aalto-dark)

(load-theme 'tango-dark t)

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
(add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 拡張                          ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; auto-installの設定
(when (require 'auto-install nil t)
  ;; インストールディレクトリを設定する 初期値は ~/.emacs.d/auto-install/
  (setq auto-install-directory "~/.emacs.d/elisp/")
  ;; EmacsWikiに登録されているelisp の名前を取得する
  (auto-install-update-emacswiki-package-name t)
  ;; 必要であればプロキシの設定を行う
  ;; (setq url-proxy-services '(("http" . "localhost:8339")))
  ;; install-elisp の関数を利用可能にする
  (auto-install-compatibility-setup))

;; package.elの設定
(when (require 'package nil t)
;; パッケージリポジトリにMarmaladeと開発者運営のELPAを追加
(add-to-list 'package-archives
  '("marmalade" . "http://marmalade-repo.org/packages/"))
  (add-to-list 'package-archives '("ELPA" . "http://tromey.com/elpa/"))
  ;; インストールしたパッケージにロードパスを通して読み込む
  (package-initialize))

;; 統一したインタフェース
;; helm
(when (require 'helm-config nil t)
(helm-mode 1)

(define-key global-map (kbd "M-x")     'helm-M-x)
(define-key global-map (kbd "C-x C-f") 'helm-find-files)
(define-key global-map (kbd "C-x C-r") 'helm-recentf)
(define-key global-map (kbd "M-y")     'helm-show-kill-ring)
(define-key global-map (kbd "C-c i")   'helm-imenu)
(define-key global-map (kbd "C-x b")   'helm-buffers-list)

(define-key helm-map (kbd "C-h") 'delete-backward-char)
(define-key helm-find-files-map (kbd "C-h") 'delete-backward-char)
(define-key helm-find-files-map (kbd "TAB") 'helm-execute-persistent-action)
(define-key helm-read-file-map (kbd "TAB") 'helm-execute-persistent-action)

;; Disable helm in some functions
(add-to-list 'helm-completing-read-handlers-alist '(find-alternate-file . nil))

;; Emulate `kill-line' in helm minibuffer
(setq helm-delete-minibuffer-contents-from-point t)
(defadvice helm-delete-minibuffer-contents (before helm-emulate-kill-line activate)

"Emulate `kill-line' in helm minibuffer"
(kill-new (buffer-substring (point) (field-end))))

(defadvice helm-ff-kill-or-find-buffer-fname (around execute-only-if-exist activate)
"Execute command only if CANDIDATE exists"
(when (file-exists-p candidate)
ad-do-it))

(defadvice helm-ff-transform-fname-for-completion (around my-transform activate)
"Transform the pattern to reflect my intention"
(let* ((pattern (ad-get-arg 0))
(input-pattern (file-name-nondirectory pattern))
(dirname (file-name-directory pattern)))
(setq input-pattern (replace-regexp-in-string "\\." "\\\\." input-pattern))
(setq ad-return-value
  (concat dirname
    (if (string-match "^\\^" input-pattern)
    ;; '^' is a pattern for basename
    ;; and not required because the directory name is prepended
    (substring input-pattern 1)
    (concat ".*" input-pattern)))))))

;; 入力の効率化
;; auto-completeの設定
(when (require 'auto-complete-config nil t)
  (add-to-list 'ac-dictionary-directories
               "~/.emacs.d/elisp/ac-dict")
  (define-key ac-mode-map (kbd "M-TAB") 'auto-complete)
  (ac-config-default))

;; yasnippet
(require 'cl)
;; 問い合わせを簡略化 yes/no を y/n
(fset 'yes-or-no-p 'y-or-n-p)

;; yasnippetを置いているフォルダにパスを通す
(when (require 'yasnippet nil t)
  ;; ~/.emacs.d/にsnippetsというフォルダを作っておきましょう
  (setq yas-snippet-dirs
    '("~/.emacs.d/snippets" ;; 作成するスニペットはここに入る
      "~/.emacs.d/.cask/24.4.1/elpa/yasnippet-20141117.327/snippets" ;; 最初から入っていたスニペット(省略可能)
      ))
      (yas-global-mode 1)

      ;; 単語展開キーバインド (ver8.0から明記しないと機能しない)
      ;; (setqだとtermなどで干渉問題ありでした)
      ;; もちろんTAB以外でもOK 例えば "C-;"とか
      (custom-set-variables '(yas-trigger-key "TAB"))

      ;; 既存スニペットを挿入する
      (define-key yas-minor-mode-map (kbd "C-x i i") 'yas-insert-snippet)
      ;; 新規スニペットを作成するバッファを用意する
      (define-key yas-minor-mode-map (kbd "C-x i n") 'yas-new-snippet)
      ;; 既存スニペットを閲覧・編集する
      (define-key yas-minor-mode-map (kbd "C-x i v") 'yas-visit-snippet-file))

;; ac-helm
(when (require 'ac-helm nil t)  ;; Not necessary if using ELPA package
  (global-set-key (kbd "C-:") 'ac-complete-with-helm)
  (define-key ac-complete-mode-map (kbd "C-:") 'ac-complete-with-helm))

;; 検索と置換の拡張
;; color-moccurの設定
(when (require 'color-moccur nil t)
  ;; M-oにoccur-by-moccurを割り当て
  (define-key global-map (kbd "M-o") 'occur-by-moccur)
  ;; スペース区切りでAND検索
  (setq moccur-split-word t)
  ;; ディレクトリ検索のとき除外するファイル
  (add-to-list 'dmoccur-exclusion-mask "\\.DS_Store")
  (add-to-list 'dmoccur-exclusion-mask "^#.+#$")
  ;; Migemoを利用できる環境であればMigemoを使う
  (when (and (executable-find "cmigemo")
             (require 'migemo nil t))
    (setq moccur-use-migemo t)))

;; moccur-editの設定
(require 'moccur-edit nil t)
;; moccur-edit-finish-editと同時にファイルを保存する
(defadvice moccur-edit-change-file
    (after sava-after-moccur-edit-buffer activate)
  (save-buffer))
;; wgrepの設定
(require 'wgrep nil t)

;; さまざまな履歴管理
;; undohistの設定
(when (require 'undohist nil t)
  (undohist-initialize))

;; undo-treeの設定
(when (require 'undo-tree nil t)
  (global-undo-tree-mode))

;; point-undoの設定
(when (require 'point-undo nil t)
  (define-key global-map (kbd "M-[") 'point-undo)
  (define-key global-map (kbd "M-]") 'point-redo)
  )

;; ウインドウ管理
;; ElScreenのプリフィックスキーを変更する(初期値はC-z)
(setq elscreen-prefix-key (kbd "C-t"))
(when (require 'elscreen nil t)
  (elscreen-start)
;;; タブの先頭に[X]を表示しない
(setq elscreen-tab-display-kill-screen nil)
;;; header-lineの先頭に[<->]を表示しない
(setq elscreen-tab-display-control nil)
;;; バッファ名・モード名からタブに表示させる内容を決定する(デフォルト設定)
(setq elscreen-buffer-to-nickname-alist
      '(("^dired-mode$" .
         (lambda ()
           (format "Dired(%s)" dired-directory)))
        ("^Info-mode$" .
         (lambda ()
           (format "Info(%s)" (file-name-nondirectory Info-current-file))))
        ("^mew-draft-mode$" .
         (lambda ()
           (format "Mew(%s)" (buffer-name (current-buffer)))))
        ("^mew-" . "Mew")
        ("^irchat-" . "IRChat")
        ("^liece-" . "Liece")
        ("^lookup-" . "Lookup")))
(setq elscreen-mode-to-nickname-alist
      '(("[Ss]hell" . "shell")
        ("compilation" . "compile")
        ("-telnet" . "telnet")
        ("dict" . "OnlineDict")
                ("*WL:Message*" . "Wanderlust")))
  ;; C-z C-zをタイプした場合にデフォルトのC-zを利用する
  (if window-system
      (define-key elscreen-map (kbd "C-z") 'iconifiy-or-deiconify-frame)
    (define-key elscreen-map (kbd "C-z") 'suspend-emacs)))

;; メモ・情報整理
(require 'gist nil t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("6e03b7f86fcca5ce4e63cda5cd0da592973e30b5c5edf198eddf51db7a12b832" "3fe4861111710e42230627f38ebb8f966391eadefb8b809f4bfb8340a4e85529" "fc89666d6de5e1d75e6fe4210bd20be560a68982da7f352bd19c1033fb7583ba" "f34690262d1506627de39945e0bc2c7c47ece167edea85851bab380048dc8580" "f211f8db2328fb031908c9496582e7de2ae8abd5f59a27b4c1218720a7d11803" "89127a6e23df1b1120aa61bd7984f1d5f2747cad1e700614a68bdb7df77189ba" "6394ba6170fd0bc9f24794d555fa84676d2bd5e3cfd50b3e270183223f8a6535" "ad97202c92f426a867e83060801938acf035921d5d7e78da3041a999082fb565" "31772cd378fd8267d6427cec2d02d599eee14a1b60e9b2b894dd5487bd30978e" "a3821772b5051fa49cf567af79cc4dabfcfd37a1b9236492ae4724a77f42d70d" default)))
 '(helm-gtags-ignore-case helm)
 '(helm-gtags-path-style (quote relative))
 '(t-gtags-auto-update t)
 '(yas-trigger-key "TAB"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; 各種言語の開発環境
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

;; JavaScript
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
;; js-modeの起動時にhookを追加
(add-hook 'js-mode-hook 'js-indent-hook)

;; yaml-modeの設定
(when (require 'yaml-mode nil t)
  (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode)))

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

;; Flymakeによる文法チェック
;; XML用Flymakeの設定
(defun flymake-xml-init ()
  (list "xmllint" (list "--valid"
                        (flymake-init-create-temp-buffer-copy
                         'flymake-create-temp-inplace))))

;; JavaScript
(add-hook 'js-mode-hook 'flymake-jslint-load)

;; Ruby用Flymakeの設定
(add-hook 'ruby-mode-hook 'flymake-ruby-load)

;; タグによるコードリーディング
;; ctags.elの設定
(require 'ctags nil t)
(setq tags-revert-without-query t)
(global-set-key (kbd "C-M-t") 'ctags-create-or-update-tags-table)

;; helm-gtagsの設定
;;; Enable helm-gtags-mode
(add-hook 'ruby-mode-hook 'helm-gtags-mode)
(add-hook 'js2-mode-hook 'helm-gtags-mode)

;; customize


;; key bindings
(eval-after-load "helm-gtags"
  '(progn
     (define-key helm-gtags-mode-map (kbd "M-t") 'helm-gtags-find-tag)
     (define-key helm-gtags-mode-map (kbd "M-r") 'helm-gtags-find-rtag)
     (define-key helm-gtags-mode-map (kbd "M-s") 'helm-gtags-find-symbol)
     (define-key helm-gtags-mode-map (kbd "M-g M-p") 'helm-gtags-parse-file)
     (define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
     (define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history)
          (define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack)))

;; フレームワーク専用拡張機能
(require 'helm-rails)
(define-key global-map (kbd "s-t") 'helm-rails-controllers)
(define-key global-map (kbd "s-y") 'helm-rails-models)
(define-key global-map (kbd "s-u") 'helm-rails-views)
(define-key global-map (kbd "s-o") 'helm-rails-specs)
(define-key global-map (kbd "s-r") 'helm-rails-all)

;; 特殊な文字の入力補助
(require 'emoji nil t)

;; Emacsからデータベースを操作
;; SQLサーバへ接続するためのデフォルト情報
(setq sql-user "root" ; デフォルトユーザー名
      sql-database "database_name" ; データベース名
      sql-server "localhost" ; ホスト名
      sql-product 'mysql) ; データベースの種類

;; シェルの利用
;; multi-termの設定
(when (require 'multi-term nil t)
  ;; 使用するシェルを指定
  (setq multi-term-program "/bin/bash"))

;; ドキュメント閲覧・検索
;; キャッシュを作成
(setq woman-cache-filename "~/.emacs.d/.wmncach.el")
;; manパスを設定
(setq woman-manpath '("/usr/share/man"
                      "/usr/local/share/man"
                      "/usr/local/share/man/ja"))
