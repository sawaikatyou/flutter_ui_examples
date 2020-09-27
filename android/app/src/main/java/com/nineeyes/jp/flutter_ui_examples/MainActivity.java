package com.nineeyes.jp.flutter_ui_examples;

import android.content.Intent;

import androidx.annotation.NonNull;

import com.nineeyes.jp.flutter_ui_examples.platform_view_example.plugins.osindicator.OsIndicatorPlugin;
import com.nineeyes.jp.flutter_ui_examples.platform_view_example.plugins.ostext.OsTextViewPlugin;
import com.nineeyes.jp.flutter_ui_examples.platform_view_example.plugins.simple.SimplePlatformPlugin;

import io.flutter.Log;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.embedding.engine.plugins.shim.ShimPluginRegistry;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.PluginRegistry;

public class MainActivity extends FlutterActivity {

    public static final String TAG = "MainActivity";
    private static final String CHANNEL = "samples.flutter.io/platform_view";
    private static final String METHOD_SWITCH_VIEW = "switchView";

    private MethodChannel.Result result;

    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        Log.i(TAG, "configureFlutterEngine() context=" + getActivity().getBaseContext());

        ShimPluginRegistry shimPluginRegistry = new ShimPluginRegistry(flutterEngine);
        SimplePlatformPlugin.registerWith(shimPluginRegistry.registrarFor("local_plugins/simpleplugin"));
        OsTextViewPlugin.registerWith(shimPluginRegistry.registrarFor("local_plugins/nativetextview"));
        OsIndicatorPlugin.registerWith(shimPluginRegistry.registrarFor("local_plugins/activity_indicator"));
        // このように直接定義でもよい
        PluginRegistry.Registrar reg = shimPluginRegistry.registrarFor("samples.flutter.io");
        new MethodChannel(reg.messenger(), CHANNEL).setMethodCallHandler(
                new MethodChannel.MethodCallHandler() {
                    @Override
                    public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
                        Log.i(TAG, "MainActivity.onMethodCall()");
                        MainActivity.this.result = result;
                        if (methodCall.method.equals(METHOD_SWITCH_VIEW)) {
                            onLaunchFullScreen();
                        } else {
                            result.notImplemented();
                        }
                    }
                }
        );
    }


    private void onLaunchFullScreen() {
        Intent fullScreenIntent = new Intent(this, HelloWorldActivity.class);
        startActivityForResult(fullScreenIntent, 0);
    }
}
