package com.cgm.api;

import android.content.Context;
import android.util.Log;

import com.alibaba.fastjson.JSONObject;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.TimeUnit;

import io.reactivex.Observable;
import io.reactivex.Observer;
import io.reactivex.android.schedulers.AndroidSchedulers;
import io.reactivex.disposables.Disposable;
import io.reactivex.schedulers.Schedulers;
import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.RequestBody;
import retrofit2.HttpException;
import retrofit2.Retrofit;
import retrofit2.Retrofit.Builder;
import retrofit2.adapter.rxjava2.RxJava2CallAdapterFactory;
import retrofit2.converter.fastjson.FastJsonConverterFactory;

public class HttpProxy {
//    public static final String IP_URL = "http:snsnnn.cn//loopworld.jungg.club/";
    protected  String IP_URL = "http://snsnnn.cn/";
    private static final int TIME_OUT = 120;
    private static HttpProxy instance = null;
    private AppApiService apiService;
    private Context context;
    private Retrofit retrofit;
    public static final MediaType JSON = MediaType.parse("application/json;charset=UTF-8");

    public HttpProxy(Context context) {
        this.context = context;
        OkHttpClient client = new OkHttpClient.Builder().connectTimeout(TIME_OUT, TimeUnit.SECONDS).readTimeout(TIME_OUT, TimeUnit.SECONDS).writeTimeout(TIME_OUT, TimeUnit.SECONDS).build();
        this.retrofit = new Builder().baseUrl(IP_URL).client(client).addConverterFactory(FastJsonConverterFactory.create()).addCallAdapterFactory(RxJava2CallAdapterFactory.create()).build();
        apiService = ((AppApiService) this.retrofit.create(AppApiService.class));
    }

    public HttpProxy(Context context,String url) {
        this.context = context;
        this.IP_URL=url;
        OkHttpClient client = new OkHttpClient.Builder().connectTimeout(TIME_OUT, TimeUnit.SECONDS).readTimeout(TIME_OUT, TimeUnit.SECONDS).writeTimeout(TIME_OUT, TimeUnit.SECONDS).build();
        this.retrofit = new Builder().baseUrl(url).client(client).addConverterFactory(FastJsonConverterFactory.create()).addCallAdapterFactory(RxJava2CallAdapterFactory.create()).build();
        apiService = ((AppApiService) this.retrofit.create(AppApiService.class));
    }


    private Observable<RequestData> getobervalbe(String pathname, String sername, Map<String, Object> map) {
        String urls = IP_URL + pathname + "/" + sername;
        for (Map.Entry<String, Object> entry : map.entrySet()) {
            if (!urls.contains("?")) {
                urls = urls + "?" + ((String) entry.getKey()) + "=" + entry.getValue();
            } else if (((String) entry.getKey()).contains("param")) {

            } else {
                urls = urls + "&" + ((String) entry.getKey()) + "=" + entry.getValue();
            }
        }
        Log.v("userlogin", urls);
        Map<String, String> headerMap = new HashMap<>();
        headerMap.put("Content-Type", "application/x-www-form-urlencoded");
        String requestJson = JSONObject.toJSONString(map);
        return this.apiService.netService(headerMap, pathname, sername, map);

    }


    private Observable<RequestData> getGetObervalbe(String pathname, String sername, Map<String, Object> map) {
        String urls = IP_URL + pathname + "/" + sername;
        for (Map.Entry<String, Object> entry : map.entrySet()) {
            if (!urls.contains("?")) {
                urls = urls + "?" + ((String) entry.getKey()) + "=" + entry.getValue();
            } else if (((String) entry.getKey()).contains("param")) {

            } else {
                urls = urls + "&" + ((String) entry.getKey()) + "=" + entry.getValue();
            }
        }
        Log.v("userlogin", urls);
        Map<String, String> headerMap = new HashMap<>();
        String requestJson = JSONObject.toJSONString(map);
        return this.apiService.getNetService(headerMap, pathname, sername, map);

    }

