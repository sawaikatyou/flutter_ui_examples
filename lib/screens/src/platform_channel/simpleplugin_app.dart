import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SimplePluginApp extends StatefulWidget {
  @override
  _SimplePluginAppState createState() =>
      _SimplePluginAppState();
}

class _SimplePluginAppState
    extends State<SimplePluginApp> {
  static const METHOD_CHANNEL_NAME =
      "local_plugins/SimplePlatformPlugin/method";
  static const EVENT_CHANNEL_NAME = "local_plugins/SimplePlatformPlugin/event";

  static const METHOD_CHANNEL = const MethodChannel(METHOD_CHANNEL_NAME);
  static const EVENT_CHANNEL = const EventChannel(EVENT_CHANNEL_NAME);

  String _message;

  @override
  void initState() {
    super.initState();
    EVENT_CHANNEL.receiveBroadcastStream().listen(_eventListener);
    _message = "";
  }

  void _changePlatformViewMethod() async {
    try {
      dynamic value = await METHOD_CHANNEL.invokeMethod<dynamic>("switchView");
      debugPrint('Platform Method Result:$value');
      print('Platform Method Result: $value');
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void _callPlatformMethod() async {
    try {
      dynamic value = await METHOD_CHANNEL.invokeMethod<dynamic>("helloWorld");
      debugPrint('Platform Method Result: $value');
      print('Platform Method Result: $value');
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void _eventListener(dynamic obj) {
    debugPrint('Platform Event Result:$obj ');
    setState(() {
      _message = obj as String;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('method channel'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text("Native連携の基本動作を検証したサンプルです\nボタン押下で実行します"),
            RaisedButton(
                onPressed: _changePlatformViewMethod, child: Text("別画面を起動する")),
            RaisedButton(
                onPressed: _callPlatformMethod, child: Text("OS固有処理を呼び出し")),
            Text(_message),
          ],
        ),
      ),
    );
  }
}
