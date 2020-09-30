import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

typedef void TextViewCreatedCallback(OsTextViewController controller);

class OsTextView extends StatefulWidget {
  const OsTextView({
    Key key,
    this.onTextViewCreated,
  }) : super(key: key);

  final TextViewCreatedCallback onTextViewCreated;

  @override
  State<StatefulWidget> createState() => _OsTextViewState();
}

class _OsTextViewState extends State<OsTextView> {
  @override
  Widget build(BuildContext context) {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return AndroidView(
        viewType: 'local_plugins/nativetextview',
        onPlatformViewCreated: _onPlatformViewCreated,
      );
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      return UiKitView(
        viewType: 'local_plugins/nativetextview',
        onPlatformViewCreated: _onPlatformViewCreated,
      );
    }
    return Text(
        '$defaultTargetPlatform is not yet supported by the text_view plugin');
  }

  void _onPlatformViewCreated(int id) {
    if (widget.onTextViewCreated == null) {
      return;
    }
    widget.onTextViewCreated(new OsTextViewController._(id));
  }
}

class OsTextViewController {
  OsTextViewController._(int id)
      : _channel = new MethodChannel('local_plugins/nativetextview_$id');

  final MethodChannel _channel;

  Future<void> setText(String text) async {
    assert(text != null);
    return _channel.invokeMethod('setText', text);
  }

  Future<void> setTextSize(String value) async {
    return _channel.invokeMethod('setTextSize', value);
  }
}
