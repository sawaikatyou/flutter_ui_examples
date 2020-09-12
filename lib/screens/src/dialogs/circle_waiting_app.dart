import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_examples/constraint/constraints.dart';

class CircleWaitingApp extends StatefulWidget {
  final String _title = 'Circle Progress Dialog';

  @override
  _CircleWaitingAppState createState() => new _CircleWaitingAppState();
}

class _CircleWaitingAppState extends State<CircleWaitingApp> {
  static const String _defaultmessage = '''please click 'show' Button
waiting 3sec''';

  String _message;
  bool _isShowingProgressDialog;

  @override
  void initState() {
    super.initState();
    _message = _defaultmessage;
    _isShowingProgressDialog = false;
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

  void onButtonPressedCupertino() async {
    /* Dialog 表示 */
    showCupertinoDialog<dynamic>(
      context: context,
      barrierDismissible: true,
      /* false にすると領域外タッチで閉じないダイアログになる*/
      builder: (BuildContext context) {
        return new CupertinoAlertDialog(
          content: Container(
            margin: EdgeInsets.all(20.0),
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                new CupertinoActivityIndicator(),
                new Container(
                    margin: new EdgeInsets.all(10.0),
                    child: new Text("Waiting...")),
                // 閉じるボタンを増やす場合はこの形
                // new RaisedButton(child:new Text('cancel'), onPressed: () => Navigator.pop(context)),
              ],
            ),
          ),
        );
      },
    ).then<void>((dynamic value) => _isShowingProgressDialog = false);

    /* 3秒後に閉じる */
    _isShowingProgressDialog = true;
    await FuturePop();
  }

  void onButtonPressedMaterial() async {
    /* Dialog 表示 */
    showDialog<dynamic>(
      context: context,
      barrierDismissible: true,
      /* false にすると領域外タッチで閉じないダイアログになる*/
      builder: (BuildContext context) {
        return new Dialog(
          child: Container(
            margin: EdgeInsets.all(20.0),
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                new CircularProgressIndicator(),
                new Container(
                    margin: new EdgeInsets.all(10.0),
                    child: new Text("Waiting...")),
                // 閉じるボタンを増やす場合はこの形
                // new RaisedButton(child:new Text('cancel'), onPressed: () => Navigator.pop(context)),
              ],
            ),
          ),
        );
      },
    ).then<void>((dynamic value) => _isShowingProgressDialog = false);

    /* 3秒後に閉じる */
    _isShowingProgressDialog = true;
    await FuturePop();
  }

  Future<void> FuturePop() {
    return new Future.delayed(new Duration(seconds: 3), () {
      if (_isShowingProgressDialog == true) {
        Navigator.pop(context);
        _message = "dismiss reason: wait 3sec";
      } else {
        debugPrint("already dismisss.");
      }
    });
  }
}
