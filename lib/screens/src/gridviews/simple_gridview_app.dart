import 'package:flutter/material.dart';
import 'package:flutter_ui_examples/constraints/constraints.dart';

class SimpleGridViewApp extends StatefulWidget {
  final String _title = 'SimpleGrid';

  int axis;

  SimpleGridViewApp({Key key, this.axis}) : super(key: key);

  @override
  SimpleGridViewState createState() => new SimpleGridViewState();
}

class SimpleGridViewState extends State<SimpleGridViewApp> {
  String _message;

  @override
  void initState() {
    super.initState();
  }

  var  _gridData = <Widget> [
    Container(
      color: Colors.red,
      child:
        Text('1', style:cDefaultFont)
    ),
    Container(
        color: Colors.white,
        child:
        Text('2', style:cDefaultFont)
    ),
    Container(
        color: Colors.red,
        child:
        Text('3', style:cDefaultFont)
    ),
    Container(
        color: Colors.white,
        child:
        Text('4', style:cDefaultFont)
    ),
    Container(
        color: Colors.red,
        child:
        Text('5', style:cDefaultFont)
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget._title),
        ),
        body: GridView.count(crossAxisCount: widget.axis,
        mainAxisSpacing: 10.0,
        crossAxisSpacing:10.0,
        padding: cDefaultPadding,
        children: _gridData,));
  }
}
