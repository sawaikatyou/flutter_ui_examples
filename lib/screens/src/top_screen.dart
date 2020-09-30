import 'package:flutter/material.dart';
import 'package:flutter_ui_examples/applications/globals.dart';
import 'package:flutter_ui_examples/generated/l10n.dart';
import 'package:flutter_ui_examples/screens/screens.dart';
import 'package:flutter_ui_examples/widgets/widgets.dart';

class TopScreen extends SelectApp {
  @override
  void setup(BuildContext context) {
    super.setup(context);
    var res = S.of(context);

    appbarTitle = res.top_screen_title;
    listItems = [
      SelectItem.subApp(
        SelectApp(
          appbarTitle: res.app_example_title,
          listItems: [
            SelectItem.subApp(SelectApp(
              appbarTitle: res.simple_counter,
              listItems: [
                SelectItem(res.msg_material, MaterialCounter()),
                SelectItem(res.msg_cupertino, CupertinoCounter()),
              ],
            )),
            SelectItem(res.janken_app, JankenButtonApp()),
          ],
        ),
      ),
      SelectItem.subApp(
        SelectApp(
          appbarTitle: res.dialogs_examples,
          listItems: [
            SelectItem(res.dialogs_okonly, OkOnlyDialogApp()),
            SelectItem(res.dialogs_okcancel, OkCancelDialogApp()),
            SelectItem(res.dialogs_threebutton, ThreeButtonDialogApp()),
            SelectItem(res.dialogs_selectitem, SelectItemDialogApp()),
            SelectItem(res.dialogs_circlewaiting, CircleWaitingApp()),
            SelectItem(res.dialogs_modalbottomsheet, ModalBottomSheetApp()),
          ],
        ),
      ),
      SelectItem.subApp(
        SelectApp(
          appbarTitle: res.gridviews_examples,
          listItems: [
            SelectItem(res.gridviews_2lines, SimpleGridViewApp(axis: 2)),
            SelectItem(res.gridviews_3lines, SimpleGridViewApp(axis: 3)),
            SelectItem(res.gridviews_4lines, SimpleGridViewApp(axis: 4)),
          ],
        ),
      ),
      SelectItem.subApp(
        SelectApp(
          appbarTitle: res.inputs_examples,
          listItems: [
            SelectItem(res.text_field_input, TextFieldInputApp()),
            SelectItem(res.text_field_liveinput, TextFieldLiveInputApp()),
          ],
        ),
      ),
      SelectItem.subApp(
        SelectApp(
          appbarTitle: res.layouts_examples,
          listItems: [
            SelectItem(res.layouts_toplayout, TopLayoutApp()),
            SelectItem(res.layouts_centerlayout, CenterLayoutApp()),
            SelectItem(res.layouts_bottomlayout, BottomLayoutApp()),
          ],
        ),
      ),
      SelectItem.subApp(
        SelectApp(
          appbarTitle: res.listviews_examples,
          listItems: [
            SelectItem(res.listviews_label_and_textlist, LabelAndList()),
            SelectItem(res.listviews_listtile_and_tap, ListTileAndTap()),
            SelectItem(res.listviews_simplescrolllist, SimpleScrollList()),
            SelectItem(
                res.listviews_simple_pull_to_refresh, SimplePullToRefresh())
          ],
        ),
      ),
      SelectItem.subApp(
        SelectApp(
          appbarTitle: res.platformchannel_examples,
          listItems: [
            SelectItem(res.pc_simple, SimplePluginApp()),
          ],
        ),
      ),
      SelectItem.subApp(
        SelectApp(
          appbarTitle: res.platformview_examples,
          listItems: [
            SelectItem(res.pv_text, OsTextApp()),
            SelectItem(res.pv_indicator, OsIndicatorApp()),
          ],
        ),
      ),
      SelectItem.subApp(
        SelectApp(
          appbarTitle: res.tabs_examples,
          listItems: [
            SelectItem(res.tabs_simple_tab_list, SimpleTabList()),
            SelectItem(res.tabs_appbar_fivestar, SimpleAppBarButton()),
          ],
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    globalcontext = context;
    return super.build(context);
  }
}
