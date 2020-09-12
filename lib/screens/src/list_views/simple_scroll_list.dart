import 'package:flutter/material.dart';
import 'package:flutter_ui_examples/constraint/constraints.dart';

class SimpleScrollList extends StatefulWidget {
  final String _title = 'ScrollList';

  SimpleScrollList({Key key}) : super(key: key);

  @override
  _SimpleScrollListState createState() => new _SimpleScrollListState();
}

class _SimpleScrollListState extends State<SimpleScrollList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget._title),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                color: Colors.blue,
                height: 120.0,
                child: const Center(child: Text('One', style: cDefaultFontL)),
              ),
              Container(
                color: Colors.grey,
                height: 120.0,
                child: const Center(child: Text('Two', style: cDefaultFontL)),
              ),
              Container(
                color: Colors.blue,
                height: 120.0,
                child: const Center(child: Text('Three', style: cDefaultFontL)),
              ),
              Container(
                color: Colors.grey,
                height: 120.0,
                child: const Center(child: Text('Four', style: cDefaultFontL)),
              ),
              Container(
                color: Colors.blue,
                height: 120.0,
                child: const Center(child: Text('Five', style: cDefaultFontL)),
              ),
              Container(
                color: Colors.grey,
                height: 120.0,
                child: const Center(child: Text('Six', style: cDefaultFontL)),
              ),
            ]),
      ),
    );
  }
}
