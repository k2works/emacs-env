;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 拡張                          ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; auto-installの設定
(when (require 'auto-install nil t)
;; インストールディレクトリを設定する 初期値は ~/.emacs.d/auto-install/
;;(setq auto-install-directory "~/.emacs.d/elisp/")
;; EmacsWikiに登録されているelisp の名前を取得する
;;(auto-install-update-emacswiki-package-name t)
;; 必要であればプロキシの設定を行う
;; (setq url-proxy-services '(("http" . "localhost:8339")))
;; install-elisp の関数を利用可能にする
;;(auto-install-compatibility-setup))

;; package.elの設定
(when (require 'package nil t)
  ;; パッケージリポジトリにMarmaladeと開発者運営のELPAを追加
  (add-to-list 'package-archives
               '("marmalade" . "http://marmalade-repo.org/packages/"))
  (add-to-list 'package-archives
               '("melpa" . "http://melpa.milkbox.net/packages/"))
  (add-to-list 'package-archives '("ELPA" . "http://tromey.com/elpa/"))
  ;; インストールしたパッケージにロードパスを通して読み込む
  (package-initialize))
