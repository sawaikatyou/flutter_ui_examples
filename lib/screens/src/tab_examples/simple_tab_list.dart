import 'package:flutter/material.dart';
import 'package:flutter_ui_examples/constraint/constraints.dart';

class SimpleTabList extends StatefulWidget {
  final String _title = 'SimpleTabList';

  SimpleTabList({Key key}) : super(key: key);

  @override
  _SimpleTabListState createState() => new _SimpleTabListState();
}

class _SimpleTabListState extends State<SimpleTabList>
    with SingleTickerProviderStateMixin {
  final List<Tab> tabs = <Tab>[
    Tab(text: 'one'),
    Tab(text: 'two'),
    Tab(text: 'three'),
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(
      length: tabs.length,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget._title),
          bottom: TabBar(
            controller: _tabController,
            tabs: tabs,
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: tabs.map(
            (Tab tab) {
              return createTab(tab);
            },
          ).toList(),
        ));
  }

  Widget createTab(Tab tab) {
    Color current_color;

    /* タブ画面の背景色を設定 */
    switch (tab.text) {
      case "one":
        current_color = Colors.white;
        break;
      case "two":
        current_color = Colors.lightBlue;
        break;
      case "three":
        current_color = Colors.green;
        break;
      default:
        /* その他。念の為灰色としておく */
        current_color = Colors.grey;
        break;
    }

    return Container(
      decoration: new BoxDecoration(color: current_color),
      child: new Center(
        child: Text('This is "' + tab.text + '" Tab.', style: cDefaultFontL),
      ),
    );

  }
}
