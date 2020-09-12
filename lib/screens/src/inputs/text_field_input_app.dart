import 'package:flutter/material.dart';
import 'package:flutter_ui_examples/constraint/constraints.dart';

class TextFieldInputApp extends StatefulWidget {
  final String _widgettitle = 'TextField Input';
  final String _message = '文字を打ち込んでボタンを押してね';

  @override
  _TextFieldInputAppState createState() => new _TextFieldInputAppState();
}

class _TextFieldInputAppState extends State<TextFieldInputApp> {
  String _labelmessage;

  @override
  void initState() {
    super.initState();
    _labelmessage = widget._message;
  }

  final _MyTextcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget._widgettitle),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Padding(
                padding: cDefaultPaddingDbl,
                child: Text(_labelmessage, style: cDefaultFont)),
            Padding(
                padding: cDefaultPadding,
                child: TextField(
                  controller: _MyTextcontroller,
                  style: cDefaultFont,
                )),
            RaisedButton(
              padding: cDefaultPadding,
              color: Colors.lightBlueAccent,
              child: Text(
                '打ち込んだ',
                style: cDefaultFont,
              ),
              onPressed: () {
                setState(() {
                  String result = _MyTextcontroller.text;
                  if (!result.isEmpty) {
                    _labelmessage = '[' + _MyTextcontroller.text + ']';
                  } else {
                    _labelmessage = '何も入ってないよ';
                  }
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