    public static HttpProxy getInstance(Context context) {
        synchronized (HttpProxy.class) {
            if (instance == null) {
                instance = new HttpProxy(context);
            }
        }
        return instance;
    }


    public static HttpProxy getInstance(Context context,String url) {
        synchronized (HttpProxy.class) {
            if (instance == null||!instance.IP_URL.equals(url)) {
                instance = new HttpProxy(context,url);
            }
        }
        return instance;
    }

    public void getNetObserver(Observable<RequestData> observable, final HttpNetListener listener) {
        if (NetWorkUtil.isNetworkAvailable(this.context)) {
            observable.subscribeOn(Schedulers.io()).unsubscribeOn(Schedulers.io()).observeOn(AndroidSchedulers.mainThread()).subscribe(new Observer<RequestData>() {
                @Override
                public void onSubscribe(Disposable d) {
                }

                @Override
                public void onNext(RequestData requestData) {
                    Log.v("userlogin", JSONObject.toJSONString(requestData));
                    if (Constant.NET_SUCCESS_TYPE.equals(requestData.getCode()) && requestData.getSuccess().equals("true")) {
                        listener.netSuccess(requestData.getResult(), requestData.getMessage());
                    } else {
                        listener.netFail(requestData.getMessage());
                    }
                }

                @Override
                public void onError(Throwable e) {
                    listener.onNetError();
                    Log.v("userlogin http", JSONObject.toJSONString(e));
                    if (e instanceof HttpException) {

                        HttpException httpException = (HttpException) e;
                        try {
                            String responseString = httpException.response().errorBody().string();
                            Log.v("userlogin", responseString);
                        } catch (IOException e1) {
                            e1.printStackTrace();
                        }
                    }else {

                    }
                }

                @Override
                public void onComplete() {
                }
            });
        }

    }

    /**
     * 用户登录
     *
     * @param phone    手机号码
     * @param password 密码
     * @param listener 网络回调
     */
    public void phoneLogin(String phone, String password, HttpNetListener listener) {
        Map<String, Object> map = new HashMap<>(2);
        map.put("phone", phone);
        map.put("password", password);
        getNetObserver(getobervalbe(NetServiceName.MEMBER, NetServiceName.PHONELOGIN, map), listener);
    }

    /**
     * 微信登录
     *
     * @param code     微信授权返回的code
     * @param listener 网络回调
     */
    public void wxLogin(String code, HttpNetListener listener) {
        Map<String, Object> map = new HashMap<>(1);
        map.put("code", code);
        getNetObserver(getobervalbe(NetServiceName.WECHAT, NetServiceName.WXLOGIN, map), listener);
    }

    /**
     * 用户签到
     *
     * @param listener 网络回调
     */
    public void dailySign(HttpNetListener listener) {
        Map<String, Object> map = new HashMap<>();
        getNetObserver(getobervalbe(NetServiceName.TASK, NetServiceName.DAILY_SIGN, map), listener);
    }

    /**
     * 修改昵称
     *
     * @param nickname
     * @param listener
     */
    public void modAvatar(String nickname, HttpNetListener listener) {
        Map<String, Object> map = new HashMap<>(1);
        map.put("nickname", nickname);
        getNetObserver(getobervalbe(NetServiceName.MEMBER, NetServiceName.MOD_NICKNAME, map), listener);
    }

    /**
     * 实名认证
     */
    public void approveRealName(String idCardNo, String realname, HttpNetListener listener) {
        Map<String, Object> map = new HashMap<>(2);
        map.put("idCardNo", idCardNo);
        map.put("realname", realname);
        getNetObserver(getobervalbe(NetServiceName.MEMBER, NetServiceName.APPROVE_REAL_NAME, map), listener);
    }

    /**
     * 获得徒孙数
     *
     * @param listener
     */
    public void allChildsInfos(HttpNetListener listener) {
        Map<String, Object> map = new HashMap<>();
        getNetObserver(getGetObervalbe(NetServiceName.MEMBER, NetServiceName.ALL_CHILDS_INFOS, map), listener);
    }

