import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_ui_examples/widgets/list_base.dart';
import 'package:flutter_ui_examples/screens/material/count.dart';
import 'package:flutter_ui_examples/screens/cupertino/count.dart';

import 'screens/cupertino/count.dart';
import 'screens/material/count.dart';
import 'widgets/list_base.dart';

dynamic globalcontext;

void main() => runApp(MaterialApp(title: "hoge", home: MySelectedApp()));

class MySelectedApp extends SelectApp {
  @override
  void setup() {
    appbarTitle = "select your app type";

    listItems = [
//      ChoiceItem("Material Design", MyMaterialApp()),
      ChoiceItem(
          'Material Design',
          SelectApp(
            appbarTitle: 'Material Design',
            listItems: [
              ChoiceItem('Counter', MyMaterialApp()),
            ],
          )),
      ChoiceItem(
        'Cupertino Design',
        SelectApp(
          appbarTitle: 'Cupertino Design',
          listItems: [
            ChoiceItem('Counter', MyCupertinoApp()),
            ChoiceItem('Dialog', MyCupertinoApp()),
          ],
        ),
      )
    ];

    super.setup();
  }

  @override
  Widget build(BuildContext context) {
    globalcontext = context;
    return super.build(context);
  }
}
