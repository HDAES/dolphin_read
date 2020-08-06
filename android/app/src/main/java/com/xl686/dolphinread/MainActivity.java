package com.xl686.dolphinread;

import android.os.Bundle;

import androidx.annotation.NonNull;

import com.mob.MobSDK;

import cn.smssdk.flutter.MobsmsPlugin;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine);
    }
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        // 注册SMSSDK Flutter插件
        // MobsmsPlugin.registerWith(registrarFor(MobsmsPlugin.CHANNEL));
        // 初始化SMSSDK
        MobSDK.init(this, "3047524ca355f", "0b23d59c64c0d40f23eb7c01f047e16e");
    }
    @Override
    protected void onDestroy() {
        super.onDestroy();
        // 执行回收操作
        MobsmsPlugin.recycle();
    }
}

