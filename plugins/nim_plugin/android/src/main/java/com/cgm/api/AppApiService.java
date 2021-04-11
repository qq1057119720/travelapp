package com.cgm.api;

import java.util.Map;

import io.reactivex.Observable;
import okhttp3.MultipartBody;
import retrofit2.http.FieldMap;
import retrofit2.http.FormUrlEncoded;
import retrofit2.http.GET;
import retrofit2.http.HeaderMap;
import retrofit2.http.Multipart;
import retrofit2.http.POST;
import retrofit2.http.Part;
import retrofit2.http.Path;
import retrofit2.http.QueryMap;

/**
 * Created by liguoxian on 2017/9/14.
 */

public interface AppApiService {
    /**
     * 通用网络请求
     * @param serviceName 接口名
     * @param map 参数
     * @return
     */
    @FormUrlEncoded
    @POST("{oneName}/{serviceName}")
    Observable<RequestData> netService(
            @HeaderMap Map<String, String> headers,
            @Path("oneName") String oneName,
            @Path("serviceName") String serviceName,
            @FieldMap Map<String, Object> map);
    @GET("{oneName}/{serviceName}")
    Observable<RequestData> getNetService(
            @HeaderMap Map<String, String> headers,
            @Path("oneName") String oneName,
            @Path("serviceName") String serviceName,
            @QueryMap Map<String, Object> map);
    @FormUrlEncoded
    @POST("{oneName}/{serviceName}")
    Observable<RequestData> netService(
            @Path("oneName") String oneName,
            @Path("serviceName") String serviceName,
            @FieldMap Map<String, Object> map);
    @FormUrlEncoded
    @POST("{oneName}/{serviceName}")
    Observable<String> stringService(
            @Path("oneName") String oneName,
            @Path("serviceName") String serviceName,
            @FieldMap Map<String, Object> map);
    @Multipart
    @POST("member/modAvatar")
    Observable<RequestData> postFileService(
            @HeaderMap Map<String, String> headers,
            @Part MultipartBody.Part file);


//    @Multipart
//    @POST("manager/uploadfiles")
//    Observable<RequestData> postFileService(
//            @Part MultipartBody.Part file);


}
