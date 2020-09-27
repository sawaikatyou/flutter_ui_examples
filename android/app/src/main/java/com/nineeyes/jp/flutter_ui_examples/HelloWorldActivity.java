package com.nineeyes.jp.flutter_ui_examples;

import android.app.Activity;
import android.os.Bundle;

import androidx.annotation.Nullable;

import com.nineeyes.jp.flutter_ui_examples.R;

/**
 * Helloworldを表示するだけの単純なActivity
 * Flutter画面から非Flutterへ遷移できることを確認するために使用する
 */
public class HelloWorldActivity extends Activity {

    @Override
    public void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.helloworldactivity_main);
    }
}
