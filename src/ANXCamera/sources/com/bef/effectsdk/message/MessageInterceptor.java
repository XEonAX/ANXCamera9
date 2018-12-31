package com.bef.effectsdk.message;

import android.os.Message;

public interface MessageInterceptor {
    void destroy();

    boolean intercept(Message message);
}
