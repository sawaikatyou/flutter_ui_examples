import 'package:flutter/material.dart';
import 'package:flutter_ui_examples/constraint/constraints.dart';

class BottomLayoutApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bottom Layout"),
      ),
      body: Container(
        child: Text(
          cHelloWorldText,
          style: cDefaultFontL,
        ),
        padding: cDefaultPadding,
        alignment: Alignment.bottomCenter,
      ),
    );
  }
}
