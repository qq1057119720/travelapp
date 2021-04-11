import android.content.Context
import android.os.Build
import android.text.TextUtils
import android.util.Log
import androidx.annotation.NonNull
import com.alibaba.fastjson.JSONObject
import com.cgm.nim.NimGlobal
import com.netease.nim.uikit.common.util.sys.TimeUtil
import com.netease.nim.uikit.impl.NimUIKitImpl
import com.netease.nimlib.sdk.NIMClient
import com.netease.nimlib.sdk.Observer
import com.netease.nimlib.sdk.RequestCallback
import com.netease.nimlib.sdk.RequestCallbackWrapper
import com.netease.nimlib.sdk.auth.AuthService
import com.netease.nimlib.sdk.msg.MsgService
import com.netease.nimlib.sdk.msg.MsgServiceObserve
import com.netease.nimlib.sdk.msg.model.RecentContact
import com.netease.nimlib.sdk.uinfo.UserService
import com.netease.nimlib.sdk.uinfo.constant.UserInfoFieldEnum
import com.netease.nimlib.sdk.uinfo.model.NimUserInfo
import io.flutter.app.FlutterActivity
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.PluginRegistry.Registrar
import java.util.*

/**
 * NimPlugin
 */
class NimPlugin(context: Context) : FlutterPlugin, MethodCallHandler {
    private var pendingResult: MethodChannel.Result? = null
    //  创建观察者对象
    var messageObserver: Observer<List<RecentContact>>? = null
    val context: Context = context;
    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        if (call.method == "getPlatformVersion") {
            result.success("Android " + Build.VERSION.RELEASE)
        } else if (call.method == "initIMLogin") {
            require(call.arguments is Map<*, *>) { "Plugin not passing a map as parameter: " + call.arguments }
            val userMap = call.arguments as Map<String, String>
            Log.v("NimPlugin", userMap.toString())
            NimGlobal.getInstance().initIMLogin(userMap["accid"], userMap["token"])
        } else if (call.method == "startChat") {
            require(call.arguments is Map<*, *>) { "Plugin not passing a map as parameter: " + call.arguments }
            val userMap = call.arguments as Map<String, String>
            Log.v("NimPlugin", userMap.toString())
            startChat(context, userMap["accid"])
        } else if (call.method == "startTeam") {
            require(call.arguments is Map<*, *>) { "Plugin not passing a map as parameter: " + call.arguments }
            val userMap = call.arguments as Map<String, String>
            Log.v("NimPlugin", userMap.toString())
            startTeam(context, userMap["tic"])
        } else if (call.method == "loginOut") {
            loginOut()
        } else if (call.method == "queryRecentContacts") {
            pendingResult = result
            queryRecentContacts()
        } else if (call.method == "keepRecent") {
            pendingResult = result
        } else if (call.method == "updateUserInfo") { //更新用户资料
            pendingResult = result
            val userMap = call.arguments as Map<String, String>
            updateUserInfo(userMap["nickname"], userMap["avatar"])
        } else {
            result.notImplemented()
        }
    }

    /**
     * 打开单聊页面
     */
    fun startChat(context: Context?, accid: String?) {
        NimUIKitImpl.startP2PSession(context, accid)
    }

    /**
     * 打开群聊页面
     */
    fun startTeam(context: Context?, tid: String?) {
        NimUIKitImpl.startTeamSession(context, tid)
    }

    fun updateUserInfo(nickname: String?, avatar: String?) {
        val fields: MutableMap<UserInfoFieldEnum, Any?> = HashMap(2)
        if (!TextUtils.isEmpty(nickname)) {
            fields[UserInfoFieldEnum.Name] = nickname
        }
        if (!TextUtils.isEmpty(avatar)) {
            fields[UserInfoFieldEnum.AVATAR] = avatar
        }
        NIMClient.getService(UserService::class.java).updateUserInfo(fields)
                .setCallback(object : RequestCallback<Void?> {
                    override fun onSuccess(aVoid: Void?) {
                        Log.v("nimUserInfos", "更新 success")
                    }

                    override fun onFailed(i: Int) {}
                    override fun onException(throwable: Throwable) {}
                })
    }

    /**
     * 登出
     */
    fun loginOut() {
        NIMClient.getService(AuthService::class.java).logout()
    }

    /**
     * 注册新会话信息监听
     */
    fun queryRecentContacts() {
//    messageObserver = Observer<List<RecentContact?>?> { messages ->
//      Log.v("nimUserInfos", "新的消息")
//      Log.v("nimUserInfos", JSONObject.toJSONString(messages))
//      recentContact
//    }
        //  注册/注销观察者
        NIMClient.getService(MsgServiceObserve::class.java)
                .observeRecentContact(messageObserver, true)
        recentContact
    }// recents参数即为最近联系人列表（最近会话列表）

    /**
     * 获取会话列表
     */
    private val recentContact: Unit
        private get() {
            NIMClient.getService(MsgService::class.java).queryRecentContacts()
                    .setCallback(object : RequestCallbackWrapper<List<RecentContact>>() {
                        override fun onResult(code: Int, recents: List<RecentContact>, e: Throwable) { // recents参数即为最近联系人列表（最近会话列表）
                            val map: MutableMap<String, Any> = HashMap()
                            map["code"] = code
                            Log.v("nimUserInfos", JSONObject.toJSONString(recents))
                            if (code == 200) {
                                val accounts: MutableList<String> = ArrayList()
                                for (i in recents.indices) {
                                    accounts.add(recents[i].contactId)
                                }
                                NIMClient.getService(UserService::class.java).fetchUserInfo(accounts)
                                        .setCallback(object : RequestCallback<List<NimUserInfo>> {
                                            override fun onSuccess(nimUserInfos: List<NimUserInfo>) {
                                                Log.v("nimUserInfos", JSONObject.toJSONString(nimUserInfos))
                                                val conList: MutableList<Map<String, Any>> = ArrayList()
                                                for (i in recents.indices) {
                                                    val userMap: MutableMap<String, Any> = HashMap()
                                                    userMap["contactId"] = recents[i].contactId
                                                    userMap["content"] = recents[i].content
                                                    userMap["fromAccount"] = recents[i].fromAccount
                                                    userMap["fromNick"] = recents[i].fromNick
                                                    userMap["msgStatus"] = recents[i].msgStatus
                                                    userMap["msgType"] = recents[i].msgType
                                                    userMap["sessionType"] = recents[i].sessionType
                                                    userMap["time"] = TimeUtil.getTimeShowString(recents[i].time, false)
                                                    userMap["tag"] = recents[i].tag
                                                    userMap["unreadCount"] = recents[i].unreadCount
                                                    userMap["attachment"] = recents[i].attachment
                                                    for (j in nimUserInfos.indices) {
                                                        if (recents[i].contactId == nimUserInfos[j].account) {
                                                            userMap["name"] = nimUserInfos[j].name
                                                            userMap["avatar"] = nimUserInfos[j].avatar
                                                            break
                                                        }
                                                    }
                                                    conList.add(userMap)
                                                }
                                                map["msg"] = JSONObject.toJSONString(conList)
                                                pendingResult!!.success(map)
                                            }

                                            override fun onFailed(i: Int) {}
                                            override fun onException(throwable: Throwable) {}
                                        })
                            }
                        }
                    })
        }

    companion object {
        private var instance: NimPlugin? = null
        private const val CHANNEL = "nim"
        /**
         * Plugin registration.
         */
        fun registerWith(registrar: Registrar) {
            if (instance == null) {
                val channel = MethodChannel(registrar.messenger(), CHANNEL)
                instance = NimPlugin(registrar.activity() as FlutterActivity)
                channel.setMethodCallHandler(instance)
            }
        }
    }

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        val channel = MethodChannel(flutterPluginBinding.getFlutterEngine().getDartExecutor(), "nim_plugin")
        channel.setMethodCallHandler(NimPlugin(context = flutterPluginBinding.applicationContext));
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    }

}