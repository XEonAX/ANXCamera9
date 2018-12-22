package com.android.volley.toolbox;

import android.os.SystemClock;
import com.android.volley.Cache.Entry;
import com.android.volley.Header;
import com.android.volley.Network;
import com.android.volley.Request;
import com.android.volley.RetryPolicy;
import com.android.volley.VolleyError;
import com.android.volley.VolleyLog;
import com.ss.android.ttve.common.TEDefine;
import com.ss.android.vesdk.runtime.cloudconfig.HttpRequest;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;
import java.util.TreeSet;

public class BasicNetwork implements Network {
    protected static final boolean DEBUG = VolleyLog.DEBUG;
    private static final int DEFAULT_POOL_SIZE = 4096;
    private static final int SLOW_REQUEST_THRESHOLD_MS = 3000;
    private final BaseHttpStack mBaseHttpStack;
    @Deprecated
    protected final HttpStack mHttpStack;
    protected final ByteArrayPool mPool;

    @Deprecated
    public BasicNetwork(HttpStack httpStack) {
        this(httpStack, new ByteArrayPool(4096));
    }

    @Deprecated
    public BasicNetwork(HttpStack httpStack, ByteArrayPool byteArrayPool) {
        this.mHttpStack = httpStack;
        this.mBaseHttpStack = new AdaptedHttpStack(httpStack);
        this.mPool = byteArrayPool;
    }

    public BasicNetwork(BaseHttpStack baseHttpStack) {
        this(baseHttpStack, new ByteArrayPool(4096));
    }

    public BasicNetwork(BaseHttpStack baseHttpStack, ByteArrayPool byteArrayPool) {
        this.mBaseHttpStack = baseHttpStack;
        this.mHttpStack = baseHttpStack;
        this.mPool = byteArrayPool;
    }

