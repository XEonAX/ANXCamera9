package com.android.camera.network.live;

import com.android.camera.log.Log;
import com.android.camera.network.net.base.ErrorCode;
import com.android.camera.network.net.base.ResponseListener;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;
import okhttp3.Call;
import okhttp3.Callback;
import okhttp3.OkHttpClient;
import okhttp3.Request.Builder;
import okhttp3.Response;

public abstract class BaseRequest<T> {
    protected static final OkHttpClient CLIENT = new OkHttpClient();
    protected static final String TAG = "BaseRequest";
    protected Map<String, String> mParams = new HashMap();
    protected String mUrl;

    protected abstract T process(String str) throws BaseRequestException;

    public BaseRequest(String str) {
        this.mUrl = str;
    }

    protected void addParam(String str, String str2) {
        this.mParams.put(str, str2);
    }

    public void execute(final ResponseListener responseListener) {
        CLIENT.newCall(new Builder().get().url(appendUrlParams()).build()).enqueue(new Callback() {
            public void onFailure(Call call, IOException iOException) {
                Log.e(BaseRequest.TAG, "execute failed", iOException);
                responseListener.onResponseError(ErrorCode.NET_ERROR, iOException.getMessage(), iOException);
            }

            public void onResponse(Call call, Response response) {
                if (response.isSuccessful()) {
                    try {
                        Object process = BaseRequest.this.process(response.body().string());
                        responseListener.onResponse(process);
                    } catch (Throwable e) {
                        Log.e(BaseRequest.TAG, "execute process failed", e);
                        responseListener.onResponseError(e.getErrorCode(), e.getMessage(), response);
                    } catch (Throwable e2) {
                        Log.e(BaseRequest.TAG, "execute process failed", e2);
                        responseListener.onResponseError(ErrorCode.NET_ERROR, e2.getMessage(), response);
                    }
                } else {
                    responseListener.onResponseError(ErrorCode.SERVER_ERROR, response.message(), response);
                }
                response.close();
            }
        });
    }

    private String appendUrlParams() {
        if (this.mUrl == null || this.mParams == null || this.mParams.isEmpty()) {
            return this.mUrl;
        }
        StringBuilder stringBuilder = new StringBuilder(this.mUrl);
        if (this.mUrl.indexOf(63) > 0) {
            if (!(this.mUrl.endsWith("?") || this.mUrl.endsWith("&"))) {
                stringBuilder.append("&");
            }
            stringBuilder.append(encodeParameters(this.mParams, "UTF-8"));
            return stringBuilder.toString();
        }
        stringBuilder.append("?");
        stringBuilder.append(encodeParameters(this.mParams, "UTF-8"));
        return stringBuilder.toString();
    }

    private String encodeParameters(Map<String, String> map, String str) {
        StringBuilder stringBuilder = new StringBuilder();
        try {
            for (Entry entry : map.entrySet()) {
                stringBuilder.append(URLEncoder.encode((String) entry.getKey(), str));
                stringBuilder.append('=');
                stringBuilder.append(URLEncoder.encode((String) entry.getValue(), str));
                stringBuilder.append('&');
            }
            return stringBuilder.toString();
        } catch (Throwable e) {
            StringBuilder stringBuilder2 = new StringBuilder();
            stringBuilder2.append("Encoding not supported: ");
            stringBuilder2.append(str);
            throw new RuntimeException(stringBuilder2.toString(), e);
        }
    }
}
