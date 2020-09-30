import 'package:flutter/material.dart';

import 'package:flutter_ui_examples/widgets/widgets.dart';

class OsTextApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 画面サイズ取得
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("Native Textview"),
      ),
      body: Column(
        children: <Widget>[
          Text(
              "OS標準のTextViewを呼び出して色付き矩形内に出力しています。\nTextViewが表示しきれない場合の処理についてはOS標準部品の挙動となっています。"),
          Center(
              child: Container(
                  padding: EdgeInsets.symmetric(vertical: 30.0),
                  width: size.width - 100,
                  height: 100.0,
                  color: Colors.redAccent,
                  child: OsTextView(
                    onTextViewCreated: _onTextViewCreated1,
                  ))),
          Padding(padding: EdgeInsets.all(20.0)),
          Center(
              child: Container(
                  padding: EdgeInsets.symmetric(vertical: 30.0),
                  width: size.width - 100,
                  height: 100.0,
                  color: Colors.blueGrey,
                  child: OsTextView(
                    onTextViewCreated: _onTextViewCreated2,
                  ))),
          Padding(padding: EdgeInsets.all(20.0)),
        ],
      ),
    );
  }

  void _onTextViewCreated1(OsTextViewController controller) {
    if (controller != null) {
      controller.setText("This Text is OS Native");
    }
  }

  void _onTextViewCreated2(OsTextViewController controller) {
    if (controller != null) {
      controller.setText("This Text is OS Native");
      controller.setTextSize("32.0");
    }
  }
}
