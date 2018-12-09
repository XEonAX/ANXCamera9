package com.ss.android.ugc.effectmanager.common;

import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import java.lang.ref.WeakReference;

public class WeakHandler extends Handler {
    WeakReference<IHandler> mRef;

    public interface IHandler {
        void handleMsg(Message message);
    }

    public WeakHandler(IHandler iHandler) {
        super(Looper.getMainLooper());
        this.mRef = new WeakReference(iHandler);
    }

    public WeakHandler(Looper looper, IHandler iHandler) {
        super(looper);
        this.mRef = new WeakReference(iHandler);
    }

    public void handleMessage(Message message) {
        IHandler iHandler = (IHandler) this.mRef.get();
        if (iHandler != null && message != null) {
            iHandler.handleMsg(message);
        }
    }
}
