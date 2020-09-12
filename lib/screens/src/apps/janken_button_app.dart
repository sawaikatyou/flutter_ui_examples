import 'package:flutter/material.dart';
import 'package:flutter_ui_examples/constraint/constraints.dart';

class JankenButtonApp extends StatefulWidget {
  final String _widgettitle = 'Junken Button Tap';
  final String _defaultmessage = 'じゃんけんしよう！';
  final String _buttonLabel = 'じゃんけんをする';

  @override
  _JankenButtonAppState createState() => new _JankenButtonAppState();
}

class _JankenButtonAppState extends State<JankenButtonApp> {
  int _counter = 0;
  String message;

  static var _janken_no_te = <String>['グー', 'チョキ', 'パー'];

  @override
  void initState() {
    super.initState();
    message = widget._defaultmessage;
  }

  void buttonPressed() {
    setState(() {
      /* ランダム生成で先頭を取得。それを手とする */
      message = (_janken_no_te..shuffle()).first;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget._widgettitle),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
                padding: cDefaultPaddingDbl,
                child: Text(
                  message,
                  style: cDefaultFontL,
                )),
            FlatButton(
                key: null,
                onPressed: buttonPressed,
                color: Colors.black12,
                child: Padding(
                  padding: cDefaultPadding,
                  child: Text(widget._buttonLabel, style: cDefaultFontL),
                )),
          ],
        ),
      ),
    );
  }
}
