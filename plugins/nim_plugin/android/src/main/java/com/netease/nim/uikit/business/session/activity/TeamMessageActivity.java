package com.netease.nim.uikit.business.session.activity;

import android.Manifest;
import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.os.Build;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.Log;
import android.view.View;
import android.widget.TextView;

import androidx.annotation.RequiresApi;

import com.alibaba.fastjson.JSONObject;
import com.cgm.nim.NimPlugin;
import com.cgm.view.FinishCourseActivity;
import com.netease.nim.uikit.common.ToastHelper;

import com.netease.nim.uikit.R;
import com.netease.nim.uikit.api.NimUIKit;
import com.netease.nim.uikit.api.model.SimpleCallback;
import com.netease.nim.uikit.api.model.contact.ContactChangedObserver;
import com.netease.nim.uikit.api.model.session.SessionCustomization;
import com.netease.nim.uikit.api.model.team.TeamDataChangedObserver;
import com.netease.nim.uikit.api.model.team.TeamMemberDataChangedObserver;
import com.netease.nim.uikit.api.wrapper.NimToolBarOptions;
import com.netease.nim.uikit.business.session.constant.Extras;
import com.netease.nim.uikit.business.session.fragment.MessageFragment;
import com.netease.nim.uikit.business.session.fragment.TeamMessageFragment;
import com.netease.nim.uikit.common.activity.ToolBarOptions;
import com.netease.nimlib.sdk.msg.constant.SessionTypeEnum;
import com.netease.nimlib.sdk.msg.model.IMMessage;
import com.netease.nimlib.sdk.team.constant.TeamTypeEnum;
import com.netease.nimlib.sdk.team.model.Team;
import com.netease.nimlib.sdk.team.model.TeamMember;
import com.yanzhenjie.permission.AndPermission;
import com.yanzhenjie.permission.PermissionListener;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 群聊界面
 * <p/>
 * Created by huangjun on 2015/3/5.
 */
public class TeamMessageActivity extends BaseMessageActivity {

    // model
    private Team team;

    private View invalidTeamTipView;

    private TextView invalidTeamTipText;

    private TeamMessageFragment fragment;

    private Class<? extends Activity> backToClass;

    private JSONObject userInfo;

    private TextView titleView;
    private TextView tvInfomessage;

    public static void start(Context context, String tid, SessionCustomization customization,
                             Class<? extends Activity> backToClass, IMMessage anchor) {
        Intent intent = new Intent();
        intent.putExtra(Extras.EXTRA_ACCOUNT, tid);
        intent.putExtra(Extras.EXTRA_CUSTOMIZATION, customization);
        intent.putExtra(Extras.EXTRA_BACK_TO_CLASS, backToClass);
        if (anchor != null) {
            intent.putExtra(Extras.EXTRA_ANCHOR, anchor);
        }
        intent.setClass(context, TeamMessageActivity.class);
        intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TOP);

