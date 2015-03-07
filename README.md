俺のEmacs
===
# 目的
俺のEmacs環境を構築・管理する

# 前提
| ソフトウェア     | バージョン    | 備考         |
|:---------------|:-------------|:------------|
| OS X           |10.8.5        |             |
| emacs 24 　　　|        |             |

# 構成
+ [セットアップ](#1)
+ [操作](#2)
+ [設定](#3)
+ [拡張](#4)

# 詳細
## <a name="1">セットアップ</a>
+ [レシピ](https://github.com/k2works/emacs-cookbook)

## <a name="2">操作</a>
### コマンド
### 起動と終了
#### 起動する
+ ターミナルから起動する
```bash
$ emacs -nwもしくは --no-window-system
```
+ Emacsデーモンで起動を高速化する
```bash
$ emacs --daemon
$ emacsclient -cもしくは --create-frame
```
ターミナル
```bash
$ emacsclient -tもしくは -nw
```
終了
```bash
$ emacsclient -e '(kill-emacs)'
```
または`M-x kill-emacs`

+ デバッグモードでの起動
```bash
$ emacs --debug-init
```
#### 終了する
`C-x C-c`

### ファイル（バッファ）を開く、保存する
#### ファイル（バッファ）を開く
`C-x C-f`
#### ファイル（バッファ）を保存する
`C-x C-s`
#### すべてのファイル（バッファ）を保存する
`C-x s`
#### 別名で保存する
`C-x C-w`
#### バッファに別ファイルを挿入する
`C-x i`
#### 文字コード・改行コードを変換する
`C-x RET -f`
#### 文字コード・改行コードを変換して開き直す
`C-x RET r`
#### バッファを切り替える
`C-x b`
#### バッファを消去する
`C-x k`

### カーソルの移動
| キー            | 説明         |
|:---------------|:------------|
| C-l            | カーソル位置を起点にウィンドウの表示をリフレッシュする  |
| C-n      　　　 | １つ下の行に移動する              |
| C-f　      　　 | １文字後ろに移動する            |
| C-p　      　　 | １つ上の行に移動する            |
| C-b　      　　 | １文字前に移動する            |
| C-a　      　　 | 行頭に移動する            |
| C-e　      　　 | 行待つに移動する            |
| C-v　      　　 | １画面下へスクロールする            |
| M-v　      　　 | １画面上へスクロールする            |
| C-M-v　    　　 | ウィンドウ分割時にほかのウインドウに対してC-vを実行する            |
| C-M-S-v　    　 | ウィンドウ分割時にほかのウインドウに対してM-vを実行する            |
| M-<　      　　 | バッファの先頭に移動する            |
| M->　      　　 | バッファの終端に移動する            |
| M-g M-g, M-g g | ミニバッファで入力した行番号へ移動する            |

### 文字の入力や文字列の操作
#### マークとリージョン
`C-SPC`
#### コピーとカット
`M-w,C-w`
#### 行を消去する
`C-k`
#### ペーストする
`C-y, C-y M-y・・・・`
#### コメントする、コメントを解除する
`M-;`
#### 特殊文字を入力する
`C-q`
#### アンドゥ
`C-/,C-_,C-x u`

### Emacsの正規表現
### 検索と置換
#### grepによる検索
`M-x grep`
#### インクリメンタル検索
`C-s, C-r, C-M-s, C-M-r`
#### 対話置換、一括置換
`M-%,C-M-%`

### ウインドウ操作
#### ウィンドウを移動する
`C-x o`
#### 分割したウィンドウを閉じる
`C-x 1, C-x 0`

### ディレクトリ操作(Dired)
| キー            | 説明         |
|:---------------|:------------|
| n,SPC          | 次の行へ  |
| p      　　　   | 前の行へ              |
| RET,f　     　  | 現在行のファイルを開く   |
| d          　　 | 削除候補としてマークする  |
| x　        　　 | マークしたファイルを削除する   |
| m　        　　 | マークする   |
| *%　        　　 | 正規表現でマークする   |
| backspace　  | １行上のマークを外す   |
| u　        　　 | 現在行のマークを外す   |
| *!　        　　 | マークをすべて外す   |
| +　        　　 | ディレクトリを作成する   |
| C-_        　　 | 操作を１つ戻す   |
| D　        　　 | 指定したファイルを削除する   |
| R　        　　 | 指定したファイル名を変更する   |
| C　        　　 | 指定したファイルをコピーする   |
| q　        　　 | ウインドウを閉じる   |

### キーボドマクロによる繰り返し操作
#### 基本的な使いかた
`C-x (`で開始

`C-x )`で終了

`C-x e`で実行

#### 名前を付ける
`M-x name-last-kbd-macro`

#### 再利用するために保存する
`M-x insert-kbd-macro RET xxxx- RET`

### 表示の変更
#### 文字サイズをすぐに変更する
`C-x C-+, C-x C-=,C-x C--, C-x C-0`

#### 行の折り返し表示を変更する
`M-x toggle-truncate-line`

### ヘルプの利用
#### info
`M-x info`

#### ヘルプコマンド
`C-h, <f1>`
#### よく利用するヘルプコマンド
+ `C-h a 文字列 RET`
+ `C-h b`
+ `C-h k キーバインド`
+ `C-h w コマンド名 RET`
+ `C-h f 関数名 RET`
+ `C-h v 変数名 RET`

## <a name="3">設定</a>
### 設定ファイルの管理方法
#### 効率的な設定ファイルの作り方と管理方法
フォルダ構成
```
.emacs.d/
├── conf
├── elisp
├── elpa
├── etc
├── info
├── init.el
├── other
└── public_repos
```
設定ファイル
_init.el_

#### 環境に応じた設定の分岐
#### 拡張機能の読み込み方
##### requirとautoloadの違い
+ require

  `(require 機能名 ファイル名 エラーの制御)`

+ autoload

  `(autoload 関数名 ファイル名 説明文 対話判定 関数の種類)`

### 本体の設定
#### 設定を反映する方法
##### C-x C-eとC-jによる評価
##### その他の評価
+ `M-x eval-buffer RET`:カレントバッファをすべて評価
+ `M-x eval-rgion RET`:リージョン選択範囲を評価

#### キーバインドの設定
##### キーマップ
+ グローバルマップ(global-map)
+ カレントバファローカルマップ(current-local-map)
+ 各モードのキーマップ

#### キーバインドの割り当て
`(define-key キーマップ キーバインド 関数のシンボル)`

#### 環境変数の設定
##### パスの設定
```lisp
(add-to-list 'exec-path "/opt/local/bin")
(add-to-list 'exec-path "/usr/local/bin")
```
##### 文字コードの設定
`M-x describe-current-coding-system RET`

#### フレームに関する設定
+ [emacs-neotree](https://github.com/jaypei/emacs-neotree)

#### インデントの設定
#### 表示・装飾に関する設定
##### フェイス
##### 表示テーマの設定
+ [emacs-jp/replace-colorthemes](https://github.com/emacs-jp/replace-colorthemes)

```bash
$ cd ~/.emacs.d
Kakigi-no-MacBook-Pro@k2works:.emacs.d (wip) $ git clone https://github.com/emacs-jp/replace-colorthemes.git colorthemes
```

##### フォントの設定
#### ハイライトの設定
#### バックアップとオートセーブ
オートセーブからの復元
`M-x recover-file RET ~/.emacs.d/init.el RET`
#### フック
`(add-hook フック名 実行する関数)`
##### 代表的なフック一覧
イベント用フック

| 名前            | 説明         |
|:---------------|:------------|
| after-save-hook  | ファイル保存後に実行される  |
| find-file-hook  | C-x C-f(find-file)でファイルを開いた時に実行される  |
| emacs-startup-hook  | Emacs起動時に設定ファイルを読み込み終えてから一度だけ実行される  |
| kill-emacs-hook  | Emacs終了時に実行される  |

各種モード用フック

| 名前            | 説明         |
|:---------------|:------------|
| c-mode-hook  | c-modeを起動した後に実行される  |
| php-mode-hook  | php-modeを起動した後に実行される  |
| cperl-mode-hook  | cperl-modeを起動した後に実行される  |
| emacs-lisp-mode-hook  | emacs-lisp-modeを起動した後に実行される  |
| lispinteraction-mode-hook  | lispinteraction-modeを起動した後に実行される  |
| js-mode-hook  | js-modeを起動した後に実行される  |
| css-mode-hook  | css-modeを起動した後に実行される  |
| nxml-mode-hook  | nxml-modeを起動した後に実行される  |

## <a name="4">拡張</a>
### Elispインストール
#### 拡張機能の自動インストール
#### Emacs Lisp Package Archive(ELPA)
### Caskインストール
```
$ brew install cask
$ cd ~/.emacs.d
$ cask init
```
### 統一したインタフェース
### 入力の効率化
### 検索と置換の拡張
### さまざまな履歴管理
### ウィンドウ管理
### メモ・情報整理
### 特殊な範囲の編集

### 各種言語の開発環境
#### HTML
+ HTML5をnxml-modeで編集する

[html5-el](https://github.com/hober/html5-el)

```bash
$ cd ~/.emacs.d/public_repos/
$ git clone git@github.com:hober/html5-el.git
$ cd html5-el/
$ make relaxng
```

#### CSS

`M-x install-elisp RET http://www.garshol.priv.no/download/software/css-mode/css-mode.el`

#### Javascript

'M-x package-install RET js2-mode RET'

#### YAML

`M-x package-install RET yaml-mode RET`

#### Ruby

### Flymakeによる文法チェック

#### JsavaScript
jslをインストールする(Mac)
```bash
$ wget http://www.javascriptlint.com/download/jsl-0.3.0-mac.tar.gz
$ tar xvf jsl-0.3.0-mac.tar.gz
$ sudo cp ./jsl-0.3.0-mac/jsl /usr/local/bin/jsl
```

#### ruby

### タグによるコードリーディング

#### ctagsとEmacsの連携
+ [exuberant ctags 日本語対応版](http://hp.vector.co.jp/authors/VA025040/ctags/)

```
$ wget http://hp.vector.co.jp/authors/VA025040/ctags/downloads/ctags-5.8j2.tar.gz
$ tar xvf ctags-5.8j2.tar.gz
$ cd ./ctags-5.8j2
$ ./configure
$ make
$ sudo make install
```

`M-x package-install RET ctags RET`

+ [helm-gtags.el](https://github.com/syohex/emacs-helm-gtags)

#### ripper-tags で高速化
+ [EmacsのRuby環境でタグを自動生成してタグジャンプ！](http://futurismo.biz/archives/2262)

```
$ observer ripper.observr
```

### フレームワーク専用拡張機能
#### Rinari
`M-x package-install RET rinari RET`  

+ [helm-rails](https://github.com/asok/helm-rails)

`M-x package-install RET helm-rails RET`  

### 特殊な文字の入力補助
+ [emoji](https://github.com/imakado/emoji/tree/master)

```bash
$ cd ~/.emacs.d/public_repos
$ git clone git@github.com:imakado/emoji.git
```

### Emacsからデータベースを操作

### シェルの利用
+ カレントファイルへ結果を出力する 'C-u M-!'
+ バッファの内容を標準入力として利用する 'M-|'

### ドキュメント閲覧・検索

### Init-loader適用
+ [init-loader.el](https://github.com/emacs-jp/init-loader)

# 参照
+ [Emacs実践入門　～思考を直感的にコード化し、開発を加速する (WEB+DB PRESS plus) ](http://www.amazon.co.jp/Emacs%E5%AE%9F%E8%B7%B5%E5%85%A5%E9%96%80-%EF%BD%9E%E6%80%9D%E8%80%83%E3%82%92%E7%9B%B4%E6%84%9F%E7%9A%84%E3%81%AB%E3%82%B3%E3%83%BC%E3%83%89%E5%8C%96%E3%81%97%E3%80%81%E9%96%8B%E7%99%BA%E3%82%92%E5%8A%A0%E9%80%9F%E3%81%99%E3%82%8B-WEB-DB-PRESS-plus/dp/4774150029)
+ [emacs](http://cookbooks.opscode.com/cookbooks/emacs)
+ [emacs24](http://cookbooks.opscode.com/cookbooks/emacs24)
+ [Homebrew で Cocoa Emacs 24.3 を入れた](http://kawachodev.hatenablog.jp/entry/homebrew-cocoa-emacs-24.3)
+ [color-theme](http://savannah.nongnu.org/projects/color-theme)
+ [cask](https://github.com/cask/cask)
+ [pallet](https://github.com/rdallasgray/pallet)
+ [Emacs-helm](https://github.com/emacs-helm/helm)
+ [Helm をストレスなく使う](http://d.hatena.ne.jp/a_bicky/20140104/1388822688a)
+ [init-loader.el と package.el を導入して快適 Emacs ライフ](http://qiita.com/catatsuy/items/5f1cd86e2522fd3384a0)
+ [Set up Javascript development environment in Emacs](http://truongtx.me/2014/02/23/set-up-javascript-development-environment-in-emacs/#javascript-refactoring)
+ [bard/mozrepl](https://github.com/bard/mozrepl/wiki)
+ [EmacsでRubyの開発環境をさらにめちゃガチャパワーアップしたまとめ](http://futurismo.biz/archives/2213)
+ [モダンなEmacsを求めて (6) Rubyについて](http://block-given.hatenablog.com/entry/2014/11/12/005657)
+ [emacsのruby環境をセットアップする](http://blog.10rane.com/2014/09/01/set-up-ruby-mode-of-emacs/)
