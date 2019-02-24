package com.bef.effectsdk.message;

import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
import android.os.Message;
import android.support.annotation.Keep;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

@Keep
public class MessageCenter {
    public static final int MSG_CLIENT_TO_SDK_CHALLENGE_GAME = 4103;
    public static final int MSG_CLIENT_TO_SDK_PUASE_GAME = 4100;
    public static final int MSG_CLIENT_TO_SDK_RESTART_GAME = 4102;
    public static final int MSG_CLIENT_TO_SDK_RESUME_GAME = 4101;
    public static final int MSG_CLIENT_TO_SDK_START_GAME = 4097;
    public static final int MSG_CLINET_TO_SDK_FINISH_GAME = 4098;
    public static final int MSG_ERROR_TYPE_CONFIG = 4097;
    public static final int MSG_EVENT_2D_ANIMATION_CYCLE_FINISH = 5;
    public static final int MSG_EVENT_ALGORITHM_CHANGE_FACE_COUNT = 1;
    public static final int MSG_EVENT_BODY_DANCE_CATEGORY_ADJUST = 1;
    public static final int MSG_EVENT_BODY_DANCE_CATEGORY_SCORE = 2;
    public static final int MSG_EVENT_ENIGMA_COMPLETE = 1;
    public static final int MSG_EVENT_LOAD_FAIL = 4;
    public static final int MSG_EVENT_LOAD_INIT = 1;
    public static final int MSG_EVENT_LOAD_LOADING = 2;
    public static final int MSG_EVENT_LOAD_SUCCESS = 3;
    public static final int MSG_ID_BEGIN = 16;
    public static final int MSG_SDK_TO_CLIENT_END_GAME_REQ = 4099;
    public static final int MSG_SDK_TO_CLIENT_GAME_RESOURCE_LOADED = 4104;
    public static final int MSG_TYPE_2D_ANIMATION_CYCLE = 18;
    public static final int MSG_TYPE_ALGORITHM_CHANGE = 23;
    public static final int MSG_TYPE_APP_STATUS = 22;
    public static final int MSG_TYPE_AUDIO_PLAYER = 21;
    public static final int MSG_TYPE_BODY_DANCE = 19;
    public static final int MSG_TYPE_EFFECT = 20;
    public static final int MSG_TYPE_RESOURCE = 17;
    public static final int MSG_TYPE_TYPE_ENIGMA = 24;
    private static final String TAG = "MessageCenter";
    private static List<MessageInterceptor> sInterceptors = new ArrayList();
    private static Listener sListener;
    private static HandlerThread sMessageCenterThread;
    private static Handler sMessageHandler;

    public interface Listener {
        void onMessageReceived(int i, int i2, int i3, String str);
    }

    private static class MessageHandler extends Handler {
        public MessageHandler(Looper looper) {
            super(looper);
        }

        public void handleMessage(Message message) {
            MessageCenter.handleMessage(message);
        }
    }

    public static synchronized void setListener(Listener listener) {
        synchronized (MessageCenter.class) {
            sListener = listener;
        }
    }

    public static synchronized void init() {
        synchronized (MessageCenter.class) {
            if (sMessageCenterThread == null || !sMessageCenterThread.isAlive()) {
                sMessageCenterThread = new HandlerThread(TAG);
                sMessageCenterThread.start();
            }
            sMessageHandler = new MessageHandler(sMessageCenterThread.getLooper());
            installBuiltinInterceptor();
        }
    }

    private static void installBuiltinInterceptor() {
    }

    public static synchronized void destroy() {
        synchronized (MessageCenter.class) {
            if (sMessageCenterThread != null) {
                sMessageCenterThread.quit();
                sMessageCenterThread = null;
            }
            if (sMessageHandler != null) {
                sMessageHandler.removeCallbacksAndMessages(null);
                sMessageHandler = null;
            }
            for (MessageInterceptor destroy : sInterceptors) {
                destroy.destroy();
            }
            sInterceptors.clear();
            sListener = null;
        }
    }

    @Keep
    private static synchronized void postMessage(int i, int i2, int i3, String str) {
        synchronized (MessageCenter.class) {
            if (sMessageHandler == null) {
                return;
            }
            Message.obtain(sMessageHandler, i, i2, i3, str).sendToTarget();
        }
    }

    private static synchronized void handleMessage(Message message) {
        synchronized (MessageCenter.class) {
            Iterator it = sInterceptors.iterator();
            while (it.hasNext() && !((MessageInterceptor) it.next()).intercept(message)) {
            }
            if (sListener != null) {
                sListener.onMessageReceived(message.what, message.arg1, message.arg2, (String) message.obj);
            }
        }
    }
}
