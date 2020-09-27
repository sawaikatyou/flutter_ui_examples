package com.nineeyes.jp.flutter_ui_examples.platform_view_example.plugins.simple;

import android.content.Context;
import android.content.Intent;

import io.flutter.Log;
import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.PluginRegistry;

import com.nineeyes.jp.flutter_ui_examples.HelloWorldActivity;

/**
 * Native連携プラグインの基本形
 */
public class SimplePlatformPlugin implements MethodChannel.MethodCallHandler, EventChannel.StreamHandler, PluginRegistry.ActivityResultListener {

    private static final String METHOD_CHANNEL = "local_plugins/SimplePlatformPlugin/method";
    private static final String EVENT_CHANNEL = "local_plugins/SimplePlatformPlugin/event";

    Context mContext = null;
    EventChannel.EventSink mEventSink = null;

    public SimplePlatformPlugin(Context context) {
        mContext = context;
    }

    public static void registerWith(PluginRegistry.Registrar registrar) {
        SimplePlatformPlugin my_instance = new SimplePlatformPlugin((Context) registrar.activity());

        // MethodChannel is 'Flutter' -> 'OSNative'
        MethodChannel channel = new MethodChannel(registrar.messenger(), METHOD_CHANNEL);
        channel.setMethodCallHandler(my_instance);

        // EventChannel is 'OSNative' -> 'Flutter'
        EventChannel eventchannel = new EventChannel(registrar.messenger(), EVENT_CHANNEL);
        eventchannel.setStreamHandler(my_instance);

        registrar.addActivityResultListener(my_instance);

    }

    @Override
    public void onMethodCall(MethodCall call, MethodChannel.Result result) {
        String success_response = "FlutterからJavaプログラムのメソッドがコールされました";
        Log.d("SimplePlatformPlugin", call.toString());
        if (call.method.equals("helloWorld")) {
            result.success(success_response);
            if (mEventSink != null) {
                mEventSink.success(success_response);
            }

        } else if (call.method.equals("switchView")) {
            Intent intent = new Intent(mContext, HelloWorldActivity.class);
            mContext.startActivity(intent);
        } else {
            result.notImplemented();
        }

    }

    @Override
    public void onListen(Object arguments, EventChannel.EventSink events) {
        mEventSink = events;
    }

    @Override
    public void onCancel(Object arguments) {

    }

    @Override
    public boolean onActivityResult(int requestCode, int resultCode, Intent data) {
        return false;
    }
}
