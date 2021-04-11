package com.cgm.api;

import android.os.Parcel;
import android.os.Parcelable;

public class RequestData implements Parcelable {
    private String status;//状态码
    private String message;//消息内容
    private String data;
    private String error;
    private String result;
    private String code;

    private String success;
    private Long timestamp;

    public String getSuccess() {
        return success;
    }

    public void setSuccess(String success) {
        this.success = success;
    }

    public Long getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(Long timestamp) {
        this.timestamp = timestamp;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

    public RequestData() {
    }

    @Override
    public int describeContents() {
        return 0;
    }

    @Override
    public void writeToParcel(Parcel dest, int flags) {
        dest.writeString(this.status);
        dest.writeString(this.message);
        dest.writeString(this.data);
        dest.writeString(this.error);
        dest.writeString(this.result);
        dest.writeString(this.code);
        dest.writeString(this.success);
        dest.writeValue(this.timestamp);
    }

    protected RequestData(Parcel in) {
        this.status = in.readString();
        this.message = in.readString();
        this.data = in.readString();
        this.error = in.readString();
        this.result = in.readString();
        this.code = in.readString();
        this.success = in.readString();
        this.timestamp = (Long) in.readValue(Long.class.getClassLoader());
    }

    public static final Creator<RequestData> CREATOR = new Creator<RequestData>() {
        @Override
        public RequestData createFromParcel(Parcel source) {
            return new RequestData(source);
        }

        @Override
        public RequestData[] newArray(int size) {
            return new RequestData[size];
        }
    };
}
