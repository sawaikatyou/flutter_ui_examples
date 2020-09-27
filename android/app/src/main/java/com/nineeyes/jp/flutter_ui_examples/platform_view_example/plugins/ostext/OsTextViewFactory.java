package com.nineeyes.jp.flutter_ui_examples.platform_view_example.plugins.ostext;

import android.content.Context;

import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.StandardMessageCodec;
import io.flutter.plugin.platform.PlatformView;
import io.flutter.plugin.platform.PlatformViewFactory;

/**
 * OSNative の TextViewプラグイン　OsTextView 用のFactoryクラス
 */
public class OsTextViewFactory extends PlatformViewFactory {
    private final BinaryMessenger messenger;

    public OsTextViewFactory(BinaryMessenger messenger) {
        super(StandardMessageCodec.INSTANCE);
        this.messenger = messenger;
    }

    @Override
    public PlatformView create(Context context, int id, Object o) {
        return new OsTextView(context, messenger, id);
    }
}