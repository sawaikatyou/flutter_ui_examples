import 'package:flutter/material.dart';
import 'package:flutter_ui_examples/constraints/constraints.dart';

class ListTileAndTap extends StatefulWidget {
  final String _title = 'ListTileAndTap';

  ListTileAndTap({Key key}) : super(key: key);

  @override
  ListTileAndTapState createState() => new ListTileAndTapState();
}

class ListTileAndTapState extends State<ListTileAndTap> {
  String _message;
  int _index;

  @override
  void initState() {
    super.initState();
    _index = -1;
    _message = 'please tap any no.';
  }

  void tapTile() {
    setState(() {
      _message = 'you tapped: No.$_index';
    });
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
              padding: cDefaultPaddingDbl,
              children: <Widget>[
                ListTile(
                  leading: const Icon(Icons.android),
                  title:const Text('No.1 first item'),
                  selected: _index == 1,
                  onTap: () {
                    _index = 1;
                    tapTile();
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.favorite),
                  title:const Text('No.2 second item'),
                  selected: _index == 2,
                  onTap: () {
                    _index = 2;
                    tapTile();
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.favorite_border),
                  title:const Text('No.3 third item'),
                  selected: _index == 3,
                  onTap: () {
                    _index = 3;
                    tapTile();
                  },
                ),
              ],
            ),
          ],
        ));
  }

}
