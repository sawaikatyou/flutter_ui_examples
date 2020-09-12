import 'package:flutter/material.dart';
import 'package:flutter_ui_examples/constraint/constraints.dart';

class CenterLayoutApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Center Layout"),
        ),
        body: Center(child: Text(cHelloWorldText, style: cDefaultFontL)));
  }
}
