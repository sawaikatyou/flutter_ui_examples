import 'package:flutter/widgets.dart';
import 'package:flutter_ui_examples/widgets/widgets.dart';

import 'widgets_constraints.dart';

class SelectItem {
  final String name;
  final Widget widget;
  final SelectOsType type;

  SelectItem(this.name, this.widget) : type = SelectOsType.both;

  SelectItem.subApp(this.widget)
      : this.name = null,
        type = SelectOsType.both;

  SelectItem.androidOnly(this.name, this.widget) : type = SelectOsType.android;

  SelectItem.iOSOnly(this.name, this.widget) : type = SelectOsType.ios;

  String get metaName {
    if (widget is SelectApp) {
      return (widget as SelectApp).appbarTitle;
    }
    return '';
  }
}
