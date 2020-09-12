import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum SelectItemType {
  android,
  ios,
  both,
}

class ChoiceItem {
  final String name;
  final Widget widget;
  final SelectItemType type;

  ChoiceItem(this.name, this.widget) : type = SelectItemType.both ;

  ChoiceItem.androidOnly(this.name, this.widget)
      : type = SelectItemType.android;

  ChoiceItem.iOSOnly(this.name, this.widget) : type = SelectItemType.ios;
}

class SelectApp extends StatelessWidget {
  BuildContext _context;
  int _tappedNo = -1;
  String appbarTitle;
  List<ChoiceItem> listItems = [];
  List<ChoiceItem> dropdownItems = [];

  SelectApp({this.appbarTitle, this.listItems, this.dropdownItems});

  List<ChoiceItem> getChoiceItems() {
    return listItems;
  }

  List<ChoiceItem> getDropDownMenuItems() {
    return dropdownItems;
  }

  String getAppBarTitle() {
    return appbarTitle;
  }

  get myContext => _context;

  @override
  Widget build(BuildContext context) {
    _context = context;

    setup();

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
    List<ChoiceItem> choiceList = getChoiceItems();

    if (index < choiceList.length) {
      ChoiceItem item = choiceList[index];
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
    List<ChoiceItem> choiceItems = getChoiceItems();

    List<Widget> result = [];
    int count = choiceItems.length;
    for (var i = 0; i < count; i++) {
      var item = choiceItems[i];
      bool execute = isExecutable(item);

      result.add(ListTile(
        title: Text(
          item.name,
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
  bool isExecutable(ChoiceItem item) {
    bool result;

    if ((TargetPlatform.iOS == defaultTargetPlatform) &&
        (item.type == SelectItemType.both || item.type == SelectItemType.ios)) {
      result = true;
    } else if ((TargetPlatform.android == defaultTargetPlatform) &&
        (item.type == SelectItemType.both ||
            item.type == SelectItemType.android)) {
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
    List<ChoiceItem> choiceItems = getChoiceItems();
    List<Widget> result = [];
    choiceItems.forEach((ChoiceItem item) {
      result.add(item.widget);
    });

    return result;
  }

  List<DropdownMenuItem> getDropdownMenuItems() {
    List<ChoiceItem> dropdownItems = getDropDownMenuItems();
    List<DropdownMenuItem> result = [];

    dropdownItems.forEach((ChoiceItem item) {
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
    List<ChoiceItem> dropdownItems = getDropDownMenuItems();

    dropdownItems.forEach((ChoiceItem item) {
      if (value == item.name) {
        bootChild(_context, item.widget);
      }
    });
  }

  void setup() {}
}
