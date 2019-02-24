package com.android.volley;

import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.text.TextUtils;
import com.android.volley.Cache.C0002Entry;
import com.android.volley.Request.C0020Priority;
import com.android.volley.Response.C0025ErrorListener;
import com.android.volley.VolleyLog.C0031MarkerLog;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Collections;
import java.util.Map;
import java.util.Map.Entry;

/* renamed from: com.android.volley.Request */
public abstract class C0021Request<T> implements Comparable<C0021Request<T>> {
    private static final String DEFAULT_PARAMS_ENCODING = "UTF-8";
    private static final long SLOW_REQUEST_THRESHOLD_MS = 3000;
    private C0002Entry mCacheEntry;
    private boolean mCanceled;
    private final int mDefaultTrafficStatsTag;
    private final C0025ErrorListener mErrorListener;
    private final C0031MarkerLog mEventLog;
    private final int mMethod;
    private long mRequestBirthTime;
    private C0024RequestQueue mRequestQueue;
    private boolean mResponseDelivered;
    private C0006RetryPolicy mRetryPolicy;
    private Integer mSequence;
    private boolean mShouldCache;
    private Object mTag;
    private final String mUrl;

    protected abstract void deliverResponse(T t);

    protected abstract C0027Response<T> parseNetworkResponse(C0015NetworkResponse c0015NetworkResponse);

    @Deprecated
    public C0021Request(String url, C0025ErrorListener listener) {
        this(-1, url, listener);
    }

    public C0021Request(int method, String url, C0025ErrorListener listener) {
        this.mEventLog = C0031MarkerLog.ENABLED ? new C0031MarkerLog() : null;
        this.mShouldCache = true;
        this.mCanceled = false;
        this.mResponseDelivered = false;
        this.mRequestBirthTime = 0;
        this.mCacheEntry = null;
        this.mMethod = method;
        this.mUrl = url;
        this.mErrorListener = listener;
        setRetryPolicy(new C0007DefaultRetryPolicy());
        this.mDefaultTrafficStatsTag = C0021Request.findDefaultTrafficStatsTag(url);
    }

    public int getMethod() {
        return this.mMethod;
    }

    public C0021Request<?> setTag(Object tag) {
        this.mTag = tag;
        return this;
    }

    public Object getTag() {
        return this.mTag;
    }

    public int getTrafficStatsTag() {
        return this.mDefaultTrafficStatsTag;
    }

    private static int findDefaultTrafficStatsTag(String url) {
        if (!TextUtils.isEmpty(url)) {
            Uri uri = Uri.parse(url);
            if (uri != null) {
                String host = uri.getHost();
                if (host != null) {
                    return host.hashCode();
                }
            }
        }
        return 0;
    }

    public C0021Request<?> setRetryPolicy(C0006RetryPolicy retryPolicy) {
        this.mRetryPolicy = retryPolicy;
        return this;
    }

    public void addMarker(String tag) {
        if (C0031MarkerLog.ENABLED) {
            this.mEventLog.add(tag, Thread.currentThread().getId());
        } else if (this.mRequestBirthTime == 0) {
            this.mRequestBirthTime = SystemClock.elapsedRealtime();
        }
    }

    void finish(String tag) {
        if (this.mRequestQueue != null) {
            this.mRequestQueue.finish(this);
        }
        if (C0031MarkerLog.ENABLED) {
            long threadId = Thread.currentThread().getId();
            if (Looper.myLooper() != Looper.getMainLooper()) {
                new Handler(Looper.getMainLooper()).post(/* anonymous class already generated */);
            } else {
                this.mEventLog.add(tag, threadId);
                this.mEventLog.finish(toString());
            }
        } else {
            if (SystemClock.elapsedRealtime() - this.mRequestBirthTime >= SLOW_REQUEST_THRESHOLD_MS) {
                C0032VolleyLog.d("%d ms: %s", Long.valueOf(SystemClock.elapsedRealtime() - this.mRequestBirthTime), toString());
            }
        }
    }

    public C0021Request<?> setRequestQueue(C0024RequestQueue requestQueue) {
        this.mRequestQueue = requestQueue;
        return this;
    }

    public final C0021Request<?> setSequence(int sequence) {
        this.mSequence = Integer.valueOf(sequence);
        return this;
    }

    public final int getSequence() {
        if (this.mSequence != null) {
            return this.mSequence.intValue();
        }
        throw new IllegalStateException("getSequence called before setSequence");
    }

