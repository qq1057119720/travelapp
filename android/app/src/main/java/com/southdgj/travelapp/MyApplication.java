package com.southdgj.travelapp;

import android.app.Activity;
import android.content.Context;
import android.util.Log;
import io.flutter.view.FlutterMain;
import androidx.multidex.MultiDex;
import androidx.multidex.MultiDexApplication;
import com.cgm.nim.NimGlobal;

/**
 * @author lgx
 * @date 2020/10/28.
 * description：
 */

public class MyApplication extends MultiDexApplication {
    private Activity mCurrentActivity = null;
    public MyApplication() {
    }
    @Override
    public void onCreate() {
        super.onCreate();
        FlutterMain.startInitialization(this);
        Log.v("NimPlugin", getPackageName());
        NimGlobal.getInstance(this).initNim(MainActivity.class);
    }

    public Activity getCurrentActivity() {
        return this.mCurrentActivity;
    }

    public void setCurrentActivity(Activity mCurrentActivity) {
        this.mCurrentActivity = mCurrentActivity;
    }
    @Override
    protected void attachBaseContext(Context base) {
        super.attachBaseContext(base);
        MultiDex.install(this);
    }

}