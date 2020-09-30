import 'package:flutter/material.dart';
import 'package:flutter_ui_examples/constraints/constraints.dart';

class TextFieldLiveInputApp extends StatefulWidget {
  final String _widgettitle = 'TextField Live Input';
  final String _message = '文字を打ち込むとリアルタイムに大文字変換するよ';

  @override
  _TextFieldLiveInputAppState createState() => new _TextFieldLiveInputAppState();
}

class _TextFieldLiveInputAppState extends State<TextFieldLiveInputApp> {
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
                  onChanged: onChanged,
                  style: cDefaultFont,
                )),
          ],
        ),
      ),
    );
  }

  void onChanged(String value) {
    setState(() {
      // 大文字変換しながら反映
      _labelmessage = value.toUpperCase();
    });
  }
}
