package com.active_package.active_package_example;


import static com.active_package.active_package.ActivePackagePlugin.getActivePackageName;


import android.os.Bundle;

import java.util.Objects;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.plugin.common.MethodChannel;
/**
 * MainActivity
 */
public class MainActivity extends FlutterActivity {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private MethodChannel channel;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        channel = new MethodChannel(Objects.requireNonNull(getFlutterEngine()).getDartExecutor().getBinaryMessenger(), "active_package");
        channel.setMethodCallHandler  ((call, result) -> {
            if (call.method.equals("getActivePackageName")) {

                String packageName = getActivePackageName(getContext());

                if (!packageName.isEmpty()) {
                    result.success(packageName);
                } else {
                    result.error("UNAVAILABLE", "Couldn't get the active package name of the app running on foreground", null);
                }
            } else {
                result.notImplemented();
            }
        });
    }


    @Override
    public void onDestroy () {
        super.onDestroy();
        channel.setMethodCallHandler(null);
    }




}
