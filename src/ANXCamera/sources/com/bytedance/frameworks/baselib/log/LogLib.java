package com.bytedance.frameworks.baselib.log;

import android.content.Context;
import java.io.UnsupportedEncodingException;

public final class LogLib {
    public static final String CHARSET_NAME = "UTF-8";
    private static boolean sInited;
    private static ILogDelegate sLogDelegateImpl = new DefaultLogDelegateImpl();

    public interface ILogDelegate {
        boolean isNetworkAvailable(Context context);
    }

    public static class DefaultLogDelegateImpl implements ILogDelegate {
        public boolean isNetworkAvailable(Context context) {
            return false;
        }
    }

    public static void init(ILogDelegate iLogDelegate) {
        if (!sInited) {
            if (iLogDelegate != null) {
                sLogDelegateImpl = iLogDelegate;
            }
            sInited = true;
        }
    }

    static boolean isNetworkAvailable(Context context) {
        return sLogDelegateImpl.isNetworkAvailable(context);
    }

    public static byte[] safeGetBytes(String str) {
        byte[] bytes;
        if (str != null) {
            try {
                if (str.length() > 0) {
                    bytes = str.getBytes("UTF-8");
                    return bytes;
                }
            } catch (UnsupportedEncodingException e) {
                return str.getBytes();
            }
        }
        bytes = null;
        return bytes;
    }
}
