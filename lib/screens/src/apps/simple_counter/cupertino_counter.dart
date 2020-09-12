import 'package:flutter/material.dart';
import 'package:flutter_ui_examples/applications/globals.dart';
import 'package:flutter/cupertino.dart';

class CupertinoCounter extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Flutter Demo',
      home: CupertinoHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class CupertinoHomePage extends StatefulWidget {
  CupertinoHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _CupertinoHomePageState createState() => _CupertinoHomePageState();
}

class _CupertinoHomePageState extends State<CupertinoHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: GestureDetector(
          child: Icon(CupertinoIcons.back),
          onTap: () => Navigator.pop(globalcontext),
        ),
        middle: Text("widget.title"),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
            ),
            CupertinoButton(
              onPressed: _incrementCounter,
              color: Colors.blue,
//              borderRadius: new BorderRadius.circular(30.0),
              child: Text("add"),
//              child:Icon(CupertinoIcons.add)
            )
          ],
        ),
      ),
    );
  }
}
