import 'package:flutter/material.dart';
import 'package:flutter_ui_examples/constraints/constraints.dart';

class LabelAndList extends StatefulWidget {
  final String _title = 'LabelAndList';

  LabelAndList({Key key}) : super(key: key);

  @override
  LabelAndListState createState() => new LabelAndListState();
}

class LabelAndListState extends State<LabelAndList> {
  String _message;

  @override
  void initState() {
    super.initState();
    _message = "ok.";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget._title),
        ),
        body: Column(
          children: <Widget>[
            Text(
              _message,
              style: cDefaultFontL,
            ),
            ListView(
              shrinkWrap: true,
              padding: EdgeInsets.all(20.0),
              children: <Widget>[
                Text('First Item', style: cDefaultFont),
                Text('Second Item', style: cDefaultFont),
                Text('Third Item', style: cDefaultFont),
              ],
            ),
          ],
        ));
  }
}
