package com.southdgj.travelapp;
import android.os.Build;
import android.os.Bundle;

import androidx.annotation.NonNull;

import com.amap.api.location.AMapLocation;
import com.amap.api.location.AMapLocationClient;
import com.amap.api.location.AMapLocationClientOption;
import com.amap.api.location.AMapLocationListener;

import java.util.HashMap;
import java.util.Map;

import io.flutter.app.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity implements AMapLocationListener{
  private final String chanel = "cgmcomm/back/desktop";

  //返回手机桌面事件
  static final String eventBackDesktop = "backDesktop";
  static final String checkOpenPage = "checkOpenPage";
  private final String locationchanel = "locationchanel";

  private final String startLocation="startLocation";
  private MethodChannel.Result result;
  /**
   * 声明AMapLocationClient类对象
   */
  private AMapLocationClient mLocationClient = null;
  /**
   * 声明AMapLocationClientOption对象
   */
  private AMapLocationClientOption mLocationOption = null;

  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {//API>21,设置状态栏颜色透明
      getWindow().setStatusBarColor(0);
    }
    initBackTop();
    startLocation();
  }
  
  @Override
  protected void onResume() {
    super.onResume();
    GeneratedPluginRegistrant.registerWith(this);
  }

  @Override
  protected void onPause() {
    super.onPause();
  }

  //注册返回到手机桌面事件
  private void initBackTop() {
//    new MethodChannel()
    new MethodChannel(getFlutterView(), chanel).setMethodCallHandler(
            (methodCall, result) -> {
              if (methodCall.method.equals(eventBackDesktop)) {
                moveTaskToBack(false);
                result.success(true);
              }
            }
    );

  }

  private void startLocation(){
    new MethodChannel(getFlutterView(), locationchanel).setMethodCallHandler(
            (methodCall, result) -> {
              if (methodCall.method.equals(startLocation)) {
                this.result=result;
                  initLocation();
              }
            }
    );
  }


  private void initLocation() {
    //初始化定位
    mLocationClient = new AMapLocationClient(this);
    //设置定位回调监听
    mLocationClient.setLocationListener(this);
    //初始化AMapLocationClientOption对象
    mLocationOption = new AMapLocationClientOption();
    mLocationOption.setLocationMode(AMapLocationClientOption.AMapLocationMode.Hight_Accuracy);
    //获取一次定位结果：
//该方法默认为false。
    mLocationOption.setOnceLocation(true);
//获取最近3s内精度最高的一次定位结果：
//设置setOnceLocationLatest(boolean b)接口为true，启动定位时SDK会返回最近3s内精度最高的一次定位结果。如果设置其为true，setOnceLocation(boolean b)接口也会被设置为true，反之不会，默认为false。
    mLocationOption.setOnceLocationLatest(true);
    mLocationOption.setNeedAddress(true);
    AMapLocationClientOption option = new AMapLocationClientOption();
    /**
     * 设置定位场景，目前支持三种场景（签到、出行、运动，默认无场景）
     */
    if (null != mLocationClient) {
      mLocationClient.setLocationOption(option);
      //设置场景模式后最好调用一次stop，再调用start以保证场景模式生效
      mLocationClient.stopLocation();
      mLocationClient.startLocation();
    }
  }

  @Override
  public void onLocationChanged(AMapLocation aMapLocation) {
//    LocationUtils.latitude = aMapLocation.getLatitude();//获取纬度
//    LocationUtils.longitude = aMapLocation.getLongitude();//获取经度
//    aMapLocation.getAccuracy();//获取精度信息
//    LocationUtils.address = aMapLocation.getAddress();//地址，如果option中设置isNeedAddress为false，则没有此结果，网络定位结果中会有地址信息，GPS定位不返回地址信息。
//    LocationUtils.country = aMapLocation.getCountry();//国家信息
//    LocationUtils.province = aMapLocation.getProvince();//省信息
//    LocationUtils.city = aMapLocation.getCity();//城市信息
//    LocationUtils.district = aMapLocation.getDistrict();//城区信息
//    LocationUtils.street = aMapLocation.getStreet();//街道信息
//    LocationUtils.code = aMapLocation.getCityCode();
    Map<String,Object> loactionMap=new HashMap<>();
    loactionMap.put("latitude",aMapLocation.getLatitude());
    loactionMap.put("longitude",aMapLocation.getLongitude());
    loactionMap.put("address",aMapLocation.getAddress());
    loactionMap.put("country",aMapLocation.getCountry());
    loactionMap.put("province",aMapLocation.getProvince());
    loactionMap.put("city",aMapLocation.getCity());
    loactionMap.put("district",aMapLocation.getDistrict());
    loactionMap.put("street",aMapLocation.getStreet());
    loactionMap.put("code",aMapLocation.getCityCode());
    if (result!=null){
      result.success(loactionMap);
    }
  }
}