package com.cgm.view;

import android.app.Activity;
import android.content.Intent;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.os.CountDownTimer;
import android.text.TextUtils;
import android.view.View;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

import androidx.annotation.Nullable;

import com.netease.nim.uikit.R;


/**
 * @author lgx
 * @date 2020/4/20.
 * description： 举报用户
 */
public class FinishCourseActivity extends Activity {
    TextView tv_day;
    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.nim_fragment_finish_course);
        tv_day=findViewById(R.id.tv_day);
        String day=getIntent().getStringExtra("day");
        if (!TextUtils.isEmpty(day)){
            String []dayList=day.split("\\.");

            tv_day.setText(dayList[0]+"天之后结束");
        }

        initClick();

    }
    private void initClick(){
        findViewById(R.id.tv_close).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                finish();
            }
        });
//        findViewById(R.id.v_base_view).setOnClickListener(new View.OnClickListener() {
//            @Override
//            public void onClick(View v) {
//                finish();
//            }
//        });
        findViewById(R.id.tv_jiesuan).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent=new Intent();
                setResult(111,intent);
                finish();

            }
        });
    }

    private void chanegeDrawableLeft(int imageid, TextView view) {
        Drawable icon = getResources().getDrawable(imageid);
        icon.setBounds(0, 0, icon.getMinimumWidth(), icon.getMinimumHeight());
        view.setCompoundDrawables(icon, null, null, null);
    }


}
