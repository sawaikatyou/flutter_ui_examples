import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_examples/constraint/constraints.dart';

class OkOnlyDialogApp extends StatefulWidget {
  final String _title = 'Ok only AlertDialog';

  @override
  _OkOnlyDialogAppState createState() => new _OkOnlyDialogAppState();
}

class _OkOnlyDialogAppState extends State<OkOnlyDialogApp> {
  String _message;

  @override
  void initState() {
    super.initState();
    _message = 'please click ' 'show' ' Button';
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
                onPressed: onButtonPressedMaterial,
                padding: cDefaultPadding,
                child: Text(
                  'Material Design',
                  style: cDefaultFont,
                )),
            Divider(),
            RaisedButton(
                onPressed: onButtonPressedCupertino,
                padding: cDefaultPadding,
                child: Text(
                  'Cupertino Design',
                  style: cDefaultFont,
                )),
          ]),
    );
  }

  void onButtonPressedMaterial() {
    showDialog<int>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text('Dialog Title'),
        content: Text('Dialog Body'),
        actions: <Widget>[
          FlatButton(
            child: const Text('ok'),
            onPressed: () => Navigator.pop<int>(context, cButtonID_OK),
          )
        ],
      ),
    ).then<void>((int value) => resultAlert(value));
  }

  void onButtonPressedCupertino() {
    showDialog<int>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text('Dialog Title'),
        content: Text('Dialog Body'),
        actions: <Widget>[
          CupertinoDialogAction(
            child: const Text('ok'),
            onPressed: () => Navigator.pop<int>(context, cButtonID_OK),
          )
        ],
      ),
    ).then<void>((int value) => resultAlert(value));
  }

  void resultAlert(int value) {
    setState(() {
      /* FlatButton 押さずに終わった場合はnullになる */
      if (value != null) {
        if (cButtonID_Cancel == value) {
          _message = 'selected: ' 'cancel' '';
        } else {
          _message = 'selected: ' 'ok' '';
        }
      } else {
        _message = 'please click Button';
      }
    });
  }
}