    /**
     * 碎片记录
     *
     * @param page
     * @param size
     * @param listener
     */
    public void hashRateHistory(String page, String size, HttpNetListener listener) {
        Map<String, Object> map = new HashMap<>(2);
        map.put("size", size);
        map.put("page", page);
        getNetObserver(getobervalbe(NetServiceName.FUND, NetServiceName.HASH_RATE_HISTORY, map), listener);
    }
    public void hashRateHistory(String filterPearl,String page, String size, HttpNetListener listener) {
        Map<String, Object> map = new HashMap<>(3);
        map.put("size", size);
        map.put("page", page);
        map.put("filterPearl", filterPearl);
        getNetObserver(getobervalbe(NetServiceName.FUND, NetServiceName.HASH_RATE_HISTORY, map), listener);
    }

    /**
     * 获得用户称号信息
     *
     * @param listener
     */
    public void myLevel(HttpNetListener listener) {
        Map<String, Object> map = new HashMap<>();
        getNetObserver(getobervalbe(NetServiceName.MEMBER, NetServiceName.MY_LEVEL, map), listener);
    }

    /**
     * 获得全部称号
     *
     * @param listener
     */
    public void getAllMemberLevels(HttpNetListener listener) {
        Map<String, Object> map = new HashMap<>();
        getNetObserver(getobervalbe(NetServiceName.MEMBER, NetServiceName.GET_ALL_MEMBER_LEVELS, map), listener);
    }

    /**
     * 社区排行榜
     *
     * @param count
     * @param listener
     */
    public void netRank(String count, HttpNetListener listener) {
        Map<String, Object> map = new HashMap<>(1);
        map.put("count", count);
        getNetObserver(getobervalbe(NetServiceName.MEMBER, NetServiceName.NET_RANK, map), listener);
    }

    //
    public void taskList(HttpNetListener listener) {
        Map<String, Object> map = new HashMap<>();
        getNetObserver(getGetObervalbe(NetServiceName.TASK, NetServiceName.TASK_LIST, map), listener);
    }

    //
    public void toBindWechat(String verifyCode, HttpNetListener listener) {
        Map<String, Object> map = new HashMap<>(1);
        map.put("verifyCode", verifyCode);
        getNetObserver(getobervalbe(NetServiceName.WECHAT, NetServiceName.TO_BIND_WECHAT, map), listener);
    }

    //
    public void myAllInfo(HttpNetListener listener) {
        Map<String, Object> map = new HashMap<>();
        getNetObserver(getobervalbe(NetServiceName.MEMBER, NetServiceName.MY_ALL_INFO, map), listener);
    }

    //
    public void logout(HttpNetListener listener) {
        Map<String, Object> map = new HashMap<>();
        getNetObserver(getobervalbe(NetServiceName.MEMBER, NetServiceName.LOGOUT, map), listener);
    }

    //
    public void withdrawMenus(HttpNetListener listener) {
        Map<String, Object> map = new HashMap<>();
        getNetObserver(getGetObervalbe(NetServiceName.FUND, NetServiceName.WITHDRAW_MENUS, map), listener);
    }

    //
    public void doWithdraw(String id, HttpNetListener listener) {
        Map<String, Object> map = new HashMap<>(1);
        map.put("id", id);
        getNetObserver(getobervalbe(NetServiceName.FUND, NetServiceName.DO_WITHDRAW, map), listener);
    }

    //
    public void stageEarnInfo(HttpNetListener listener) {
        Map<String, Object> map = new HashMap<>();
        getNetObserver(getGetObervalbe(NetServiceName.MEMBER, NetServiceName.STAGE_EARN_INFO, map), listener);
    }

    //
    public void confirmLookedBootVideo(HttpNetListener listener) {
        Map<String, Object> map = new HashMap<>();
        getNetObserver(getGetObervalbe(NetServiceName.MEMBER, NetServiceName.CONFIRM_LOOKED_BOOT_VIDEO, map), listener);
    }

    //
    public void moneyHistory(String page, String size, HttpNetListener listener) {
        Map<String, Object> map = new HashMap<>(2);
        map.put("size", size);
        map.put("page", page);
        getNetObserver(getobervalbe(NetServiceName.FUND, NetServiceName.MONEY_HISTORY, map), listener);
    }

