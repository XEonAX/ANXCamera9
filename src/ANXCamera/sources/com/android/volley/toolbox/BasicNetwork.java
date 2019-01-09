package com.android.volley.toolbox;

import android.os.SystemClock;
import com.android.volley.Cache.Entry;
import com.android.volley.Header;
import com.android.volley.Network;
import com.android.volley.NetworkResponse;
import com.android.volley.Request;
import com.android.volley.RetryPolicy;
import com.android.volley.ServerError;
import com.android.volley.VolleyError;
import com.android.volley.VolleyLog;
import com.ss.android.ttve.common.TEDefine;
import com.ss.android.vesdk.runtime.cloudconfig.HttpRequest;
import java.io.IOException;
import java.io.InputStream;
import java.net.SocketTimeoutException;
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
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public NetworkResponse performRequest(Request<?> request) throws VolleyError {
        List emptyList;
        List headers;
        Request<?> request2 = request;
        long elapsedRealtime = SystemClock.elapsedRealtime();
        while (true) {
            emptyList = Collections.emptyList();
            HttpResponse executeRequest;
            byte[] bArr;
            try {
                executeRequest = this.mBaseHttpStack.executeRequest(request2, getCacheHeaders(request.getCacheEntry()));
                int statusCode = executeRequest.getStatusCode();
                headers = executeRequest.getHeaders();
                if (statusCode == 304) {
                    Entry cacheEntry = request.getCacheEntry();
                    if (cacheEntry == null) {
                        return new NetworkResponse(304, null, true, SystemClock.elapsedRealtime() - elapsedRealtime, headers);
                    }
                    List combineHeaders = combineHeaders(headers, cacheEntry);
                    return new NetworkResponse(304, cacheEntry.data, true, SystemClock.elapsedRealtime() - elapsedRealtime, combineHeaders);
                }
                byte[] inputStreamToBytes;
                InputStream content = executeRequest.getContent();
                if (content != null) {
                    inputStreamToBytes = inputStreamToBytes(content, executeRequest.getContentLength());
                } else {
                    inputStreamToBytes = new byte[0];
                }
                bArr = inputStreamToBytes;
                logSlowRequests(SystemClock.elapsedRealtime() - elapsedRealtime, request2, bArr, statusCode);
                if (statusCode < 200 || statusCode > 299) {
                    emptyList = headers;
                } else {
                    emptyList = headers;
                    NetworkResponse networkResponse = networkResponse;
                    return new NetworkResponse(statusCode, bArr, false, SystemClock.elapsedRealtime() - elapsedRealtime, emptyList);
                }
            } catch (SocketTimeoutException e) {
            } catch (Throwable e2) {
            } catch (IOException e3) {
                Throwable e4 = e3;
                List list = emptyList;
                byte[] bArr2 = bArr;
                if (executeRequest == null) {
                }
            }
        }
        emptyList = headers;
        throw new IOException();
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
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private byte[] inputStreamToBytes(InputStream inputStream, int i) throws IOException, ServerError {
        Throwable th;
        PoolingByteArrayOutputStream poolingByteArrayOutputStream = new PoolingByteArrayOutputStream(this.mPool, i);
        byte[] bArr = null;
        if (inputStream != null) {
            try {
                byte[] buf = this.mPool.getBuf(1024);
                while (true) {
                    try {
                        int read = inputStream.read(buf);
                        if (read == -1) {
                            break;
                        }
                        poolingByteArrayOutputStream.write(buf, 0, read);
                    } catch (Throwable th2) {
                        byte[] bArr2 = buf;
                        th = th2;
                        bArr = bArr2;
                        if (inputStream != null) {
                        }
                        this.mPool.returnBuf(bArr);
                        poolingByteArrayOutputStream.close();
                        throw th;
                    }
                }
                bArr = poolingByteArrayOutputStream.toByteArray();
                if (inputStream != null) {
                    try {
                        inputStream.close();
                    } catch (IOException e) {
                        VolleyLog.v("Error occurred when closing InputStream", new Object[0]);
                    }
                }
                this.mPool.returnBuf(buf);
                poolingByteArrayOutputStream.close();
                return bArr;
            } catch (Throwable th3) {
                th = th3;
                if (inputStream != null) {
                    try {
                        inputStream.close();
                    } catch (IOException e2) {
                        VolleyLog.v("Error occurred when closing InputStream", new Object[0]);
                    }
                }
                this.mPool.returnBuf(bArr);
                poolingByteArrayOutputStream.close();
                throw th;
            }
        }
        throw new ServerError();
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