    /* JADX WARNING: Removed duplicated region for block: B:78:0x0162 A:{Splitter: B:2:0x0011, ExcHandler: java.net.SocketTimeoutException (e java.net.SocketTimeoutException)} */
    /* JADX WARNING: Removed duplicated region for block: B:75:0x0146 A:{Splitter: B:2:0x0011, ExcHandler: java.net.MalformedURLException (r0_32 'e' java.lang.Throwable)} */
    /* JADX WARNING: Removed duplicated region for block: B:91:0x0140 A:{SYNTHETIC} */
    /* JADX WARNING: Removed duplicated region for block: B:48:0x00c3  */
    /* JADX WARNING: Removed duplicated region for block: B:78:0x0162 A:{Splitter: B:2:0x0011, ExcHandler: java.net.SocketTimeoutException (e java.net.SocketTimeoutException)} */
    /* JADX WARNING: Removed duplicated region for block: B:75:0x0146 A:{Splitter: B:2:0x0011, ExcHandler: java.net.MalformedURLException (r0_32 'e' java.lang.Throwable)} */
    /* JADX WARNING: Removed duplicated region for block: B:48:0x00c3  */
    /* JADX WARNING: Removed duplicated region for block: B:91:0x0140 A:{SYNTHETIC} */
    /* JADX WARNING: Removed duplicated region for block: B:78:0x0162 A:{Splitter: B:2:0x0011, ExcHandler: java.net.SocketTimeoutException (e java.net.SocketTimeoutException)} */
    /* JADX WARNING: Removed duplicated region for block: B:75:0x0146 A:{Splitter: B:2:0x0011, ExcHandler: java.net.MalformedURLException (r0_32 'e' java.lang.Throwable)} */
    /* JADX WARNING: Removed duplicated region for block: B:91:0x0140 A:{SYNTHETIC} */
    /* JADX WARNING: Removed duplicated region for block: B:48:0x00c3  */
    /* JADX WARNING: Removed duplicated region for block: B:78:0x0162 A:{Splitter: B:2:0x0011, ExcHandler: java.net.SocketTimeoutException (e java.net.SocketTimeoutException)} */
    /* JADX WARNING: Removed duplicated region for block: B:75:0x0146 A:{Splitter: B:2:0x0011, ExcHandler: java.net.MalformedURLException (r0_32 'e' java.lang.Throwable)} */
    /* JADX WARNING: Removed duplicated region for block: B:48:0x00c3  */
    /* JADX WARNING: Removed duplicated region for block: B:91:0x0140 A:{SYNTHETIC} */
    /* JADX WARNING: Removed duplicated region for block: B:78:0x0162 A:{Splitter: B:2:0x0011, ExcHandler: java.net.SocketTimeoutException (e java.net.SocketTimeoutException)} */
    /* JADX WARNING: Removed duplicated region for block: B:75:0x0146 A:{Splitter: B:2:0x0011, ExcHandler: java.net.MalformedURLException (r0_32 'e' java.lang.Throwable)} */
    /* JADX WARNING: Removed duplicated region for block: B:91:0x0140 A:{SYNTHETIC} */
    /* JADX WARNING: Removed duplicated region for block: B:48:0x00c3  */
    /* JADX WARNING: Failed to process nested try/catch */
    /* JADX WARNING: Failed to process nested try/catch */
    /* JADX WARNING: Failed to process nested try/catch */
    /* JADX WARNING: Failed to process nested try/catch */
    /* JADX WARNING: Failed to process nested try/catch */
    /* JADX WARNING: Missing block: B:15:0x0060, code:
            r0 = e;
     */
    /* JADX WARNING: Missing block: B:16:0x0061, code:
            r15 = null;
            r19 = r13;
     */
    /* JADX WARNING: Missing block: B:38:0x00ad, code:
            r0 = e;
     */
    /* JADX WARNING: Missing block: B:39:0x00ae, code:
            r1 = r13;
     */
    /* JADX WARNING: Missing block: B:41:0x00b4, code:
            r0 = e;
     */
    /* JADX WARNING: Missing block: B:42:0x00b5, code:
            r1 = r13;
     */
    /* JADX WARNING: Missing block: B:43:0x00b7, code:
            r0 = e;
     */
    /* JADX WARNING: Missing block: B:44:0x00b8, code:
            r19 = r1;
            r15 = null;
     */
    /* JADX WARNING: Missing block: B:45:0x00bc, code:
            r0 = e;
     */
    /* JADX WARNING: Missing block: B:46:0x00bd, code:
            r19 = r1;
            r12 = null;
            r15 = r12;
     */
    /* JADX WARNING: Missing block: B:48:0x00c3, code:
            r0 = r12.getStatusCode();
            com.android.volley.VolleyLog.e("Unexpected response code %d for %s", java.lang.Integer.valueOf(r0), r29.getUrl());
     */
    /* JADX WARNING: Missing block: B:49:0x00dc, code:
            if (r15 != null) goto L_0x00de;
     */
    /* JADX WARNING: Missing block: B:50:0x00de, code:
            r13 = new com.android.volley.NetworkResponse(r0, r15, false, android.os.SystemClock.elapsedRealtime() - r9, r19);
     */
    /* JADX WARNING: Missing block: B:51:0x00ef, code:
            if (r0 == 401) goto L_0x012a;
     */
    /* JADX WARNING: Missing block: B:55:0x00f8, code:
            if (r0 < 400) goto L_0x0105;
     */
    /* JADX WARNING: Missing block: B:59:0x0104, code:
            throw new com.android.volley.ClientError(r13);
     */
    /* JADX WARNING: Missing block: B:61:0x0107, code:
            if (r0 < android.provider.MiuiSettings.System.SCREEN_KEY_LONG_PRESS_TIMEOUT_DEFAULT) goto L_0x0124;
     */
    /* JADX WARNING: Missing block: B:65:0x0111, code:
            if (r29.shouldRetryServerErrors() != false) goto L_0x0113;
     */
    /* JADX WARNING: Missing block: B:66:0x0113, code:
            attemptRetryOnException("server", r8, new com.android.volley.ServerError(r13));
     */
    /* JADX WARNING: Missing block: B:68:0x0123, code:
            throw new com.android.volley.ServerError(r13);
     */
    /* JADX WARNING: Missing block: B:70:0x0129, code:
            throw new com.android.volley.ServerError(r13);
     */
    /* JADX WARNING: Missing block: B:71:0x012a, code:
            attemptRetryOnException("auth", r8, new com.android.volley.AuthFailureError(r13));
     */
    /* JADX WARNING: Missing block: B:72:0x0135, code:
            attemptRetryOnException("network", r8, new com.android.volley.NetworkError());
     */
    /* JADX WARNING: Missing block: B:74:0x0145, code:
            throw new com.android.volley.NoConnectionError(r0);
     */
    /* JADX WARNING: Missing block: B:75:0x0146, code:
            r0 = move-exception;
     */
    /* JADX WARNING: Missing block: B:76:0x0147, code:
            r2 = new java.lang.StringBuilder();
            r2.append("Bad URL ");
            r2.append(r29.getUrl());
     */
    /* JADX WARNING: Missing block: B:77:0x0161, code:
            throw new java.lang.RuntimeException(r2.toString(), r0);
     */
    /* JADX WARNING: Missing block: B:79:0x0163, code:
            attemptRetryOnException("socket", r8, new com.android.volley.TimeoutError());
     */
    public com.android.volley.NetworkResponse performRequest(com.android.volley.Request<?> r29) throws com.android.volley.VolleyError {
        /*
        r28 = this;
        r7 = r28;
        r8 = r29;
        r9 = android.os.SystemClock.elapsedRealtime();
        r1 = java.util.Collections.emptyList();
        r11 = 0;
        r2 = 0;
        r0 = r29.getCacheEntry();	 Catch:{ SocketTimeoutException -> 0x0162, MalformedURLException -> 0x0146, IOException -> 0x00bc }
        r0 = r7.getCacheHeaders(r0);	 Catch:{ SocketTimeoutException -> 0x0162, MalformedURLException -> 0x0146, IOException -> 0x00bc }
        r3 = r7.mBaseHttpStack;	 Catch:{ SocketTimeoutException -> 0x0162, MalformedURLException -> 0x0146, IOException -> 0x00bc }
        r12 = r3.executeRequest(r8, r0);	 Catch:{ SocketTimeoutException -> 0x0162, MalformedURLException -> 0x0146, IOException -> 0x00bc }
        r14 = r12.getStatusCode();	 Catch:{ SocketTimeoutException -> 0x0162, MalformedURLException -> 0x0146, IOException -> 0x00b7 }
        r13 = r12.getHeaders();	 Catch:{ SocketTimeoutException -> 0x0162, MalformedURLException -> 0x0146, IOException -> 0x00b7 }
        r0 = 304; // 0x130 float:4.26E-43 double:1.5E-321;
        if (r14 != r0) goto L_0x0066;
    L_0x002b:
        r0 = r29.getCacheEntry();	 Catch:{ SocketTimeoutException -> 0x0162, MalformedURLException -> 0x0146, IOException -> 0x0060 }
        if (r0 != 0) goto L_0x0046;
    L_0x0031:
        r0 = new com.android.volley.NetworkResponse;	 Catch:{ SocketTimeoutException -> 0x0162, MalformedURLException -> 0x0146, IOException -> 0x0060 }
        r16 = 304; // 0x130 float:4.26E-43 double:1.5E-321;
        r17 = 0;
        r18 = 1;
        r3 = android.os.SystemClock.elapsedRealtime();	 Catch:{ SocketTimeoutException -> 0x0162, MalformedURLException -> 0x0146, IOException -> 0x0060 }
        r19 = r3 - r9;
        r15 = r0;
        r21 = r13;
        r15.<init>(r16, r17, r18, r19, r21);	 Catch:{ SocketTimeoutException -> 0x0162, MalformedURLException -> 0x0146, IOException -> 0x0060 }
        return r0;
    L_0x0046:
        r27 = combineHeaders(r13, r0);	 Catch:{ SocketTimeoutException -> 0x0162, MalformedURLException -> 0x0146, IOException -> 0x0060 }
        r1 = new com.android.volley.NetworkResponse;	 Catch:{ SocketTimeoutException -> 0x0162, MalformedURLException -> 0x0146, IOException -> 0x0060 }
        r22 = 304; // 0x130 float:4.26E-43 double:1.5E-321;
        r0 = r0.data;	 Catch:{ SocketTimeoutException -> 0x0162, MalformedURLException -> 0x0146, IOException -> 0x0060 }
        r24 = 1;
        r3 = android.os.SystemClock.elapsedRealtime();	 Catch:{ SocketTimeoutException -> 0x0162, MalformedURLException -> 0x0146, IOException -> 0x0060 }
        r25 = r3 - r9;
        r21 = r1;
        r23 = r0;
        r21.<init>(r22, r23, r24, r25, r27);	 Catch:{ SocketTimeoutException -> 0x0162, MalformedURLException -> 0x0146, IOException -> 0x0060 }
        return r1;
    L_0x0060:
        r0 = move-exception;
        r15 = r2;
        r19 = r13;
        goto L_0x00c1;
    L_0x0066:
        r0 = r12.getContent();	 Catch:{ SocketTimeoutException -> 0x0162, MalformedURLException -> 0x0146, IOException -> 0x00b4 }
        if (r0 == 0) goto L_0x0076;
        r1 = r12.getContentLength();	 Catch:{ SocketTimeoutException -> 0x0162, MalformedURLException -> 0x0146, IOException -> 0x0060 }
        r0 = r7.inputStreamToBytes(r0, r1);	 Catch:{ SocketTimeoutException -> 0x0162, MalformedURLException -> 0x0146, IOException -> 0x0060 }
        goto L_0x0078;
    L_0x0076:
        r0 = new byte[r11];	 Catch:{ SocketTimeoutException -> 0x0162, MalformedURLException -> 0x0146, IOException -> 0x00b4 }
    L_0x0078:
        r20 = r0;
        r0 = android.os.SystemClock.elapsedRealtime();	 Catch:{ SocketTimeoutException -> 0x0162, MalformedURLException -> 0x0146, IOException -> 0x00ad }
        r2 = r0 - r9;
        r1 = r7;
        r4 = r8;
        r5 = r20;
        r6 = r14;
        r1.logSlowRequests(r2, r4, r5, r6);	 Catch:{ SocketTimeoutException -> 0x0162, MalformedURLException -> 0x0146, IOException -> 0x00ad }
        r0 = 200; // 0xc8 float:2.8E-43 double:9.9E-322;
        if (r14 < r0) goto L_0x00a4;
    L_0x008c:
        r0 = 299; // 0x12b float:4.19E-43 double:1.477E-321;
        if (r14 > r0) goto L_0x00a4;
    L_0x0090:
        r0 = new com.android.volley.NetworkResponse;	 Catch:{ SocketTimeoutException -> 0x0162, MalformedURLException -> 0x0146, IOException -> 0x00ad }
        r16 = 0;
        r1 = android.os.SystemClock.elapsedRealtime();	 Catch:{ SocketTimeoutException -> 0x0162, MalformedURLException -> 0x0146, IOException -> 0x00ad }
        r17 = r1 - r9;
        r1 = r13;
        r13 = r0;
        r15 = r20;
        r19 = r1;
        r13.<init>(r14, r15, r16, r17, r19);	 Catch:{ SocketTimeoutException -> 0x0162, MalformedURLException -> 0x0146, IOException -> 0x00ab }
        return r0;
    L_0x00a4:
        r1 = r13;
        r0 = new java.io.IOException;	 Catch:{ SocketTimeoutException -> 0x0162, MalformedURLException -> 0x0146, IOException -> 0x00ab }
        r0.<init>();	 Catch:{ SocketTimeoutException -> 0x0162, MalformedURLException -> 0x0146, IOException -> 0x00ab }
        throw r0;	 Catch:{ SocketTimeoutException -> 0x0162, MalformedURLException -> 0x0146, IOException -> 0x00ab }
    L_0x00ab:
        r0 = move-exception;
        goto L_0x00af;
    L_0x00ad:
        r0 = move-exception;
        r1 = r13;
    L_0x00af:
        r19 = r1;
        r15 = r20;
        goto L_0x00c1;
    L_0x00b4:
        r0 = move-exception;
        r1 = r13;
        goto L_0x00b8;
    L_0x00b7:
        r0 = move-exception;
    L_0x00b8:
        r19 = r1;
        r15 = r2;
        goto L_0x00c1;
    L_0x00bc:
        r0 = move-exception;
        r19 = r1;
        r12 = r2;
        r15 = r12;
    L_0x00c1:
        if (r12 == 0) goto L_0x0140;
    L_0x00c3:
        r0 = r12.getStatusCode();
        r1 = "Unexpected response code %d for %s";
        r2 = 2;
        r2 = new java.lang.Object[r2];
        r3 = java.lang.Integer.valueOf(r0);
        r2[r11] = r3;
        r3 = 1;
        r4 = r29.getUrl();
        r2[r3] = r4;
        com.android.volley.VolleyLog.e(r1, r2);
        if (r15 == 0) goto L_0x0135;
    L_0x00de:
        r1 = new com.android.volley.NetworkResponse;
        r16 = 0;
        r2 = android.os.SystemClock.elapsedRealtime();
        r17 = r2 - r9;
        r13 = r1;
        r14 = r0;
        r13.<init>(r14, r15, r16, r17, r19);
        r2 = 401; // 0x191 float:5.62E-43 double:1.98E-321;
        if (r0 == r2) goto L_0x012a;
    L_0x00f1:
        r2 = 403; // 0x193 float:5.65E-43 double:1.99E-321;
        if (r0 != r2) goto L_0x00f6;
    L_0x00f5:
        goto L_0x012a;
    L_0x00f6:
        r2 = 400; // 0x190 float:5.6E-43 double:1.976E-321;
        if (r0 < r2) goto L_0x0105;
    L_0x00fa:
        r2 = 499; // 0x1f3 float:6.99E-43 double:2.465E-321;
        if (r0 <= r2) goto L_0x00ff;
    L_0x00fe:
        goto L_0x0105;
    L_0x00ff:
        r0 = new com.android.volley.ClientError;
        r0.<init>(r1);
        throw r0;
    L_0x0105:
        r2 = 500; // 0x1f4 float:7.0E-43 double:2.47E-321;
        if (r0 < r2) goto L_0x0124;
    L_0x0109:
        r2 = 599; // 0x257 float:8.4E-43 double:2.96E-321;
        if (r0 > r2) goto L_0x0124;
    L_0x010d:
        r0 = r29.shouldRetryServerErrors();
        if (r0 == 0) goto L_0x011e;
    L_0x0113:
        r0 = "server";
        r2 = new com.android.volley.ServerError;
        r2.<init>(r1);
        attemptRetryOnException(r0, r8, r2);
        goto L_0x016e;
    L_0x011e:
        r0 = new com.android.volley.ServerError;
        r0.<init>(r1);
        throw r0;
    L_0x0124:
        r0 = new com.android.volley.ServerError;
        r0.<init>(r1);
        throw r0;
    L_0x012a:
        r0 = "auth";
        r2 = new com.android.volley.AuthFailureError;
        r2.<init>(r1);
        attemptRetryOnException(r0, r8, r2);
        goto L_0x016e;
    L_0x0135:
        r0 = "network";
        r1 = new com.android.volley.NetworkError;
        r1.<init>();
        attemptRetryOnException(r0, r8, r1);
        goto L_0x016e;
    L_0x0140:
        r1 = new com.android.volley.NoConnectionError;
        r1.<init>(r0);
        throw r1;
    L_0x0146:
        r0 = move-exception;
        r1 = new java.lang.RuntimeException;
        r2 = new java.lang.StringBuilder;
        r2.<init>();
        r3 = "Bad URL ";
        r2.append(r3);
        r3 = r29.getUrl();
        r2.append(r3);
        r2 = r2.toString();
        r1.<init>(r2, r0);
        throw r1;
    L_0x0162:
        r0 = move-exception;
        r0 = "socket";
        r1 = new com.android.volley.TimeoutError;
        r1.<init>();
        attemptRetryOnException(r0, r8, r1);
    L_0x016e:
        goto L_0x0008;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.volley.toolbox.BasicNetwork.performRequest(com.android.volley.Request):com.android.volley.NetworkResponse");
    }

    private void logSlowRequests(long j, Request<?> request, byte[] bArr, int i) {
        if (DEBUG || j > 3000) {
            String str = "HTTP response for request=<%s> [lifetime=%d], [size=%s], [rc=%d], [retryCount=%s]";
            Object[] objArr = new Object[5];
            objArr[0] = request;
            objArr[1] = Long.valueOf(j);
            objArr[2] = bArr != null ? Integer.valueOf(bArr.length) : TEDefine.FACE_BEAUTY_NULL;
            objArr[3] = Integer.valueOf(i);
            objArr[4] = Integer.valueOf(request.getRetryPolicy().getCurrentRetryCount());
            VolleyLog.d(str, objArr);
        }
    }

    private static void attemptRetryOnException(String str, Request<?> request, VolleyError volleyError) throws VolleyError {
        RetryPolicy retryPolicy = request.getRetryPolicy();
        int timeoutMs = request.getTimeoutMs();
        try {
            retryPolicy.retry(volleyError);
            request.addMarker(String.format("%s-retry [timeout=%s]", new Object[]{str, Integer.valueOf(timeoutMs)}));
        } catch (VolleyError volleyError2) {
            request.addMarker(String.format("%s-timeout-giveup [timeout=%s]", new Object[]{str, Integer.valueOf(timeoutMs)}));
            throw volleyError2;
        }
    }

    private Map<String, String> getCacheHeaders(Entry entry) {
        if (entry == null) {
            return Collections.emptyMap();
        }
        Map<String, String> hashMap = new HashMap();
        if (entry.etag != null) {
            hashMap.put(HttpRequest.HEADER_IF_NONE_MATCH, entry.etag);
        }
        if (entry.lastModified > 0) {
            hashMap.put("If-Modified-Since", HttpHeaderParser.formatEpochAsRfc1123(entry.lastModified));
        }
        return hashMap;
    }

    protected void logError(String str, String str2, long j) {
        long elapsedRealtime = SystemClock.elapsedRealtime();
        VolleyLog.v("HTTP ERROR(%s) %d ms to fetch %s", str, Long.valueOf(elapsedRealtime - j), str2);
    }

    /* JADX WARNING: Removed duplicated region for block: B:23:0x004a A:{SYNTHETIC, Splitter: B:23:0x004a} */
    private byte[] inputStreamToBytes(java.io.InputStream r6, int r7) throws java.io.IOException, com.android.volley.ServerError {
        /*
        r5 = this;
        r0 = new com.android.volley.toolbox.PoolingByteArrayOutputStream;
        r1 = r5.mPool;
        r0.<init>(r1, r7);
        r7 = 0;
        r1 = 0;
        if (r6 == 0) goto L_0x0041;
    L_0x000c:
        r2 = r5.mPool;	 Catch:{ all -> 0x0047 }
        r3 = 1024; // 0x400 float:1.435E-42 double:5.06E-321;
        r2 = r2.getBuf(r3);	 Catch:{ all -> 0x0047 }
    L_0x0014:
        r1 = r6.read(r2);	 Catch:{ all -> 0x003c }
        r3 = -1;
        if (r1 == r3) goto L_0x001f;
    L_0x001b:
        r0.write(r2, r7, r1);	 Catch:{ all -> 0x003c }
        goto L_0x0014;
    L_0x001f:
        r1 = r0.toByteArray();	 Catch:{ all -> 0x003c }
        if (r6 == 0) goto L_0x0032;
    L_0x0025:
        r6.close();	 Catch:{ IOException -> 0x0029 }
        goto L_0x0032;
    L_0x0029:
        r6 = move-exception;
        r6 = "Error occurred when closing InputStream";
        r7 = new java.lang.Object[r7];
        com.android.volley.VolleyLog.v(r6, r7);
        goto L_0x0033;
    L_0x0033:
        r6 = r5.mPool;
        r6.returnBuf(r2);
        r0.close();
        return r1;
    L_0x003c:
        r1 = move-exception;
        r4 = r2;
        r2 = r1;
        r1 = r4;
        goto L_0x0048;
    L_0x0041:
        r2 = new com.android.volley.ServerError;	 Catch:{ all -> 0x0047 }
        r2.<init>();	 Catch:{ all -> 0x0047 }
        throw r2;	 Catch:{ all -> 0x0047 }
    L_0x0047:
        r2 = move-exception;
    L_0x0048:
        if (r6 == 0) goto L_0x0057;
    L_0x004a:
        r6.close();	 Catch:{ IOException -> 0x004e }
        goto L_0x0057;
    L_0x004e:
        r6 = move-exception;
        r6 = new java.lang.Object[r7];
        r7 = "Error occurred when closing InputStream";
        com.android.volley.VolleyLog.v(r7, r6);
        goto L_0x0058;
    L_0x0058:
        r6 = r5.mPool;
        r6.returnBuf(r1);
        r0.close();
        throw r2;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.volley.toolbox.BasicNetwork.inputStreamToBytes(java.io.InputStream, int):byte[]");
    }

    @Deprecated
    protected static Map<String, String> convertHeaders(Header[] headerArr) {
        Map<String, String> treeMap = new TreeMap(String.CASE_INSENSITIVE_ORDER);
        for (int i = 0; i < headerArr.length; i++) {
            treeMap.put(headerArr[i].getName(), headerArr[i].getValue());
        }
        return treeMap;
    }

    private static List<Header> combineHeaders(List<Header> list, Entry entry) {
        Set treeSet = new TreeSet(String.CASE_INSENSITIVE_ORDER);
        if (!list.isEmpty()) {
            for (Header name : list) {
                treeSet.add(name.getName());
            }
        }
        List<Header> arrayList = new ArrayList(list);
        if (entry.allResponseHeaders != null) {
            if (!entry.allResponseHeaders.isEmpty()) {
                for (Header header : entry.allResponseHeaders) {
                    if (!treeSet.contains(header.getName())) {
                        arrayList.add(header);
                    }
                }
            }
        } else if (!entry.responseHeaders.isEmpty()) {
            for (Map.Entry entry2 : entry.responseHeaders.entrySet()) {
                if (!treeSet.contains(entry2.getKey())) {
                    arrayList.add(new Header((String) entry2.getKey(), (String) entry2.getValue()));
                }
            }
        }
        return arrayList;
    }
}