    //
    public void shake(HttpNetListener listener) {
        Map<String, Object> map = new HashMap<>();
        getNetObserver(getobervalbe(NetServiceName.COMMON, NetServiceName.SHAKE, map), listener);
    }

    public void thirds(String page, String size, HttpNetListener listener) {
        Map<String, Object> map = new HashMap<>(2);
        map.put("size", size);
        map.put("page", page);
        getNetObserver(getGetObervalbe(NetServiceName.MEMBER, NetServiceName.THIRDS, map), listener);
    }

    public void childs(String page, String size, HttpNetListener listener) {
        Map<String, Object> map = new HashMap<>(2);
        map.put("size", size);
        map.put("page", page);
        getNetObserver(getGetObervalbe(NetServiceName.MEMBER, NetServiceName.CHILDS, map), listener);
    }

    public void pendingMember(String page, String size, HttpNetListener listener) {
        Map<String, Object> map = new HashMap<>(2);
        map.put("size", size);
        map.put("page", page);
        getNetObserver(getGetObervalbe(NetServiceName.MEMBER, NetServiceName.PENDING_MEMBER, map), listener);
    }

    //
    public void setPassword(String password, HttpNetListener listener) {
        Map<String, Object> map = new HashMap<>(1);
        map.put("password", password);
        getNetObserver(getobervalbe(NetServiceName.MEMBER, NetServiceName.SET_PASSWORD, map), listener);
    }

    public void setAccountInfo(String qqAccount, String wechatAccount, HttpNetListener listener) {
        Map<String, Object> map = new HashMap<>();
        map.put("qqAccount", qqAccount);
        map.put("wechatAccount", wechatAccount);
        getNetObserver(getobervalbe(NetServiceName.MEMBER, NetServiceName.SET_ACCOUNT_INFO, map), listener);
    }

    //
    public void getCode(String phone, String type, HttpNetListener listener) {
        Map<String, Object> map = new HashMap<>(2);
        map.put("phone", phone);
        map.put("type", type);
        getNetObserver(getGetObervalbe(NetServiceName.SMS, NetServiceName.GET_CODE, map), listener);
    }

    //
    public void resetPassword(String code, String password, String phone, HttpNetListener listener) {
        Map<String, Object> map = new HashMap<>(3);
        map.put("code", code);
        map.put("password", password);
        map.put("phone", phone);
        getNetObserver(getobervalbe(NetServiceName.MEMBER, NetServiceName.RESET_PASSWORD, map), listener);
    }

    //
    public void myEarnList(HttpNetListener listener) {
        Map<String, Object> map = new HashMap<>();
        getNetObserver(getobervalbe(NetServiceName.MEMBER, NetServiceName.MY_EARN_LIST, map), listener);
    }

    //
    public void getInviteQrCodeUrl(HttpNetListener listener) {
        Map<String, Object> map = new HashMap<>();
        getNetObserver(getGetObervalbe(NetServiceName.MEMBER, NetServiceName.GET_INVITE_QR_CODE_URL, map), listener);
    }

    //
    public void bindPhone(String code, String password, String phone, String refCode, String wechatTicket, HttpNetListener listener) {
        Map<String, Object> map = new HashMap<>(3);
        map.put("code", code);
        map.put("password", password);
        map.put("phone", phone);
        map.put("refCode", refCode);
        map.put("wechatTicket", wechatTicket);

        getNetObserver(getobervalbe(NetServiceName.MEMBER, NetServiceName.BIND_PHONE, map), listener);
    }

    //
    public void getShareUrl(HttpNetListener listener) {
        Map<String, Object> map = new HashMap<>(2);
        getNetObserver(getGetObervalbe(NetServiceName.COMMON, NetServiceName.GET_SHARE_URL, map), listener);
    }

    //
    public void getShakeHashRate(String ticket, HttpNetListener listener) {
        Map<String, Object> map = new HashMap<>(1);
        map.put("ticket", ticket);
        getNetObserver(getobervalbe(NetServiceName.COMMON, NetServiceName.GET_SHAKE_HASH_RATE, map), listener);
    }

