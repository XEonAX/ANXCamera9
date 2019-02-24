package com.android.volley.toolbox;

import android.os.SystemClock;
import com.android.volley.C0000VolleyError;
import com.android.volley.C0001AuthFailureError;
import com.android.volley.C0006RetryPolicy;
import com.android.volley.C0012Network;
import com.android.volley.C0014NetworkError;
import com.android.volley.C0015NetworkResponse;
import com.android.volley.C0016NoConnectionError;
import com.android.volley.C0021Request;
import com.android.volley.C0028ServerError;
import com.android.volley.C0029TimeoutError;
import com.android.volley.C0032VolleyLog;
import com.android.volley.Cache.C0002Entry;
import com.ss.android.ttve.common.TEDefine;
import com.ss.android.vesdk.runtime.cloudconfig.HttpRequest;
import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.SocketTimeoutException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import org.apache.http.Header;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.StatusLine;
import org.apache.http.conn.ConnectTimeoutException;
import org.apache.http.impl.cookie.DateUtils;

/* renamed from: com.android.volley.toolbox.BasicNetwork */
public class C0035BasicNetwork implements C0012Network {
    protected static final boolean DEBUG = C0032VolleyLog.DEBUG;
    private static int DEFAULT_POOL_SIZE = 4096;
    private static int SLOW_REQUEST_THRESHOLD_MS = SLOW_REQUEST_THRESHOLD_MS;
    protected final C0043HttpStack mHttpStack;
    protected final C0037ByteArrayPool mPool;

    public C0035BasicNetwork(C0043HttpStack httpStack) {
        this(httpStack, new C0037ByteArrayPool(DEFAULT_POOL_SIZE));
    }

    public C0035BasicNetwork(C0043HttpStack httpStack, C0037ByteArrayPool pool) {
        this.mHttpStack = httpStack;
        this.mPool = pool;
    }

