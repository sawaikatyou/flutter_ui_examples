import 'package:flutter/material.dart';
import 'package:flutter_ui_examples/constraints/constraints.dart';
import 'package:flutter_ui_examples/generated/l10n.dart';

/// ジャンケンアプリ
///
///ジャンケンするだけ
class JankenButtonApp extends StatefulWidget {
  @override
  _JankenButtonAppState createState() => _JankenButtonAppState();
}

class _JankenButtonAppState extends State<JankenButtonApp> {
  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    if (message == null) {
      message = s.jankenapp_defaultmessage;
    }

    return Scaffold(
      appBar: AppBar(title: Text(s.jankenapp_title)),
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
                  child: Text(s.jankenapp_buttonlabel, style: cDefaultFontL),
                )),
          ],
        ),
      ),
    );
  }

  void buttonPressed() {
    setState(() {
      /* ランダム生成で先頭を取得。それを手とする */
      message = (_JankenNoTe..shuffle()).first;
    });
  }

  String message;

  static var _JankenNoTe = <String>['グー', 'チョキ', 'パー'];
}
