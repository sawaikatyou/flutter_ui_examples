import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_ui_examples/widgets/widgets.dart';

/// OsIndicator を表示
class OsIndicatorApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _OsIndicatorAppState();
}

class _OsIndicatorAppState extends State<OsIndicatorApp> {
  ActivityIndicatorController controller;

  bool play = false;

  @override
  void initState() {
    play = false;
    super.initState();
  }

  void _onActivityIndicatorControllerCreated(
      ActivityIndicatorController _controller) {
    controller = _controller;
  }

  @override
  Widget build(BuildContext context) {
    // 画面サイズ取得
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Indicator Example'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.play_arrow),
              onPressed: () {
                if (controller != null) {
                  setState(() {
                    controller.start();
                    play = true;
                  });
                }
              },
            ),
            IconButton(
              icon: Icon(Icons.stop),
              onPressed: () {
                if (controller != null) {
                  setState(() {
                    controller.stop();
                    play = false;
                  });
                }
              },
            )
          ],
        ),
        body: Column(
          children: <Widget>[
            Text("赤色指定のインジケータを表示します\n▶︎：再生　■：停止",
                style: TextStyle(fontSize: 16.0)),
            Padding(padding: EdgeInsets.all(10)),
            play
                ? Text("FlutterSDKのIndicator部品(Material design)")
                : Padding(
                    padding: EdgeInsets.all(1),
                  ),
            play
                ? SizedBox(
                    width: 30,
                    height: 30,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(
                          Color.fromARGB(255, 255, 0, 0)),
                    ))
                : SizedBox(
                    width: 30,
                    height: 30,
                  ),
            Padding(padding: EdgeInsets.all(10)),
            play
                ? Text("FlutterSDKのIndicator部品(Cupertino design)")
                : Padding(
                    padding: EdgeInsets.all(1),
                  ),
            play
                ? CupertinoActivityIndicator()
                : Padding(
                    padding: EdgeInsets.all(10),
                  ),
            Padding(padding: EdgeInsets.all(10)),
            play
                ? Text("OS標準のIndicator部品(PlatformView機能を使用)")
                : Padding(
                    padding: EdgeInsets.all(1),
                  ),
            SizedBox(
              width: size.width,
              height: 50,
              child: UIActivityIndicator(
                hexColor: "FF0000",
                onCreated: _onActivityIndicatorControllerCreated,
              ),
            )
          ],
        ));
  }
}
