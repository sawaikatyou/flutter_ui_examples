package com.nineeyes.jp.flutter_ui_examples.platform_view_example.plugins.ostext;

import io.flutter.plugin.common.PluginRegistry;

/**
 * OSNative の TextViewプラグイン　Factory登録を行う
 */
public class OsTextViewPlugin {
    public static void registerWith(PluginRegistry.Registrar registrar) {
        registrar
                .platformViewRegistry()
                .registerViewFactory(
                        "local_plugins/nativetextview", new OsTextViewFactory(registrar.messenger()));
    }
}