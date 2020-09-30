package com.nineeyes.jp.flutter_ui_examples.platform_view_example.plugins.osindicator;

import io.flutter.plugin.common.PluginRegistry;

/**
 * インジケータViewプラグイン　Factory登録を行う
 */
public class OsIndicatorPlugin {
    public static void registerWith(PluginRegistry.Registrar registrar) {
        registrar
                .platformViewRegistry()
                .registerViewFactory(
                        "local_plugins/activity_indicator", new OsIndicatorFactory(registrar.messenger()));
    }
}