        context.startActivity(intent);
    }

    public static void start(Context context, String tid, SessionCustomization customization,
                             Class<? extends Activity> backToClass, IMMessage anchor, Map<String,String> userMap) {
        Intent intent = new Intent();
        intent.putExtra(Extras.EXTRA_ACCOUNT, tid);
        intent.putExtra(Extras.EXTRA_CUSTOMIZATION, customization);
        intent.putExtra(Extras.EXTRA_BACK_TO_CLASS, backToClass);
        intent.putExtra("userinfo",JSONObject.toJSONString(userMap));
        if (anchor != null) {
            intent.putExtra(Extras.EXTRA_ANCHOR, anchor);
        }
        intent.setClass(context, TeamMessageActivity.class);
        intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TOP);

        context.startActivity(intent);
    }



    protected void findViews() {
        invalidTeamTipView = findView(R.id.invalid_team_tip);
        invalidTeamTipText = findView(R.id.invalid_team_text);
    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {//API>21,设置状态栏颜色透明
            getWindow().setStatusBarColor(0);
        }
        getLocationPermission();
        userInfo=JSONObject.parseObject(getIntent().getStringExtra("userinfo"));
        backToClass = (Class<? extends Activity>) getIntent().getSerializableExtra(Extras.EXTRA_BACK_TO_CLASS);
        findViews();
        titleView=findViewById(R.id.tv_title);
        tvInfomessage=findViewById(R.id.tv_infomessage);
        findViewById(R.id.iv_topback).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                finish();
            }
        });
        //好友页面
        findViewById(R.id.iv_modre).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                //通过插件通道进行回调
                if (NimPlugin.resultMap.get(NimPlugin.START_TEAM)!=null){
                    final Map<String,Object> map=new HashMap<>();
                    map.put("code","201");
                    NimPlugin.resultMap.get(NimPlugin.START_TEAM).success(map);
                    finish();
                }
            }
        });

        findViewById(R.id.tv_file).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                //通过插件通道进行回调
                if (NimPlugin.resultMap.get(NimPlugin.START_TEAM)!=null){
                    final Map<String,Object> map=new HashMap<>();
                    map.put("code","203");
                    NimPlugin.resultMap.get(NimPlugin.START_TEAM).success(map);
                    finish();
                }
            }
        });
        findViewById(R.id.tv_meeting).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                //通过插件通道进行回调
                if (NimPlugin.resultMap.get(NimPlugin.START_TEAM)!=null){
                    final Map<String,Object> map=new HashMap<>();
                    map.put("code","204");
                    NimPlugin.resultMap.get(NimPlugin.START_TEAM).success(map);
                    finish();
                }
            }
        });
        findViewById(R.id.tv_tiku).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                //通过插件通道进行回调
                if (NimPlugin.resultMap.get(NimPlugin.START_TEAM)!=null){
                    final Map<String,Object> map=new HashMap<>();
                    map.put("code","206");
                    NimPlugin.resultMap.get(NimPlugin.START_TEAM).success(map);
                    finish();
                }
            }
        });
        findViewById(R.id.tv_shop).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                //通过插件通道进行回调
                if (NimPlugin.resultMap.get(NimPlugin.START_TEAM)!=null){
                    final Map<String,Object> map=new HashMap<>();
                    map.put("code","205");
                    NimPlugin.resultMap.get(NimPlugin.START_TEAM).success(map);
                    finish();
                }
            }
        });
        findViewById(R.id.tv_people).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                //通过插件通道进行回调
                if (NimPlugin.resultMap.get(NimPlugin.START_TEAM)!=null){
                    final Map<String,Object> map=new HashMap<>();
                    map.put("code","201");
                    NimPlugin.resultMap.get(NimPlugin.START_TEAM).success(map);
                    finish();
                }
            }
        });

        titleView.setText(userInfo.getString("name")+" · "+userInfo.getString("usercount")+"人");
        StringBuffer infoBuffer=new StringBuffer();
        infoBuffer.append(userInfo.getString("curyear"));
        infoBuffer.append(" - ");

        if (!TextUtils.isEmpty(userInfo.getString("curquarter"))){
            switch (userInfo.getString("curquarter")){
                case "1":
                    infoBuffer.append("SPRING");
                    break;
                case "2":
                    infoBuffer.append("SUMMER");
                    break;
                case "3":
                    infoBuffer.append("AUTUMN");
                    break;
                case "4":
                    infoBuffer.append("WINTER");
                    break;
                default:
            }
        }

        String teacherSex="- MR.";
        if(!TextUtils.isEmpty(userInfo.getString("teachersex"))){
            if("男".equals(userInfo.getString("teachersex"))){
                teacherSex="- MR.";
            }else{
                teacherSex="- MRS.";
            }
        }
        infoBuffer.append(teacherSex);

        infoBuffer.append(userInfo.getString("teachername"));

//        tvInfomessage.setText(infoBuffer.toString());
        tvInfomessage.setText(userInfo.getString("message"));

        registerTeamUpdateObserver(true);

