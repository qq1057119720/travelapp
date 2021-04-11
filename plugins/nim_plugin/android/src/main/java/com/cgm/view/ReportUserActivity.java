package com.cgm.view;

import android.app.Activity;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.os.CountDownTimer;
import android.text.TextUtils;
import android.view.View;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.TextView;
import android.widget.Toast;

import androidx.annotation.Nullable;

import com.netease.nim.uikit.R;


/**
 * @author lgx
 * @date 2020/4/20.
 * description： 举报用户
 */
public class ReportUserActivity extends Activity {
    TextView tvWuru;
    TextView tvLaji;
    TextView tvSeqing;
    TextView tvWeifa;
    EditText etYuanyin;
    TextView tvQueding;
    LinearLayout llReport;
    LinearLayout llReportSuccess;
    TextView tvSuccess;
    View rlBaseView;
    private int selectItem=-1;
    private String nickname;
    private String sessionId;
    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.nim_activity_report_user);
        nickname=getIntent().getStringExtra("nickname");
        sessionId=getIntent().getStringExtra("sessionId");
        tvWeifa=findViewById(R.id.tv_weifa);
        tvWuru=findViewById(R.id.tv_wuru);
        tvLaji=findViewById(R.id.tv_laji);
        tvSeqing=findViewById(R.id.tv_seqing);
        etYuanyin=findViewById(R.id.et_yuanyin);
        tvQueding=findViewById(R.id.tv_queding);
        llReport=findViewById(R.id.ll_report);
        llReportSuccess=findViewById(R.id.ll_report_success);
        llReport.setVisibility(View.VISIBLE);
        llReportSuccess.setVisibility(View.GONE);
        tvSuccess=findViewById(R.id.tv_success);
        rlBaseView=findViewById(R.id.v_base_view);
        tvSuccess.setText(nickname);
        initClick();

    }
    private void initClick(){
        rlBaseView.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                finish();
            }
        });
        tvWeifa.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                selectItem=4;
                chanegeDrawableLeft(R.drawable.chat_report_selected,tvWeifa);
                chanegeDrawableLeft(R.drawable.chat_report_unselect,tvWuru);
                chanegeDrawableLeft(R.drawable.chat_report_unselect,tvLaji);
                chanegeDrawableLeft(R.drawable.chat_report_unselect,tvSeqing);
            }
        });

        tvWuru.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                selectItem=1;
                chanegeDrawableLeft(R.drawable.chat_report_selected,tvWuru);
                chanegeDrawableLeft(R.drawable.chat_report_unselect,tvWeifa);
                chanegeDrawableLeft(R.drawable.chat_report_unselect,tvLaji);
                chanegeDrawableLeft(R.drawable.chat_report_unselect,tvSeqing);
            }
        });


        tvLaji.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                selectItem=2;
                chanegeDrawableLeft(R.drawable.chat_report_selected,tvLaji);
                chanegeDrawableLeft(R.drawable.chat_report_unselect,tvWeifa);
                chanegeDrawableLeft(R.drawable.chat_report_unselect,tvWuru);
                chanegeDrawableLeft(R.drawable.chat_report_unselect,tvSeqing);
            }
        });

        tvSeqing.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                selectItem=3;
                chanegeDrawableLeft(R.drawable.chat_report_selected,tvSeqing);
                chanegeDrawableLeft(R.drawable.chat_report_unselect,tvWeifa);
                chanegeDrawableLeft(R.drawable.chat_report_unselect,tvWuru);
                chanegeDrawableLeft(R.drawable.chat_report_unselect,tvLaji);
            }
        });
        tvQueding.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if (TextUtils.isEmpty(etYuanyin.getText().toString().trim())){
                    Toast.makeText(ReportUserActivity.this,"请输入举报原因",Toast.LENGTH_LONG).show();
                    return;
                }
                if (selectItem<0){
                    Toast.makeText(ReportUserActivity.this,"请选择举报类型",Toast.LENGTH_LONG).show();
                    return;
                }
                llReport.setVisibility(View.GONE);
                llReportSuccess.setVisibility(View.VISIBLE);

                /** 倒计时60秒，一次1秒 */
                CountDownTimer timer = new CountDownTimer(1000, 1000) {
                    @Override
                    public void onTick(long millisUntilFinished) {
                        // TODO Auto-generated method stub

                    }

                    @Override
                    public void onFinish() {
                        finish();
                    }
                }.start();

            }
        });

    }

    private void chanegeDrawableLeft(int imageid, TextView view) {
        Drawable icon = getResources().getDrawable(imageid);
        icon.setBounds(0, 0, icon.getMinimumWidth(), icon.getMinimumHeight());
        view.setCompoundDrawables(icon, null, null, null);
    }


}
