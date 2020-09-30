import 'package:flutter/material.dart';
import 'package:flutter_ui_examples/constraints/constraints.dart';

class SimpleAppBarButton extends StatefulWidget {
  final String _title = 'SimpleTabList';

  SimpleAppBarButton({Key key}) : super(key: key);

  @override
  _SimpleAppBarButtonState createState() => new _SimpleAppBarButtonState();
}

class _SimpleAppBarButtonState extends State<SimpleAppBarButton> {
  String _current_star_message;
  int _currentstar;

  @override
  void initState() {
    super.initState();
    _currentstar = 0;
    _updateBottomLabel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget._title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            tooltip: 'increment',
            onPressed: onPlusIconPressed,
          ),
          IconButton(
            icon: Icon(Icons.remove),
            tooltip: 'decrement',
            onPressed: onMinusIconPressed,
          ),
        ],
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(30.0),
            child: Center(
              child: Text(_current_star_message,
                  style: TextStyle(fontSize: 22.0, color: Colors.white)),
            )),
      ),
      body: Center(
        child: Text("please select appbar button", style:cDefaultFont),
      ),
    );
  }

  void onPlusIconPressed() {
    debugPrint("onPlusIconPressed() tap");
    _currentstar++;
    _updateBottomLabel();
  }

  void onMinusIconPressed() {
    debugPrint("onMinusIconPressed() tap");
    _currentstar--;
    _updateBottomLabel();
  }

  void _updateBottomLabel() {

    /* 最大値5 or 最低値0以下になっている場合はならす */
    _currentstar = _currentstar < 0 ? 0 : _currentstar > 5 ? 5 : _currentstar;
    setState(() {
      _current_star_message =
          "★★★★★☆☆☆☆☆".substring(5 - _currentstar, 5 - _currentstar + 5);
      debugPrint("_updateBottomLabel() _current_star_message=$_current_star_message");

    });
  }
}
