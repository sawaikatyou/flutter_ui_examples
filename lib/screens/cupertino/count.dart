import 'package:flutter_ui_examples/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class MyCupertinoApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
