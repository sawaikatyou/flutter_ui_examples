import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'select_item.dart';
import 'widgets_constraints.dart';

// ignore: must_be_immutable
class SelectApp extends StatelessWidget {
  SelectApp({this.appbarTitle, this.listItems, this.dropdownItems});

  List<SelectItem> getChoiceItems() => listItems;

  List<SelectItem> getDropDownMenuItems() => dropdownItems;

  String getAppBarTitle() => appbarTitle;

  get myContext => _context;

  @override
  Widget build(BuildContext context) {
    _context = context;

    setup(context);

    var actionItems = isDropdownAvailable()
        ? <Widget>[
            getDropDownButton(context),
          ]
        : null;

    return Scaffold(
      appBar: AppBar(
        title: Text(getAppBarTitle()),
        actions: actionItems,
      ),
      body: Center(
          child: ListView(
        padding: EdgeInsets.all(10.0),
        children: items(context),
      )),
    );
  }

  void onTapNumber(BuildContext context, int index) {
    debugPrint("onTapNumber() tapped index=" + index.toString());
    List<SelectItem> choiceList = getChoiceItems();

    if (index < choiceList.length) {
      SelectItem item = choiceList[index];
      if (isExecutable(item)) {
        bootChild(context, choiceList[index].widget);
      } else {
        debugPrint("not supported");
      }
    }
  }

  void bootChild(BuildContext context, var target) {
    Navigator.push(
      context,
      new MaterialPageRoute<Null>(
        settings: const RouteSettings(),
        builder: (context) => target,
      ),
    );
  }

  List<Widget> items(BuildContext context) {
    List<SelectItem> choiceItems = getChoiceItems();

    List<Widget> result = [];
    int count = choiceItems.length;
    for (var i = 0; i < count; i++) {
      var item = choiceItems[i];
      bool execute = isExecutable(item);
      var label = item.metaName.isNotEmpty ? item.metaName : item.name;

      result.add(ListTile(
        title: Text(
          label,
          style: TextStyle(
              fontSize: 24.0, color: execute ? Colors.black : Colors.grey),
        ),
        onTap: () {
          _tappedNo = i;
          onTapNumber(context, _tappedNo);
        },
      ));
    }

    return result;
  }

  /// このアイテムはターゲットで実行可能か判定する
  bool isExecutable(SelectItem item) {
    bool result;

    if ((TargetPlatform.iOS == defaultTargetPlatform) &&
        (item.type == SelectOsType.both || item.type == SelectOsType.ios)) {
      result = true;
    } else if ((TargetPlatform.android == defaultTargetPlatform) &&
        (item.type == SelectOsType.both || item.type == SelectOsType.android)) {
      result = true;
    } else {
      result = false;
    }

    return result;
  }

  /// ドロップダウンメニューがいるかいらないか判定する
  bool isDropdownAvailable() {
    bool result = false;
    List ddItems = getDropDownMenuItems();
    if (ddItems != null && ddItems.length >= 1) {
      result = true;
    }

    return result;
  }

  List<Widget> getWidgetList() {
    List<SelectItem> choiceItems = getChoiceItems();
    List<Widget> result = [];
    choiceItems.forEach((SelectItem item) {
      result.add(item.widget);
    });

    return result;
  }

  List<DropdownMenuItem> getDropdownMenuItems() {
    List<SelectItem> dropdownItems = getDropDownMenuItems();
    List<DropdownMenuItem> result = [];

    dropdownItems.forEach((SelectItem item) {
      result.add(DropdownMenuItem(child: Text(item.name), value: item.name));
    });

    return result;
  }

  DropdownButton getDropDownButton(BuildContext context) {
    return DropdownButton(
      icon: Icon(Icons.more_vert),
      items: getDropdownMenuItems(),
      onChanged: onDropdownButtonSelected,
      isExpanded: false,
    );
  }

  void onDropdownButtonSelected(var value) {
    List<SelectItem> dropdownItems = getDropDownMenuItems();

    dropdownItems.forEach((SelectItem item) {
      if (value == item.name) {
        bootChild(_context, item.widget);
      }
    });
  }

  void setup(BuildContext context) {}

  BuildContext _context;
  int _tappedNo;
  String appbarTitle;
  List<SelectItem> listItems;
  List<SelectItem> dropdownItems;
}
