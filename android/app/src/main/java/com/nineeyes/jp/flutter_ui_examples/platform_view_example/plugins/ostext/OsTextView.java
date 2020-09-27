package com.nineeyes.jp.flutter_ui_examples.platform_view_example.plugins.ostext;

import android.content.Context;
import android.view.View;
import android.widget.TextView;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;

import static io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import static io.flutter.plugin.common.MethodChannel.Result;

import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.platform.PlatformView;

/**
 * OSNative の TextViewプラグイン　View本体クラス
 */
public class OsTextView implements PlatformView, MethodCallHandler {
    private final TextView textView;
    private final MethodChannel methodChannel;

    OsTextView(Context context, BinaryMessenger messenger, int id) {
        textView = new TextView(context);
        methodChannel = new MethodChannel(messenger, "local_plugins/nativetextview_" + id);
        methodChannel.setMethodCallHandler(this);
    }

    @Override
    public View getView() {
        return textView;
    }

    @Override
    public void onMethodCall(MethodCall methodCall, Result result) {
        switch (methodCall.method) {
            case "setText":
                setText(methodCall, result);
                break;
            case "setTextSize":
                setTextSize(methodCall, result);
                break;
            default:
                result.notImplemented();
        }

    }

    private void setText(MethodCall methodCall, Result result) {
        String text = (String) methodCall.arguments;
        textView.setText(text);
        result.success(null);
    }

    private void setTextSize(MethodCall methodCall, Result result) {
        textView.setTextSize(Float.parseFloat((String) methodCall.arguments));
        result.success(null);
    }

    @Override
    public void dispose() {
    }
}