    //
    public void earnsInfo(HttpNetListener listener) {
        Map<String, Object> map = new HashMap<>();
        getNetObserver(getobervalbe(NetServiceName.COMMON, NetServiceName.EARNS_INFO, map), listener);
    }

    //
    public void getTaskRedpack(String taskSN, HttpNetListener listener) {
        Map<String, Object> map = new HashMap<>(1);
        map.put("taskSN", taskSN);
        getNetObserver(getobervalbe(NetServiceName.TASK, NetServiceName.GET_TASK_REDPACK, map), listener);
    }
    //
    public void noticelist(String size, String page,String type,HttpNetListener listener) {
        Map<String, Object> map = new HashMap<>(1);
        map.put("size", size);
        map.put("page", page);
        map.put("type", type);
        getNetObserver(getobervalbe(NetServiceName.NOTICE, NetServiceName.NOTICELIST, map), listener);
    }
    //

    public void redpackNotices(String count, HttpNetListener listener) {
        Map<String, Object> map = new HashMap<>(1);
        map.put("count", count);
        getNetObserver(getobervalbe(NetServiceName.NOTICE, NetServiceName.REDPACK_NOTICES, map), listener);
    }
    //
    public void bindWxLogin(String code,String access_token, HttpNetListener listener) {
        Map<String, Object> map = new HashMap<>(1);
        map.put("code", code);
        map.put("access_token", access_token);
        getNetObserver(getobervalbe(NetServiceName.WECHAT, NetServiceName.BIND_WX_LOGIN, map), listener);
    }
    public void sendAdvice(String content, HttpNetListener listener) {
        Map<String, Object> map = new HashMap<>(1);
        map.put("content", content);
        getNetObserver(getobervalbe(NetServiceName.HELP, NetServiceName.SEND_ADVICE, map), listener);
    }
    //
    public void getStageAwardMoney(HttpNetListener listener) {
        Map<String, Object> map = new HashMap<>();
        getNetObserver(getobervalbe(NetServiceName.MEMBER, NetServiceName.GET_STAGE_AWARD_MONEY, map), listener);
    }

    /**
     * 合成珍珠
     * @param listener
     */
    public void mergeToPearl(HttpNetListener listener) {
        Map<String, Object> map = new HashMap<>();
        getNetObserver(getobervalbe(NetServiceName.TRADE, NetServiceName.MERGE_TO_PEARL, map), listener);
    }

    /**
     * 娱乐首页信息(珍珠，碎片，收益，本次投入等信息)
     * @param listener
     */
    public void tradeIndex(HttpNetListener listener) {
        Map<String, Object> map = new HashMap<>();
        getNetObserver(getobervalbe(NetServiceName.TRADE, NetServiceName.TRADE_INDEX, map), listener);
    }

    /**
     * 投注页面，获得奖池金额，投注数量
     * @param listener
     */
    public void poolInfo(HttpNetListener listener) {
        Map<String, Object> map = new HashMap<>();
        getNetObserver(getobervalbe(NetServiceName.TRADE, NetServiceName.POOL_INFO, map), listener);
    }
    /**
     * 本期投入排行榜,前10个
     */
    public void putPoolRank(HttpNetListener listener) {
        Map<String, Object> map = new HashMap<>();
        getNetObserver(getobervalbe(NetServiceName.TRADE, NetServiceName.PUT_POOL_RANK, map), listener);
    }

    /**
     * 投注
     * @param listener
     */
    public void putPool(String count,HttpNetListener listener) {
        Map<String, Object> map = new HashMap<>();
        map.put("count",count);
        getNetObserver(getobervalbe(NetServiceName.TRADE, NetServiceName.PUT_POOL, map), listener);
    }

    /**
     * 搜索手机号
     * @param phone 搜索的手机号
     * @param listener
     */
    public void tradeSearch(String phone,HttpNetListener listener) {
        Map<String, Object> map = new HashMap<>();
        map.put("phone",phone);
        getNetObserver(getobervalbe(NetServiceName.TRADE, NetServiceName.TRADE_SEARCH, map), listener);
    }

