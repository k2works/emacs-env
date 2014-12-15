;; シェルの利用
;; multi-termの設定
(when (require 'multi-term nil t)
  ;; 使用するシェルを指定
  (setq multi-term-program "/bin/bash"))
