package com.netease.nim.uikit.business.session.actions;

import com.netease.nim.uikit.R;
import com.netease.nim.uikit.api.model.location.LocationProvider;
import com.netease.nim.uikit.impl.NimUIKitImpl;
import com.netease.nimlib.sdk.msg.MessageBuilder;
import com.netease.nimlib.sdk.msg.model.IMMessage;

/**
 * Created by hzxuwen on 2015/6/12.
 */
public class QuestionAction extends BaseAction {
    private final static String TAG = "LocationAction";
    private QuestionActionListener questionActionListener;
    public QuestionAction(QuestionActionListener questionActionListener) {

        super(R.drawable.chat_wenti_icon, R.string.input_panel_location);
        this.questionActionListener=questionActionListener;
    }

    @Override
    public void onClick() {
       if (questionActionListener!=null){
           questionActionListener.toPushQuestion();
       }
    }
    public interface QuestionActionListener{
        void toPushQuestion();
    }
}