//        if(!TextUtils.isEmpty(userInfo.getString("curendtime"))){
//            double curendtime=Double.parseDouble(userInfo.getString("curendtime"));
//            if (curendtime<=10&&!TextUtils.isEmpty(userInfo.getString(
//                    "ucstate"))&&userInfo.getString("ucstate").equals("1")){
//                Intent intent=new Intent(this,FinishCourseActivity.class);
//                intent.putExtra("day",curendtime+"");
//                startActivityForResult(intent,888);
//            }
//        }

    }
    @Override
    public void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        Log.v("userlogin","回调，"+resultCode+"--"+requestCode);
        if (requestCode==888&&resultCode==111){
            //处理回调相关操作
            //通过插件通道进行回调
            if (NimPlugin.resultMap.get(NimPlugin.START_TEAM)!=null){
                Log.v("userlogin","回调，fan hui xinxi ");
                final Map<String,Object> map=new HashMap<>();
                map.put("code","202");
                NimPlugin.resultMap.get(NimPlugin.START_TEAM).success(map);
                finish();
            }
        }
    }
    @Override
    protected void onDestroy() {
        super.onDestroy();
        registerTeamUpdateObserver(false);
    }

    @Override
    protected void onResume() {
        super.onResume();
        requestTeamInfo();
    }

    /**
     * 请求群基本信息
     */
    private void requestTeamInfo() {
        // 请求群基本信息
        Team t = NimUIKit.getTeamProvider().getTeamById(sessionId);
        if (t != null) {
            updateTeamInfo(t);
        } else {
            NimUIKit.getTeamProvider().fetchTeamById(sessionId, new SimpleCallback<Team>() {
                @Override
                public void onResult(boolean success, Team result, int code) {
                    if (success && result != null) {
                        updateTeamInfo(result);
                    } else {
                        onRequestTeamInfoFailed();
                    }
                }
            });
        }
    }

    private void onRequestTeamInfoFailed() {
        ToastHelper.showToast(TeamMessageActivity.this, "获取群组信息失败!");
        finish();
    }

    /**R
     * 更新群信息
     *
     * @param d
     */
    private void updateTeamInfo(final Team d) {
        if (d == null) {
            return;
        }

        team = d;
        fragment.setTeam(team);

        setTitle(team == null ? sessionId : team.getName() + "(" + team.getMemberCount() + "人)");

        invalidTeamTipText.setText(team.getType() == TeamTypeEnum.Normal ? R.string.normal_team_invalid_tip : R.string.team_invalid_tip);
        invalidTeamTipView.setVisibility(team.isMyTeam() ? View.GONE : View.VISIBLE);
    }

    /**
     * 注册群信息更新监听
     *
     * @param register
     */
    private void registerTeamUpdateObserver(boolean register) {
        NimUIKit.getTeamChangedObservable().registerTeamDataChangedObserver(teamDataChangedObserver, register);
        NimUIKit.getTeamChangedObservable().registerTeamMemberDataChangedObserver(teamMemberDataChangedObserver, register);
        NimUIKit.getContactChangedObservable().registerObserver(friendDataChangedObserver, register);
    }

    /**
     * 群资料变动通知和移除群的通知（包括自己退群和群被解散）
     */
    TeamDataChangedObserver teamDataChangedObserver = new TeamDataChangedObserver() {
        @Override
        public void onUpdateTeams(List<Team> teams) {
            if (team == null) {
                return;
            }
            for (Team t : teams) {
                if (t.getId().equals(team.getId())) {
                    updateTeamInfo(t);
                    break;
                }
            }
        }

        @Override
        public void onRemoveTeam(Team team) {
            if (team == null) {
                return;
            }
            if (team.getId().equals(TeamMessageActivity.this.team.getId())) {
                updateTeamInfo(team);
            }
        }
    };

    /**
     * 群成员资料变动通知和移除群成员通知
     */
    TeamMemberDataChangedObserver teamMemberDataChangedObserver = new TeamMemberDataChangedObserver() {

        @Override
        public void onUpdateTeamMember(List<TeamMember> members) {
            fragment.refreshMessageList();
        }

        @Override
        public void onRemoveTeamMember(List<TeamMember> member) {
        }
    };

    ContactChangedObserver friendDataChangedObserver = new ContactChangedObserver() {
        @Override
        public void onAddedOrUpdatedFriends(List<String> accounts) {
            fragment.refreshMessageList();
        }

        @Override
        public void onDeletedFriends(List<String> accounts) {
            fragment.refreshMessageList();
        }

        @Override
        public void onAddUserToBlackList(List<String> account) {
            fragment.refreshMessageList();
        }

        @Override
        public void onRemoveUserFromBlackList(List<String> account) {
            fragment.refreshMessageList();
        }
    };

    @Override
    protected MessageFragment fragment() {
        // 添加fragment
        Bundle arguments = getIntent().getExtras();
        arguments.putSerializable(Extras.EXTRA_TYPE, SessionTypeEnum.Team);
        fragment = new TeamMessageFragment();
        fragment.setArguments(arguments);
        fragment.setContainerId(R.id.message_fragment_container);
        return fragment;
    }

    @Override
    protected int getContentViewId() {
        return R.layout.nim_team_message_activity;
    }

    @Override
    protected void initToolBar() {
        ToolBarOptions options = new NimToolBarOptions();
        options.titleString = "群聊";
        setToolBar(R.id.toolbar, options);
    }

    @Override
    protected boolean enableSensor() {
        return true;
    }

    @Override
    public void onBackPressed() {
        super.onBackPressed();
        if (backToClass != null) {
            Intent intent = new Intent();
            intent.setClass(this, backToClass);
            intent.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP | Intent.FLAG_ACTIVITY_SINGLE_TOP);
            startActivity(intent);
            finish();
        }
    }

    private void getLocationPermission(){
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {//版本6.0以上
            AndPermission.with(this)
                    .permission(Manifest.permission.CAMERA, Manifest.permission.READ_PHONE_STATE,
                            Manifest.permission.READ_LOGS, Manifest.permission_group.STORAGE,
                            Manifest.permission.MOUNT_UNMOUNT_FILESYSTEMS,
                            Manifest.permission.CALL_PHONE,
                            Manifest.permission.RECORD_AUDIO, Manifest.permission.READ_EXTERNAL_STORAGE,
                            Manifest.permission.WRITE_EXTERNAL_STORAGE, Manifest.permission.ACCESS_FINE_LOCATION, Manifest.permission.ACCESS_COARSE_LOCATION)
                    .callback(listener)
                    .requestCode(200)
                    .start();
        } else {

        }
    }
    private PermissionListener listener = new PermissionListener() {
        @Override
        public void onSucceed(int requestCode, List<String> grantedPermissions) {
            if (requestCode==200){

            }
        }

        @Override
        public void onFailed(int requestCode, List<String> deniedPermissions) {
            if (requestCode==200){

            }
        }
    };
}
