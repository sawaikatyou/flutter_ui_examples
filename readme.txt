〇前提
　Flutterをインストールしてあること

〇手順
1.Cygwinをインストールする

2.インストールする際、GCC/MAKE/PERLをインストールしておく

3.以下URLからLCOVのソースコード（tar.gz）をダウンロードする
http://ltp.sourceforge.net/coverage/lcov.php

4.フォルダに入って make install する

5.lcov / genhtml できるコマンドに反応することを確認する

6.以下コマンドで、まずFlutterの単体試験結果を lcov.info にする
　flutter test --coverage

7.出来上がった後に、Cygwinターミナルからプロジェクトフォルダに移動し以下を実施
genhtml coverage/lcov.info -o coverage/html


run.bat