    public String getUrl() {
        return this.mUrl;
    }

    public String getCacheKey() {
        return getUrl();
    }

    public C0021Request<?> setCacheEntry(C0002Entry entry) {
        this.mCacheEntry = entry;
        return this;
    }

    public C0002Entry getCacheEntry() {
        return this.mCacheEntry;
    }

    public void cancel() {
        this.mCanceled = true;
    }

    public boolean isCanceled() {
        return this.mCanceled;
    }

    public Map<String, String> getHeaders() throws C0001AuthFailureError {
        return Collections.emptyMap();
    }

    @Deprecated
    protected Map<String, String> getPostParams() throws C0001AuthFailureError {
        return getParams();
    }

    @Deprecated
    protected String getPostParamsEncoding() {
        return getParamsEncoding();
    }

    @Deprecated
    public String getPostBodyContentType() {
        return getBodyContentType();
    }

    @Deprecated
    public byte[] getPostBody() throws C0001AuthFailureError {
        Map<String, String> postParams = getPostParams();
        if (postParams == null || postParams.size() <= 0) {
            return null;
        }
        return encodeParameters(postParams, getPostParamsEncoding());
    }

    protected Map<String, String> getParams() throws C0001AuthFailureError {
        return null;
    }

    protected String getParamsEncoding() {
        return "UTF-8";
    }

    public String getBodyContentType() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("application/x-www-form-urlencoded; charset=");
        stringBuilder.append(getParamsEncoding());
        return stringBuilder.toString();
    }

    public byte[] getBody() throws C0001AuthFailureError {
        Map<String, String> params = getParams();
        if (params == null || params.size() <= 0) {
            return null;
        }
        return encodeParameters(params, getParamsEncoding());
    }

    private byte[] encodeParameters(Map<String, String> params, String paramsEncoding) {
        StringBuilder encodedParams = new StringBuilder();
        try {
            for (Entry<String, String> entry : params.entrySet()) {
                encodedParams.append(URLEncoder.encode((String) entry.getKey(), paramsEncoding));
                encodedParams.append('=');
                encodedParams.append(URLEncoder.encode((String) entry.getValue(), paramsEncoding));
                encodedParams.append('&');
            }
            return encodedParams.toString().getBytes(paramsEncoding);
        } catch (UnsupportedEncodingException uee) {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("Encoding not supported: ");
            stringBuilder.append(paramsEncoding);
            throw new RuntimeException(stringBuilder.toString(), uee);
        }
    }

    public final C0021Request<?> setShouldCache(boolean shouldCache) {
        this.mShouldCache = shouldCache;
        return this;
    }

    public final boolean shouldCache() {
        return this.mShouldCache;
    }

    public C0020Priority getPriority() {
        return C0020Priority.NORMAL;
    }

    public final int getTimeoutMs() {
        return this.mRetryPolicy.getCurrentTimeout();
    }

    public C0006RetryPolicy getRetryPolicy() {
        return this.mRetryPolicy;
    }

    public void markDelivered() {
        this.mResponseDelivered = true;
    }

    public boolean hasHadResponseDelivered() {
        return this.mResponseDelivered;
    }

    protected C0000VolleyError parseNetworkError(C0000VolleyError volleyError) {
        return volleyError;
    }

    public void deliverError(C0000VolleyError error) {
        if (this.mErrorListener != null) {
            this.mErrorListener.onErrorResponse(error);
        }
    }

    public int compareTo(C0021Request<T> other) {
        int intValue;
        int intValue2;
        C0020Priority left = getPriority();
        C0020Priority right = other.getPriority();
        if (left == right) {
            intValue = this.mSequence.intValue();
            intValue2 = other.mSequence.intValue();
        } else {
            intValue = right.ordinal();
            intValue2 = left.ordinal();
        }
        return intValue - intValue2;
    }

    public String toString() {
        String trafficStatsTag = new StringBuilder();
        trafficStatsTag.append("0x");
        trafficStatsTag.append(Integer.toHexString(getTrafficStatsTag()));
        trafficStatsTag = trafficStatsTag.toString();
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(this.mCanceled ? "[X] " : "[ ] ");
        stringBuilder.append(getUrl());
        stringBuilder.append(" ");
        stringBuilder.append(trafficStatsTag);
        stringBuilder.append(" ");
        stringBuilder.append(getPriority());
        stringBuilder.append(" ");
        stringBuilder.append(this.mSequence);
        return stringBuilder.toString();
    }
}
