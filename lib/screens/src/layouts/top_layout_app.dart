import 'package:flutter/material.dart';
import 'package:flutter_ui_examples/constraint/constraints.dart';

class TopLayoutApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Top Layout"),
      ),
      body: Text(cHelloWorldText, style: cDefaultFontL),
    );
  }
}
