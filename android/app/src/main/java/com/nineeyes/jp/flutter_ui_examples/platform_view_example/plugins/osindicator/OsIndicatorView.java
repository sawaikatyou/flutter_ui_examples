package com.nineeyes.jp.flutter_ui_examples.platform_view_example.plugins.osindicator;

import android.content.Context;
import android.graphics.Color;
import android.graphics.PorterDuff;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ProgressBar;

import java.util.HashMap;

import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.platform.PlatformView;

import static io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import static io.flutter.plugin.common.MethodChannel.Result;

import com.nineeyes.jp.flutter_ui_examples.R;

/**
 * インジケータViewプラグイン　View本体クラス
 */
public class OsIndicatorView implements PlatformView, MethodCallHandler {
    private final MethodChannel methodChannel;
    ViewGroup mParentViewGroup;
    ProgressBar mProgressBar;

    OsIndicatorView(Context context, BinaryMessenger messenger, int id, Object o) {

        HashMap<String, Object> map = (HashMap<String, Object>) o;

        LayoutInflater inflater = (LayoutInflater) context.getSystemService(Context.LAYOUT_INFLATER_SERVICE);

        mParentViewGroup = (ViewGroup) inflater.inflate(R.layout.nativeindicator, null);
        mProgressBar = (ProgressBar) mParentViewGroup.findViewById(R.id.ProgressBarBody);
        mProgressBar.getProgressDrawable().setColorFilter(Color.BLUE, PorterDuff.Mode.SRC_IN);

        methodChannel = new MethodChannel(messenger, "local_plugins/activity_indicator_" + id);
        methodChannel.setMethodCallHandler(this);
    }

    @Override
    public View getView() {
        return mParentViewGroup;
    }

    @Override
    public void onMethodCall(MethodCall methodCall, Result result) {
        switch (methodCall.method) {
            case "start":
                mProgressBar.setVisibility(View.VISIBLE);
                break;
            case "stop":
                mProgressBar.setVisibility(View.INVISIBLE);
                break;
            default:
                result.notImplemented();
        }

    }

    @Override
    public void dispose() {
    }
}