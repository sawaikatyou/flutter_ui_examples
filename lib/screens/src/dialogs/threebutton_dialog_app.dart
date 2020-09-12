import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_examples/constraint/constraints.dart';

class ThreeButtonDialogApp extends StatefulWidget {
  final String _title = '3 button Dialog';

  @override
  _ThreeButtonDialogAppState createState() => new _ThreeButtonDialogAppState();
}

class _ThreeButtonDialogAppState extends State<ThreeButtonDialogApp> {
  String _message;

  @override
  void initState() {
    super.initState();
    _message = 'please click Button';
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
    showDialog<dynamic>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: const Text('3ボタンダイアログ'),
              actions: <Widget>[
                ButtonBar(
                  children: <Widget>[
                    FlatButton(
                      onPressed: () => Navigator.pop<String>(context, 'Dismiss'),
                      color: Colors.red,
                      child: const Text('Dismiss'),
                    ),
                    Container(width: 20,),

                    FlatButton(
                      child: Text('Ok'),
                      color: Colors.blue,
                      onPressed: () => Navigator.pop<String>(context, 'Ok'),
                    ),
                    FlatButton(
                      child: Text('Cancel'),
                      color: Colors.blue,
                      onPressed: () => Navigator.pop<String>(context, 'Cancel'),
                    ),
                  ],
                ),
              ],
            )).then<void>((dynamic value) => resultAlert(value as String));
  }

  void onButtonPressedCupertino() {
    showCupertinoDialog<dynamic>(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
              title: const Text('Select One Item'),
              actions: <Widget>[
                CupertinoDialogAction(
                  onPressed: () => Navigator.pop<String>(context, 'One'),
                  child: const Text('One'),
                ),
                CupertinoDialogAction(
                  onPressed: () => Navigator.pop<String>(context, 'Two'),
                  child: const Text('Two'),
                ),
                CupertinoDialogAction(
                  onPressed: () => Navigator.pop<String>(context, 'Three'),
                  child: const Text('Three'),
                ),
              ],
            )).then<void>((dynamic value) => resultAlert(value as String));
  }

// テスト
//  void onButtonPressedCupertino() {
//    showCupertinoModalPopup<dynamic>(
//        context: context,
//        builder: (BuildContext context) => CupertinoActionSheet(
//              title: const Text('Select One Item'),
//              actions: <Widget>[
//                CupertinoActionSheetAction(
//                  onPressed: () => Navigator.pop<String>(context, 'One'),
//                  child: const Text('One'),
//                ),
//                CupertinoActionSheetAction(
//                  onPressed: () => Navigator.pop<String>(context, 'Two'),
//                  child: const Text('Two'),
//                ),
//                CupertinoActionSheetAction(
//                  onPressed: () => Navigator.pop<String>(context, 'Three'),
//                  child: const Text('Three'),
//                ),
//              ],
//            )).then<void>((dynamic value) => resultAlert(value as String));
//  }

  void resultAlert(String value) {
    setState(() {
      /* FlatButton 押さずに終わった場合はnullになる */
      if (value != null) {
        _message = "selected: $value";
      } else {
        _message = "please click Button";
      }
    });
  }
}
