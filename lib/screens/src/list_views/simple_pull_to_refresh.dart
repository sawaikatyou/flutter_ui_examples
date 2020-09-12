import 'dart:io';

import 'package:flutter/material.dart';

class SimplePullToRefresh extends StatefulWidget {
  final String _title = 'Pull To Refresh';

  SimplePullToRefresh({Key key}) : super(key: key);

  @override
  _SimplePullToRefreshState createState() => new _SimplePullToRefreshState();
}

class _SimplePullToRefreshState extends State<SimplePullToRefresh> {
  static const int _itemMax = 20;
  int _itemcount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget._title),
      ),
      body: RefreshIndicator(
          onRefresh: _onRefresh,
          child: new Scrollbar(
              child: new ListView(
            shrinkWrap: true,
            /* shrinkwrap */
            children: items(context),
          ))),
    );
  }

  Future<void> _onRefresh() async {
    debugPrint("_onRefresh() execute!");
    await Future<void>.delayed(const Duration(seconds: 3));
    debugPrint("_onRefresh() delay end");
    setState(() {
      debugPrint("_onRefresh() -> setState()");
      _itemcount += _itemMax;
    });
  }

  List<Widget> items(BuildContext context) {
    List<Widget> result = [];
    int count = _itemcount + _itemMax;

    for (var i = _itemcount; i < count; i++) {
      result.add(
        new ListTile(
          title: new Text("Item$i"),
        ),
      );
    }

    return result;
  }
}