    /* JADX WARNING: Removed duplicated region for block: B:121:0x0143 A:{SYNTHETIC} */
    /* JADX WARNING: Removed duplicated region for block: B:87:0x00fe  */
    /* JADX WARNING: Removed duplicated region for block: B:87:0x00fe  */
    /* JADX WARNING: Removed duplicated region for block: B:121:0x0143 A:{SYNTHETIC} */
    /* JADX WARNING: Removed duplicated region for block: B:121:0x0143 A:{SYNTHETIC} */
    /* JADX WARNING: Removed duplicated region for block: B:87:0x00fe  */
    /* JADX WARNING: Removed duplicated region for block: B:87:0x00fe  */
    /* JADX WARNING: Removed duplicated region for block: B:121:0x0143 A:{SYNTHETIC} */
    /* JADX WARNING: Removed duplicated region for block: B:121:0x0143 A:{SYNTHETIC} */
    /* JADX WARNING: Removed duplicated region for block: B:87:0x00fe  */
    /* JADX WARNING: Removed duplicated region for block: B:87:0x00fe  */
    /* JADX WARNING: Removed duplicated region for block: B:121:0x0143 A:{SYNTHETIC} */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public C0015NetworkResponse performRequest(C0021Request<?> request) throws C0000VolleyError {
        MalformedURLException e;
        IOException e2;
        StringBuilder stringBuilder;
        C0021Request<?> c0021Request = request;
        long requestStart = SystemClock.elapsedRealtime();
        while (true) {
            long requestStart2 = requestStart;
            byte[] responseContents = null;
            Map<String, String> responseHeaders = new HashMap();
            HttpResponse httpResponse;
            try {
                Map<String, String> headers = new HashMap();
                addCacheHeaders(headers, request.getCacheEntry());
                httpResponse = this.mHttpStack.performRequest(c0021Request, headers);
                try {
                    StatusLine statusLine = httpResponse.getStatusLine();
                    int statusCode = statusLine.getStatusCode();
                    Map<String, String> responseHeaders2 = C0035BasicNetwork.convertHeaders(httpResponse.getAllHeaders());
                    if (statusCode == 304) {
                        try {
                            return new C0015NetworkResponse(304, request.getCacheEntry() == null ? null : request.getCacheEntry().data, responseHeaders2, true);
                        } catch (SocketTimeoutException e3) {
                            responseHeaders = responseHeaders2;
                        } catch (ConnectTimeoutException e4) {
                            responseHeaders = responseHeaders2;
                            C0035BasicNetwork.attemptRetryOnException("connection", c0021Request, new C0029TimeoutError());
                            requestStart = requestStart2;
                        } catch (MalformedURLException e5) {
                            e = e5;
                            responseHeaders = responseHeaders2;
                        } catch (IOException e6) {
                            e2 = e6;
                            responseHeaders = responseHeaders2;
                            if (httpResponse != null) {
                            }
                        }
                    } else {
                        try {
                            byte[] responseContents2;
                            byte[] responseContents3;
                            Map<String, String> responseHeaders3;
                            if (httpResponse.getEntity() != null) {
                                responseContents2 = entityToBytes(httpResponse.getEntity());
                            } else {
                                responseContents2 = new byte[0];
                            }
                            byte[] responseContents4 = responseContents2;
                            try {
                                responseContents3 = responseContents4;
                                responseHeaders3 = responseHeaders2;
                            } catch (SocketTimeoutException e7) {
                                responseContents = responseContents4;
                                responseHeaders = responseHeaders2;
                                C0035BasicNetwork.attemptRetryOnException("socket", c0021Request, new C0029TimeoutError());
                                requestStart = requestStart2;
                            } catch (ConnectTimeoutException e8) {
                                responseContents = responseContents4;
                                responseHeaders = responseHeaders2;
                                C0035BasicNetwork.attemptRetryOnException("connection", c0021Request, new C0029TimeoutError());
                                requestStart = requestStart2;
                            } catch (MalformedURLException e9) {
                                e = e9;
                                responseContents = responseContents4;
                                responseHeaders = responseHeaders2;
                            } catch (IOException e10) {
                                e2 = e10;
                                responseContents = responseContents4;
                                responseHeaders = responseHeaders2;
                                if (httpResponse != null) {
                                }
                            }
                            try {
                                logSlowRequests(SystemClock.elapsedRealtime() - requestStart2, c0021Request, responseContents4, statusLine);
                                if (statusCode < 200 || statusCode > 299) {
                                } else {
                                    responseContents = responseContents3;
                                    try {
                                        return new C0015NetworkResponse(statusCode, responseContents, responseHeaders3, false);
                                    } catch (SocketTimeoutException e11) {
                                        responseHeaders = responseHeaders3;
                                        C0035BasicNetwork.attemptRetryOnException("socket", c0021Request, new C0029TimeoutError());
                                        requestStart = requestStart2;
                                    } catch (ConnectTimeoutException e12) {
                                        responseHeaders = responseHeaders3;
                                        C0035BasicNetwork.attemptRetryOnException("connection", c0021Request, new C0029TimeoutError());
                                        requestStart = requestStart2;
                                    } catch (MalformedURLException e13) {
                                        e = e13;
                                        responseHeaders = responseHeaders3;
                                        stringBuilder = new StringBuilder();
                                        stringBuilder.append("Bad URL ");
                                        stringBuilder.append(request.getUrl());
                                        throw new RuntimeException(stringBuilder.toString(), e);
                                    } catch (IOException e14) {
                                        e2 = e14;
                                        responseHeaders = responseHeaders3;
                                        if (httpResponse != null) {
                                        }
                                    }
                                }
                            } catch (SocketTimeoutException e15) {
                                responseContents = responseContents3;
                                responseHeaders = responseHeaders3;
                                C0035BasicNetwork.attemptRetryOnException("socket", c0021Request, new C0029TimeoutError());
                                requestStart = requestStart2;
                            } catch (ConnectTimeoutException e16) {
                                responseContents = responseContents3;
                                responseHeaders = responseHeaders3;
                                C0035BasicNetwork.attemptRetryOnException("connection", c0021Request, new C0029TimeoutError());
                                requestStart = requestStart2;
                            } catch (MalformedURLException e17) {
                                e = e17;
                                responseContents = responseContents3;
                                responseHeaders = responseHeaders3;
                                stringBuilder = new StringBuilder();
                                stringBuilder.append("Bad URL ");
                                stringBuilder.append(request.getUrl());
                                throw new RuntimeException(stringBuilder.toString(), e);
                            } catch (IOException e18) {
                                e2 = e18;
                                responseContents = responseContents3;
                                responseHeaders = responseHeaders3;
                                if (httpResponse != null) {
                                }
                            }
                        } catch (SocketTimeoutException e19) {
                            responseHeaders = responseHeaders2;
                            C0035BasicNetwork.attemptRetryOnException("socket", c0021Request, new C0029TimeoutError());
                            requestStart = requestStart2;
                        } catch (ConnectTimeoutException e20) {
                            responseHeaders = responseHeaders2;
                            C0035BasicNetwork.attemptRetryOnException("connection", c0021Request, new C0029TimeoutError());
                            requestStart = requestStart2;
                        } catch (MalformedURLException e21) {
                            e = e21;
                            responseHeaders = responseHeaders2;
                        } catch (IOException e22) {
                            e2 = e22;
                            responseHeaders = responseHeaders2;
                            if (httpResponse != null) {
                                HttpResponse httpResponse2 = httpResponse.getStatusLine().getStatusCode();
                                C0032VolleyLog.e("Unexpected response code %d for %s", Integer.valueOf(httpResponse2), request.getUrl());
                                if (responseContents != null) {
                                    C0015NetworkResponse networkResponse = new C0015NetworkResponse(httpResponse2, responseContents, responseHeaders, false);
                                    if (httpResponse2 == 401 || httpResponse2 == 403) {
                                        C0035BasicNetwork.attemptRetryOnException("auth", c0021Request, new C0001AuthFailureError(networkResponse));
                                        requestStart = requestStart2;
                                    } else {
                                        throw new C0028ServerError(networkResponse);
                                    }
                                }
                                throw new C0014NetworkError(null);
                            }
                            throw new C0016NoConnectionError(e2);
                        }
                    }
                } catch (SocketTimeoutException e23) {
                    C0035BasicNetwork.attemptRetryOnException("socket", c0021Request, new C0029TimeoutError());
                    requestStart = requestStart2;
                } catch (ConnectTimeoutException e24) {
                    C0035BasicNetwork.attemptRetryOnException("connection", c0021Request, new C0029TimeoutError());
                    requestStart = requestStart2;
                } catch (MalformedURLException e25) {
                    e = e25;
                } catch (IOException e26) {
                    e2 = e26;
                    if (httpResponse != null) {
                    }
                }
            } catch (SocketTimeoutException e27) {
                httpResponse = null;
                C0035BasicNetwork.attemptRetryOnException("socket", c0021Request, new C0029TimeoutError());
                requestStart = requestStart2;
            } catch (ConnectTimeoutException e28) {
                httpResponse = null;
                C0035BasicNetwork.attemptRetryOnException("connection", c0021Request, new C0029TimeoutError());
                requestStart = requestStart2;
            } catch (MalformedURLException e29) {
                e = e29;
                httpResponse = null;
            } catch (IOException e30) {
                e2 = e30;
                httpResponse = null;
                if (httpResponse != null) {
                }
            }
            requestStart = requestStart2;
        }
        throw new IOException();
    }

