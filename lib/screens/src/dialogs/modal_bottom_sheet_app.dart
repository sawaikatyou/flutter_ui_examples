import 'package:flutter/material.dart';
import 'package:flutter_ui_examples/constraints/constraints.dart';


class ModalBottomSheetApp extends StatefulWidget {
  final String _title = 'ModalBottomSheet';

  @override
  _ModalBottomSheetAppState createState() =>
      new _ModalBottomSheetAppState();
}

class _ModalBottomSheetAppState extends State<ModalBottomSheetApp> {
  String _message;

  @override
  void initState() {
    super.initState();
    _message = "please click 'show' Button";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget._title),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              _message,
              style: cDefaultFontL,
            ),
            RaisedButton(
                onPressed: onButtonPressed,
                padding: cDefaultPadding,
                child: Text(
                  'show',
                  style: cDefaultFont,
                )),
          ]),
    );
  }

  void onButtonPressed() {
    showModalBottomSheet<dynamic>(
        context: context,
        backgroundColor: Colors.white,
        builder: (BuildContext context) => Column(
              children: <Widget>[
                Text("This is ModalBottomSheet.", style: cDefaultFontL),
                Padding(
                  padding: cDefaultPadding,
                ),
                FlatButton(
                  onPressed: () => Navigator.pop<String>(context, 'close'),
                  child: Text('close', style: cDefaultFontL),
                ),
              ],
            ));
  }

  void resultAlert(String value) {
    setState(() {
      /* FlatButton 押さずに終わった場合はnullになる */
      if (value != null) {
        _message = "selected: $value";
      } else {
        _message = "please click 'show' Button";
      }
    });
  }
}
