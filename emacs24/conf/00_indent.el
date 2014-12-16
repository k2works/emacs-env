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

(let ((ruby-mode-hs-info
  '(ruby-mode
    "class\\|module\\|def\\|if\\|unless\\|case\\|while\\|until\\|for\\|begin\\|do"
    "end"
    "#"
    ruby-move-to-block
    nil)))
    (if (not (member ruby-mode-hs-info hs-special-modes-alist))
    (setq hs-special-modes-alist
      (cons ruby-mode-hs-info hs-special-modes-alist))))
      
