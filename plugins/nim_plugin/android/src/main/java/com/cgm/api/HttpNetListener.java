package com.cgm.api;

public interface HttpNetListener {
    /**
    接口请求成功
     */
    void netSuccess(String datas, String message);
    /**
     * 请求超时或者网络错误
     */
    void onNetError();
    /**
     * 请求失败
     */
    void netFail(String message);

}
