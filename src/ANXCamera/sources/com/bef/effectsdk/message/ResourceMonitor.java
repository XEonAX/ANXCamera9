package com.bef.effectsdk.message;

import android.os.Message;
import android.text.TextUtils;

public class ResourceMonitor implements MessageInterceptor {
    private static final String TAG = "ResourceMonitor";
    private Listener mListener;

    public interface Listener {
        void onResourceLoadFinish(String str, boolean z);
    }

    void setListener(Listener listener) {
        this.mListener = listener;
    }

    public boolean intercept(Message message) {
        if (17 != message.what) {
            return false;
        }
        String str = (String) message.obj;
        if (TextUtils.isEmpty(str)) {
            return true;
        }
        switch (message.arg1) {
            case 3:
                if (this.mListener != null) {
                    this.mListener.onResourceLoadFinish(str, true);
                    break;
                }
                break;
            case 4:
                if (this.mListener != null) {
                    this.mListener.onResourceLoadFinish(str, false);
                    break;
                }
                break;
        }
        return true;
    }

    public void destroy() {
        this.mListener = null;
    }

    public void reset() {
    }
}