    private void logSlowRequests(long requestLifetime, C0021Request<?> request, byte[] responseContents, StatusLine statusLine) {
        if (DEBUG || requestLifetime > ((long) SLOW_REQUEST_THRESHOLD_MS)) {
            String str = "HTTP response for request=<%s> [lifetime=%d], [size=%s], [rc=%d], [retryCount=%s]";
            Object[] objArr = new Object[5];
            objArr[0] = request;
            objArr[1] = Long.valueOf(requestLifetime);
            objArr[2] = responseContents != null ? Integer.valueOf(responseContents.length) : TEDefine.FACE_BEAUTY_NULL;
            objArr[3] = Integer.valueOf(statusLine.getStatusCode());
            objArr[4] = Integer.valueOf(request.getRetryPolicy().getCurrentRetryCount());
            C0032VolleyLog.d(str, objArr);
        }
    }

    private static void attemptRetryOnException(String logPrefix, C0021Request<?> request, C0000VolleyError exception) throws C0000VolleyError {
        C0006RetryPolicy retryPolicy = request.getRetryPolicy();
        int oldTimeout = request.getTimeoutMs();
        try {
            retryPolicy.retry(exception);
            request.addMarker(String.format("%s-retry [timeout=%s]", new Object[]{logPrefix, Integer.valueOf(oldTimeout)}));
        } catch (C0000VolleyError e) {
            request.addMarker(String.format("%s-timeout-giveup [timeout=%s]", new Object[]{logPrefix, Integer.valueOf(oldTimeout)}));
            throw e;
        }
    }

    private void addCacheHeaders(Map<String, String> headers, C0002Entry entry) {
        if (entry != null) {
            if (entry.etag != null) {
                headers.put(HttpRequest.HEADER_IF_NONE_MATCH, entry.etag);
            }
            if (entry.serverDate > 0) {
                headers.put("If-Modified-Since", DateUtils.formatDate(new Date(entry.serverDate)));
            }
        }
    }

    protected void logError(String what, String url, long start) {
        long now = SystemClock.elapsedRealtime();
        C0032VolleyLog.v("HTTP ERROR(%s) %d ms to fetch %s", what, Long.valueOf(now - start), url);
    }

    private byte[] entityToBytes(HttpEntity entity) throws IOException, C0028ServerError {
        C0065PoolingByteArrayOutputStream bytes = new C0065PoolingByteArrayOutputStream(this.mPool, (int) entity.getContentLength());
        byte[] buffer = null;
        byte[] e;
        try {
            InputStream in = entity.getContent();
            if (in != null) {
                buffer = this.mPool.getBuf(1024);
                while (true) {
                    int read = in.read(buffer);
                    int count = read;
                    if (read == -1) {
                        break;
                    }
                    bytes.write(buffer, 0, count);
                }
                e = bytes.toByteArray();
                return e;
            }
            throw new C0028ServerError();
        } finally {
            try {
                entity.consumeContent();
            } catch (IOException e2) {
                e = e2;
                C0032VolleyLog.v("Error occured when calling consumingContent", new Object[0]);
            }
            this.mPool.returnBuf(buffer);
            bytes.close();
        }
    }

    private static Map<String, String> convertHeaders(Header[] headers) {
        Map<String, String> result = new HashMap();
        for (int i = 0; i < headers.length; i++) {
            result.put(headers[i].getName(), headers[i].getValue());
        }
        return result;
    }
}
