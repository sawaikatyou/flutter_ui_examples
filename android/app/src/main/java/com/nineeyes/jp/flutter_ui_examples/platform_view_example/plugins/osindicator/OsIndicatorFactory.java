package com.nineeyes.jp.flutter_ui_examples.platform_view_example.plugins.osindicator;

import android.content.Context;

import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.StandardMessageCodec;
import io.flutter.plugin.platform.PlatformView;
import io.flutter.plugin.platform.PlatformViewFactory;

/**
 * インジケータViewプラグイン　OsIndicatorView 用のFactoryクラス
 */
public class OsIndicatorFactory extends PlatformViewFactory {
    private final BinaryMessenger messenger;

    public OsIndicatorFactory(BinaryMessenger messenger) {
        super(StandardMessageCodec.INSTANCE);
        this.messenger = messenger;
    }

    @Override
    public PlatformView create(Context context, int id, Object o) {
        return new OsIndicatorView(context, messenger, id, o);
    }
}