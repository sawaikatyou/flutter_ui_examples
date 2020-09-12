import 'package:flutter/material.dart';
import 'package:flutter_ui_examples/applications/globals.dart';
import 'package:flutter_ui_examples/screens/screens.dart';
import 'package:flutter_ui_examples/widgets/widgets.dart';

class TopScreen extends SelectApp {
  @override
  void setup() {
    appbarTitle = "select your app type";

    listItems = [
      ChoiceItem(
        'App Examples',
        SelectApp(
          appbarTitle: 'App Examples',
          listItems: [
            ChoiceItem(
                'Simple Counter',
                SelectApp(
                  appbarTitle: 'Simple Counter',
                  listItems: [
                    ChoiceItem('Material', MaterialCounter()),
                    ChoiceItem('Cupertino', CupertinoCounter()),
                  ],
                )),
            ChoiceItem('Janken App', JankenButtonApp()),
          ],
        ),
      ),
      ChoiceItem(
        'Dialog Examples',
        SelectApp(
          appbarTitle: 'Dialog Examples',
          listItems: [
            ChoiceItem('Ok only', OkOnlyDialogApp()),
            ChoiceItem('Ok / Cancel', OkCancelDialogApp()),
            ChoiceItem('three button', ThreeButtonDialogApp()),
            ChoiceItem('select item', SelectItemDialogApp()),
            ChoiceItem('Circle Waiting', CircleWaitingApp()),
            ChoiceItem('Modal Bottom Sheet', ModalBottomSheetApp()),
          ],
        ),
      ),
      ChoiceItem(
        'GridViews Examples',
        SelectApp(
          appbarTitle: 'GridViews Examples',
          listItems: [
            ChoiceItem('2 Line', SimpleGridViewApp(mycrossaxiscount: 2)),
            ChoiceItem('3 Line', SimpleGridViewApp(mycrossaxiscount: 3)),
            ChoiceItem('4 Line', SimpleGridViewApp(mycrossaxiscount: 4)),
          ],
        ),
      ),
      ChoiceItem(
        'Inputs Examples',
        SelectApp(
          appbarTitle: 'Inputs Examples',
          listItems: [
            ChoiceItem('Text Field Input', TextFieldInputApp()),
            ChoiceItem('Text Field LiveInput', TextFieldLiveInputApp()),
          ],
        ),
      ),
      ChoiceItem(
        'Layouts Examples',
        SelectApp(
          appbarTitle: 'Layouts Examples',
          listItems: [
            ChoiceItem('Top layout', TopLayoutApp()),
            ChoiceItem('Center Layout', CenterLayoutApp()),
            ChoiceItem('Bottom Layout', BottomLayoutApp()),
          ],
        ),
      ),
      ChoiceItem(
        'ListView Examples',
        SelectApp(
          appbarTitle: 'ListView Examples',
          listItems: [
            ChoiceItem('Label And TextList', LabelAndList()),
            ChoiceItem('ListTile And TapDemo', ListTileAndTap()),
            ChoiceItem('Simple ScrollListView', SimpleScrollList()),
            ChoiceItem('Simple Pull To Refresh', SimplePullToRefresh())
          ],
        ),
      ),
      ChoiceItem(
        'Tab Examples',
        SelectApp(
          appbarTitle: 'Tab Examples',
          listItems: [
            ChoiceItem('Simple Tab List', SimpleTabList()),
            ChoiceItem('Simple AppBar Button', SimpleAppBarButton()),
          ],
        ),
      ),
    ];

    super.setup();
  }

  @override
  Widget build(BuildContext context) {
    globalcontext = context;
    return super.build(context);
  }
}
