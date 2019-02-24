package com.android.camera.network.live;

import com.android.camera.network.net.base.ErrorCode;
import org.json.JSONException;
import org.json.JSONObject;

public abstract class BaseJsonRequest<T> extends BaseRequest<T> {
    protected abstract T processJson(JSONObject jSONObject) throws BaseRequestException, JSONException;

    public BaseJsonRequest(String str) {
        super(str);
    }

    protected T process(String str) throws BaseRequestException {
        try {
            return processJson(new JSONObject(str));
        } catch (Throwable e) {
            throw new BaseRequestException(ErrorCode.PARSE_ERROR, e.getMessage(), e);
        }
    }
}
