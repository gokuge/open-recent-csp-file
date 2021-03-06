# open-recent-csp-file
Open Clip Studio Paint recent file for MacOS  
  
一応Mac OS用のClipStudioPaint向けスクリプトです  
ClipStudioPaintには起動時に前回開いていたファイルを自動で開いて欲しいのですが  
標準ではこの機能が無いようなので、それっぽいものを作りました  
  
## 動作
厳密には前回開いていたファイルではありませんが  
ClipStudioPaintで作成したファイルを保存しているディレクトリを対象に  
最も更新日時が新しい .clip か .cmc のファイルを開きます  
  
## 使い方
あくまで1例です  
Macにログイン時、自動でこのスクリプトを実行させる事がゴールです  
  
1. アプリケーションフォルダにあるAutomatorを起動し、アプリケーションを作成します
2. シェルで検索をすると出てくる **シェルスクリプトを実行** というアクションが出てくるので、そのアクションを追加します
3. 追加されたアクションのシェルが `/bin/bash` になっている事を確認します
4. シェルの内容は [open_recent_csp_file.sh](https://github.com/gokuge/open-recent-csp-file/blob/main/open_recent_csp_file.sh) の `#!/bin/bash` 以外をコピペします
5. `dir_path="YOUR CLIP STUDIO PAINT FILE DIR PATH"` のダブルクォーテーション内をClipStudioPaintで作成したファイルを保存しているディレクトリのパスに書き換えます
  - 例: `dir_path="/Users/gokuge/Pictures"`
  - 指定したディレクトリ内を再帰的に検索します
6. 保存します。名前はご自由に、フォーマットはアプリケーションのままにして下さい
7. システム環境設定のユーザとグループからログイン項目に6で作成したアプリケーションを追加し、ログイン時に実行させるようにします
  
要は  
  
1. 指定したディレクトリの
2. 指定した拡張子の
3. 最も更新日時の新しいファイルを開く
  
というだけなので、ClipStudioPaint以外でも使えると思います  
  
## 備考
Automatorを使っている理由は跡を濁さずファイルを開いて欲しかったからです  
.commandだとターミナルの設定でウィンドウを消す所まではいけますが、ターミナル自体を終了させるのは面倒そうでした  

頑張ればAutomatorも使わずに静かに実行するのも可能な気がしますが  
このコマンドを叩きたい方には手軽でわかりやすいこの方法が良いかなと思いました
