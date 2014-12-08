俺のemacs
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

```bash
$ brew install --cocoa --japanese --with-gnutls -srgb emacs
$ brew linkapps
```

## <a name="2">操作</a>
## <a name="3">設定</a>
## <a name="4">拡張</a>

# 参照
+ [emacs](http://cookbooks.opscode.com/cookbooks/emacs)
+ [emacs24](http://cookbooks.opscode.com/cookbooks/emacs24)
+ [Homebrew で Cocoa Emacs 24.3 を入れた](http://kawachodev.hatenablog.jp/entry/homebrew-cocoa-emacs-24.3)
