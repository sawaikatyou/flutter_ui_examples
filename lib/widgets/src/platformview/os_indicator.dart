import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

typedef void OsIndicatorCreatedCallback(ActivityIndicatorController controller);

/// くるくる表示
class UIActivityIndicator extends StatefulWidget {
  /// コンストラクタ
  /// * hexcolor インジケータの色
  /// * onActivityIndicatorWidgetCreated 生成時コールバックメソッド
  const UIActivityIndicator({
    Key key,
    this.hexColor,
    this.onCreated,
  }) : super(key: key);

  /// OSView生成時コールバック
  final OsIndicatorCreatedCallback onCreated;

  /// インジケータ部分の色
  final String hexColor;

  @override
  State<StatefulWidget> createState() => _UIActivityIndicatorState();
}

class _UIActivityIndicatorState extends State<UIActivityIndicator> {
  @override
  Widget build(BuildContext context) {
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      return UiKitView(
        viewType: "local_plugins/activity_indicator",
        onPlatformViewCreated: _onPlatformViewCreated,
        creationParams: <String, dynamic>{
          "hexColor": widget.hexColor,
          "hidesWhenStopped": true,
        },
        creationParamsCodec: new StandardMessageCodec(),
      );
    } else if (defaultTargetPlatform == TargetPlatform.android) {
      return AndroidView(
        viewType: "local_plugins/activity_indicator",
        onPlatformViewCreated: _onPlatformViewCreated,
        creationParams: <String, dynamic>{
          "hexColor": widget.hexColor,
          "hidesWhenStopped": true,
        },
        creationParamsCodec: new StandardMessageCodec(),
      );
    }
    return Text(
        '$defaultTargetPlatform is not yet supported by the activity_indicator plugin');
  }

  /// OS側のView生成時に呼び出され、対応する ActivityIndicatorControllerを返却する
  void _onPlatformViewCreated(int id) {
    if (widget.onCreated == null) {
      return;
    }
    widget.onCreated(new ActivityIndicatorController._(id));
  }
}

/// 生成したViewに対してのアクセス用MethodChannel Viewごとに生成される
class ActivityIndicatorController {
  ActivityIndicatorController._(int id)
      : _channel = MethodChannel('local_plugins/activity_indicator_$id');

  final MethodChannel _channel;

  Future<void> start() async {
    return _channel.invokeMethod('start');
  }

  Future<void> stop() async {
    return _channel.invokeMethod('stop');
  }
}
