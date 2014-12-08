俺のEmacs
===
# 目的
# 前提
| ソフトウェア     | バージョン    | 備考         |
|:---------------|:-------------|:------------|
| OS X           |10.8.5        |             |
| emacs 23 　　　|        |             |
| emacs 24 　　　|        |             |

# 構成
+ [セットアップ](#1)
+ [操作](#2)
+ [設定](#3)
+ [拡張](#4)

# 詳細
## <a name="1">セットアップ</a>
### Linux
```bash
$ vagrant up
$ vagrant ssh-config --host emacs-env >> ~/.ssh/config
$ knife solo prepare emacs-env --bootstrap-version 11.10.4
$ knife solo cook emacs-env
```
### MacOS
```bash
$ brew install --cocoa --japanese --with-gnutls -srgb emacs
$ brew linkapps
```

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
## <a name="4">拡張</a>

# 参照
+ [emacs](http://cookbooks.opscode.com/cookbooks/emacs)
+ [emacs24](http://cookbooks.opscode.com/cookbooks/emacs24)
+ [Homebrew で Cocoa Emacs 24.3 を入れた](http://kawachodev.hatenablog.jp/entry/homebrew-cocoa-emacs-24.3)