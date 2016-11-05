;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; キーバインドの設定                                         ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; C-hをバックスペースにする
;; ?\C-?はDELのキーシーケンス
;;(keyboard-translate ?\C-h ?\C-?)

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

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

(when (require 'cask "/usr/local/opt/cask/cask.el" t)
(cask-initialize))

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
(add-to-load-path "elisp" "conf" "public_repos" "etc")

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

;; Init-loader
(when (require 'init-loader nil t)
  (setq init-loader-show-log-after-init nil)
  (init-loader-load "~/.emacs.d/conf"))
(put 'set-goal-column 'disabled nil)
