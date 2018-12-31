package com.android.camera.network.download;

import android.net.Uri;
import android.text.TextUtils;
import com.android.camera.fragment.CtaNoticeFragment.CTA;
import com.android.camera.log.Log;
import com.android.camera.network.util.NetworkUtils;
import java.net.HttpURLConnection;
import java.net.URL;

class ConnectionHelper {
    public static final int NETWORK_TYPE_METERED = 0;
    public static final int NETWORK_TYPE_UNMETERED = 1;
    public static final int REASON_ILLEGAL_ACTIVE_NETWORK = 3;
    public static final int REASON_IO_EXCEPTION = 4;
    public static final int REASON_NETWORK_DENIED = 2;
    public static final int REASON_NO_NETWORK = 1;
    public static final int REASON_SUCCESS = 0;
    private static final String TAG = "ConnectionManager";

    static final class Holder<T> {
        public final int reason;
        public final T value;

        public Holder(T t) {
            this.value = t;
            this.reason = 0;
        }

        public Holder(int i) {
            this.value = null;
            this.reason = i;
        }
    }

    ConnectionHelper() {
    }

    static Holder<HttpURLConnection> open(Uri uri, int i) {
        Object scheme = uri.getScheme();
        if (TextUtils.equals(scheme, "http") || TextUtils.equals(scheme, "https")) {
            return open(uri.toString(), i);
        }
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("not support scheme ");
        stringBuilder.append(scheme);
        throw new IllegalArgumentException(stringBuilder.toString());
    }

    static Holder<HttpURLConnection> open(String str, int i) {
        i = verify(i);
        if (i != 0) {
            return new Holder(i);
        }
        try {
            Log.d(TAG, "try open http connection");
            return new Holder((HttpURLConnection) new URL(str).openConnection());
        } catch (Throwable e) {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("invalid url ");
            stringBuilder.append(str);
            throw new IllegalArgumentException(stringBuilder.toString(), e);
        } catch (Throwable e2) {
            Log.w(TAG, e2);
            return new Holder(4);
        }
    }

    private static int verify(int i) {
        Log.d(TAG, "refreshing network state");
        if (!NetworkUtils.isNetworkConnected()) {
            return 1;
        }
        if (!CTA.canConnectNetwork()) {
            return 2;
        }
        if (i == 1 && NetworkUtils.isActiveNetworkMetered()) {
            return 3;
        }
        return 0;
    }
}