    /**
     * 查看用户是否设置过交易密码
     * @param listener
     */
    public void setupTradePwd(HttpNetListener listener) {
        Map<String, Object> map = new HashMap<>();
        getNetObserver(getobervalbe(NetServiceName.TRADE, NetServiceName.SETUP_TRADE_PWD, map), listener);
    }
    //
    public void givePearl(String count,String targetPhone,String tradePwd, HttpNetListener listener) {
        Map<String, Object> map = new HashMap<>(3);
        map.put("count",count);
        map.put("targetPhone",targetPhone);
        map.put("tradePwd",tradePwd);
        getNetObserver(getobervalbe(NetServiceName.TRADE, NetServiceName.GIVE_PEARL, map), listener);
    }

    /**
     * 珍珠赠送记录
     * @param size
     * @param page
     * @param listener
     */
    public void givePearlRecord(String size, String page,HttpNetListener listener) {
        Map<String, Object> map = new HashMap<>(3);
        map.put("size", size);
        map.put("page", page);
        getNetObserver(getobervalbe(NetServiceName.TRADE, NetServiceName.GIVE_PEARL_RECORD, map), listener);
    }

    /**
     * 设置交易密码
     * @param tradePwd
     * @param listener
     */
    public void setTradePwd(String tradePwd,HttpNetListener listener) {
        Map<String, Object> map = new HashMap<>(1);
        map.put("tradePwd",tradePwd);
        getNetObserver(getobervalbe(NetServiceName.TRADE, NetServiceName.SET_TRADE_PWD, map), listener);
    }
    //
    public void resetTradePwd(String tradePwd,String code,HttpNetListener listener) {
        Map<String, Object> map = new HashMap<>(2);
        map.put("tradePwd",tradePwd);
        map.put("code",code);
        getNetObserver(getobervalbe(NetServiceName.TRADE, NetServiceName.RESET_TRADE_PWD, map), listener);
    }
    //
    public void checkVersion(String versionNo,HttpNetListener listener) {
        Map<String, Object> map = new HashMap<>(1);
        map.put("versionNo",versionNo);
        getNetObserver(getobervalbe(NetServiceName.COMMON, NetServiceName.CHECK_VERSION, map), listener);
    }
    //

    public void tradeEarnRecord(String size, String page,HttpNetListener listener) {
        Map<String, Object> map = new HashMap<>(3);
        map.put("size", size);
        map.put("page", page);
        getNetObserver(getobervalbe(NetServiceName.TRADE, NetServiceName.TRADE_EARN_RECORD, map), listener);
    }
    //
    public void putOptions(HttpNetListener listener) {
        Map<String, Object> map = new HashMap<>();
        getNetObserver(getobervalbe(NetServiceName.TRADE, NetServiceName.PUT_OPTIONS, map), listener);
    }
    //
    public void lookVideo(HttpNetListener listener) {
        Map<String, Object> map = new HashMap<>();
        getNetObserver(getobervalbe(NetServiceName.TRADE, NetServiceName.LOOK_VIDEO, map), listener);
    }
    //
    public void transforHashRate(String ticket,HttpNetListener listener) {
        Map<String, Object> map = new HashMap<>();
        map.put("ticket", ticket);
        getNetObserver(getobervalbe(NetServiceName.TRADE, NetServiceName.TRANSFOR_HASH_RATE, map), listener);
    }

    /**
     * 获得剩余看视频次数
     * @param listener
     */
    public void leftLookVideoCnt(HttpNetListener listener) {
        Map<String, Object> map = new HashMap<>();
        getNetObserver(getobervalbe(NetServiceName.TRADE, NetServiceName.LEFT_LOOK_VIDEO_CNT, map), listener);
    }

    public void gameText(HttpNetListener listener) {
        Map<String, Object> map = new HashMap<>();
        getNetObserver(getGetObervalbe(NetServiceName.COMMON, "gameText", map), listener);
    }


}




