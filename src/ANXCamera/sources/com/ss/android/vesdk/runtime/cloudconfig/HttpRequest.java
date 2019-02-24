package com.ss.android.vesdk.runtime.cloudconfig;

import android.provider.MiuiSettings.System;
import com.android.camera.network.net.base.HTTP;
import com.bytedance.frameworks.core.monitor.MonitorCommonConstants;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.Closeable;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.Flushable;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintStream;
import java.io.Reader;
import java.io.UnsupportedEncodingException;
import java.io.Writer;
import java.net.HttpURLConnection;
import java.net.InetSocketAddress;
import java.net.Proxy;
import java.net.Proxy.Type;
import java.net.URI;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.nio.charset.Charset;
import java.nio.charset.CharsetEncoder;
import java.security.AccessController;
import java.security.PrivilegedAction;
import java.security.SecureRandom;
import java.security.cert.X509Certificate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.concurrent.Callable;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicReference;
import java.util.zip.GZIPInputStream;
import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSession;
import javax.net.ssl.SSLSocketFactory;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;

public class HttpRequest {
    private static final String BOUNDARY = "00content0boundary00";
    public static final String CHARSET_UTF8 = "UTF-8";
    private static ConnectionFactory CONNECTION_FACTORY = ConnectionFactory.DEFAULT;
    public static final String CONTENT_TYPE_FORM = "application/x-www-form-urlencoded";
    public static final String CONTENT_TYPE_JSON = "application/json";
    private static final String CONTENT_TYPE_MULTIPART = "multipart/form-data; boundary=00content0boundary00";
    private static final String CRLF = "\r\n";
    private static final String[] EMPTY_STRINGS = new String[0];
    public static final String ENCODING_GZIP = "gzip";
    public static final String HEADER_ACCEPT = "Accept";
    public static final String HEADER_ACCEPT_CHARSET = "Accept-Charset";
    public static final String HEADER_ACCEPT_ENCODING = "Accept-Encoding";
    public static final String HEADER_AUTHORIZATION = "Authorization";
    public static final String HEADER_CACHE_CONTROL = "Cache-Control";
    public static final String HEADER_CONTENT_ENCODING = "Content-Encoding";
    public static final String HEADER_CONTENT_LENGTH = "Content-Length";
    public static final String HEADER_CONTENT_TYPE = "Content-Type";
    public static final String HEADER_DATE = "Date";
    public static final String HEADER_ETAG = "ETag";
    public static final String HEADER_EXPIRES = "Expires";
    public static final String HEADER_IF_NONE_MATCH = "If-None-Match";
    public static final String HEADER_LAST_MODIFIED = "Last-Modified";
    public static final String HEADER_LOCATION = "Location";
    public static final String HEADER_PROXY_AUTHORIZATION = "Proxy-Authorization";
    public static final String HEADER_REFERER = "Referer";
    public static final String HEADER_SERVER = "Server";
    public static final String HEADER_USER_AGENT = "User-Agent";
    public static final String METHOD_DELETE = "DELETE";
    public static final String METHOD_GET = "GET";
    public static final String METHOD_HEAD = "HEAD";
    public static final String METHOD_OPTIONS = "OPTIONS";
    public static final String METHOD_POST = "POST";
    public static final String METHOD_PUT = "PUT";
    public static final String METHOD_TRACE = "TRACE";
    public static final String PARAM_CHARSET = "charset";
    private static SSLSocketFactory TRUSTED_FACTORY;
    private static HostnameVerifier TRUSTED_VERIFIER;
    private int bufferSize = 8192;
    private HttpURLConnection connection = null;
    private boolean form;
    private String httpProxyHost;
    private int httpProxyPort;
    private boolean ignoreCloseExceptions = true;
    private boolean multipart;
    private RequestOutputStream output;
    private UploadProgress progress = UploadProgress.DEFAULT;
    private final String requestMethod;
    private long totalSize = -1;
    private long totalWritten = 0;
    private boolean uncompress = false;
    private final URL url;

    protected static abstract class Operation<V> implements Callable<V> {
        protected abstract void done() throws IOException;

        protected abstract V run() throws HttpRequestException, IOException;

        protected Operation() {
        }

        public V call() throws HttpRequestException {
            Throwable th;
            Object obj = 1;
            try {
                V run = run();
                try {
                    done();
                    return run;
                } catch (IOException e) {
                    throw new HttpRequestException(e);
                }
            } catch (HttpRequestException e2) {
                throw e2;
            } catch (IOException e3) {
                throw new HttpRequestException(e3);
            } catch (Throwable th2) {
                th = th2;
                done();
                throw th;
            }
        }
    }

    protected static abstract class FlushOperation<V> extends Operation<V> {
        private final Flushable flushable;

        protected FlushOperation(Flushable flushable) {
            this.flushable = flushable;
        }

        protected void done() throws IOException {
            this.flushable.flush();
        }
    }

    protected static abstract class CloseOperation<V> extends Operation<V> {
        private final Closeable closeable;
        private final boolean ignoreCloseExceptions;

        protected CloseOperation(Closeable closeable, boolean z) {
            this.closeable = closeable;
            this.ignoreCloseExceptions = z;
        }

        protected void done() throws IOException {
            if (this.closeable instanceof Flushable) {
                ((Flushable) this.closeable).flush();
            }
            if (this.ignoreCloseExceptions) {
                try {
                    this.closeable.close();
                    return;
                } catch (IOException e) {
                    return;
                }
            }
            this.closeable.close();
        }
    }

    public static class Base64 {
        private static final byte EQUALS_SIGN = (byte) 61;
        private static final String PREFERRED_ENCODING = "US-ASCII";
        private static final byte[] _STANDARD_ALPHABET = new byte[]{(byte) 65, (byte) 66, (byte) 67, (byte) 68, (byte) 69, (byte) 70, (byte) 71, (byte) 72, (byte) 73, (byte) 74, (byte) 75, (byte) 76, (byte) 77, (byte) 78, (byte) 79, (byte) 80, (byte) 81, (byte) 82, (byte) 83, (byte) 84, (byte) 85, (byte) 86, (byte) 87, (byte) 88, (byte) 89, (byte) 90, (byte) 97, (byte) 98, (byte) 99, (byte) 100, (byte) 101, (byte) 102, (byte) 103, (byte) 104, (byte) 105, (byte) 106, (byte) 107, (byte) 108, (byte) 109, (byte) 110, (byte) 111, (byte) 112, (byte) 113, (byte) 114, (byte) 115, (byte) 116, (byte) 117, (byte) 118, (byte) 119, (byte) 120, (byte) 121, (byte) 122, (byte) 48, (byte) 49, (byte) 50, (byte) 51, (byte) 52, (byte) 53, (byte) 54, (byte) 55, (byte) 56, (byte) 57, (byte) 43, (byte) 47};

        private Base64() {
        }

        private static byte[] encode3to4(byte[] bArr, int i, int i2, byte[] bArr2, int i3) {
            byte[] bArr3 = _STANDARD_ALPHABET;
            int i4 = 0;
            int i5 = (i2 > 0 ? (bArr[i] << 24) >>> 8 : 0) | (i2 > 1 ? (bArr[i + 1] << 24) >>> 16 : 0);
            if (i2 > 2) {
                i4 = (bArr[i + 2] << 24) >>> 24;
            }
            int i6 = i5 | i4;
            switch (i2) {
                case 1:
                    bArr2[i3] = bArr3[i6 >>> 18];
                    bArr2[i3 + 1] = bArr3[(i6 >>> 12) & 63];
                    bArr2[i3 + 2] = EQUALS_SIGN;
                    bArr2[i3 + 3] = EQUALS_SIGN;
                    return bArr2;
                case 2:
                    bArr2[i3] = bArr3[i6 >>> 18];
                    bArr2[i3 + 1] = bArr3[(i6 >>> 12) & 63];
                    bArr2[i3 + 2] = bArr3[(i6 >>> 6) & 63];
                    bArr2[i3 + 3] = EQUALS_SIGN;
                    return bArr2;
                case 3:
                    bArr2[i3] = bArr3[i6 >>> 18];
                    bArr2[i3 + 1] = bArr3[(i6 >>> 12) & 63];
                    bArr2[i3 + 2] = bArr3[(i6 >>> 6) & 63];
                    bArr2[i3 + 3] = bArr3[i6 & 63];
                    return bArr2;
                default:
                    return bArr2;
            }
        }

        public static String encode(String str) {
            byte[] bytes;
            try {
                bytes = str.getBytes("US-ASCII");
            } catch (UnsupportedEncodingException e) {
                bytes = str.getBytes();
            }
            return encodeBytes(bytes);
        }

        public static String encodeBytes(byte[] bArr) {
            return encodeBytes(bArr, 0, bArr.length);
        }

        public static String encodeBytes(byte[] bArr, int i, int i2) {
            bArr = encodeBytesToBytes(bArr, i, i2);
            try {
                return new String(bArr, "US-ASCII");
            } catch (UnsupportedEncodingException e) {
                return new String(bArr);
            }
        }

        public static byte[] encodeBytesToBytes(byte[] bArr, int i, int i2) {
            if (bArr == null) {
                throw new NullPointerException("Cannot serialize a null array.");
            } else if (i < 0) {
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("Cannot have negative offset: ");
                stringBuilder.append(i);
                throw new IllegalArgumentException(stringBuilder.toString());
            } else if (i2 < 0) {
                StringBuilder stringBuilder2 = new StringBuilder();
                stringBuilder2.append("Cannot have length offset: ");
                stringBuilder2.append(i2);
                throw new IllegalArgumentException(stringBuilder2.toString());
            } else if (i + i2 <= bArr.length) {
                int i3 = 4;
                int i4 = (i2 / 3) * 4;
                if (i2 % 3 <= 0) {
                    i3 = 0;
                }
                Object obj = new byte[(i4 + i3)];
                i3 = i2 - 2;
                int i5 = 0;
                int i6 = i5;
                while (i5 < i3) {
                    encode3to4(bArr, i5 + i, 3, obj, i6);
                    i5 += 3;
                    i6 += 4;
                }
                if (i5 < i2) {
                    encode3to4(bArr, i + i5, i2 - i5, obj, i6);
                    i6 += 4;
                }
                if (i6 > obj.length - 1) {
                    return obj;
                }
                Object obj2 = new byte[i6];
                System.arraycopy(obj, 0, obj2, 0, i6);
                return obj2;
            } else {
                throw new IllegalArgumentException(String.format("Cannot have offset of %d and length of %d with array of length %d", new Object[]{Integer.valueOf(i), Integer.valueOf(i2), Integer.valueOf(bArr.length)}));
            }
        }
    }

    public interface ConnectionFactory {
        public static final ConnectionFactory DEFAULT = new ConnectionFactory() {
            public HttpURLConnection create(URL url) throws IOException {
                return (HttpURLConnection) url.openConnection();
            }

            public HttpURLConnection create(URL url, Proxy proxy) throws IOException {
                return (HttpURLConnection) url.openConnection(proxy);
            }
        };

        HttpURLConnection create(URL url) throws IOException;

        HttpURLConnection create(URL url, Proxy proxy) throws IOException;
    }

    public static class HttpRequestException extends RuntimeException {
        private static final long serialVersionUID = -1170466989781746231L;

        public HttpRequestException(IOException iOException) {
            super(iOException);
        }

        public IOException getCause() {
            return (IOException) super.getCause();
        }
    }

    public static class RequestOutputStream extends BufferedOutputStream {
        private final CharsetEncoder encoder;

        public RequestOutputStream(OutputStream outputStream, String str, int i) {
            super(outputStream, i);
            this.encoder = Charset.forName(HttpRequest.getValidCharset(str)).newEncoder();
        }

        public RequestOutputStream write(String str) throws IOException {
            ByteBuffer encode = this.encoder.encode(CharBuffer.wrap(str));
            super.write(encode.array(), 0, encode.limit());
            return this;
        }
    }

    public interface UploadProgress {
        public static final UploadProgress DEFAULT = new UploadProgress() {
            public void onUpload(long j, long j2) {
            }
        };

        void onUpload(long j, long j2);
    }

    private static String getValidCharset(String str) {
        if (str == null || str.length() <= 0) {
            return "UTF-8";
        }
        return str;
    }

    private static SSLSocketFactory getTrustedFactory() throws HttpRequestException {
        if (TRUSTED_FACTORY == null) {
            TrustManager[] trustManagerArr = new TrustManager[]{new X509TrustManager() {
                public X509Certificate[] getAcceptedIssuers() {
                    return new X509Certificate[0];
                }

                public void checkClientTrusted(X509Certificate[] x509CertificateArr, String str) {
                }

                public void checkServerTrusted(X509Certificate[] x509CertificateArr, String str) {
                }
            }};
            try {
                SSLContext instance = SSLContext.getInstance("TLS");
                instance.init(null, trustManagerArr, new SecureRandom());
                TRUSTED_FACTORY = instance.getSocketFactory();
            } catch (Throwable e) {
                IOException iOException = new IOException("Security exception configuring SSL context");
                iOException.initCause(e);
                throw new HttpRequestException(iOException);
            }
        }
        return TRUSTED_FACTORY;
    }

    private static HostnameVerifier getTrustedVerifier() {
        if (TRUSTED_VERIFIER == null) {
            TRUSTED_VERIFIER = new HostnameVerifier() {
                public boolean verify(String str, SSLSession sSLSession) {
                    return true;
                }
            };
        }
        return TRUSTED_VERIFIER;
    }

    private static StringBuilder addPathSeparator(String str, StringBuilder stringBuilder) {
        if (str.indexOf(58) + 2 == str.lastIndexOf(47)) {
            stringBuilder.append('/');
        }
        return stringBuilder;
    }

    private static StringBuilder addParamPrefix(String str, StringBuilder stringBuilder) {
        int indexOf = str.indexOf(63);
        int length = stringBuilder.length() - 1;
        if (indexOf == -1) {
            stringBuilder.append('?');
        } else if (indexOf < length && str.charAt(length) != '&') {
            stringBuilder.append('&');
        }
        return stringBuilder;
    }

    private static StringBuilder addParam(Object obj, Object obj2, StringBuilder stringBuilder) {
        if (obj2 != null && obj2.getClass().isArray()) {
            obj2 = arrayToList(obj2);
        }
        if (obj2 instanceof Iterable) {
            Iterator it = ((Iterable) obj2).iterator();
            while (it.hasNext()) {
                stringBuilder.append(obj);
                stringBuilder.append("[]=");
                Object next = it.next();
                if (next != null) {
                    stringBuilder.append(next);
                }
                if (it.hasNext()) {
                    stringBuilder.append("&");
                }
            }
        } else {
            stringBuilder.append(obj);
            stringBuilder.append("=");
            if (obj2 != null) {
                stringBuilder.append(obj2);
            }
        }
        return stringBuilder;
    }

    public static void setConnectionFactory(ConnectionFactory connectionFactory) {
        if (connectionFactory == null) {
            CONNECTION_FACTORY = ConnectionFactory.DEFAULT;
        } else {
            CONNECTION_FACTORY = connectionFactory;
        }
    }

    private static List<Object> arrayToList(Object obj) {
        if (obj instanceof Object[]) {
            return Arrays.asList((Object[]) obj);
        }
        List<Object> arrayList = new ArrayList();
        int i = 0;
        int length;
        if (obj instanceof int[]) {
            int[] iArr = (int[]) obj;
            length = iArr.length;
            while (i < length) {
                arrayList.add(Integer.valueOf(iArr[i]));
                i++;
            }
        } else if (obj instanceof boolean[]) {
            boolean[] zArr = (boolean[]) obj;
            length = zArr.length;
            while (i < length) {
                arrayList.add(Boolean.valueOf(zArr[i]));
                i++;
            }
        } else if (obj instanceof long[]) {
            long[] jArr = (long[]) obj;
            length = jArr.length;
            while (i < length) {
                arrayList.add(Long.valueOf(jArr[i]));
                i++;
            }
        } else if (obj instanceof float[]) {
            float[] fArr = (float[]) obj;
            length = fArr.length;
            while (i < length) {
                arrayList.add(Float.valueOf(fArr[i]));
                i++;
            }
        } else if (obj instanceof double[]) {
            double[] dArr = (double[]) obj;
            length = dArr.length;
            while (i < length) {
                arrayList.add(Double.valueOf(dArr[i]));
                i++;
            }
        } else if (obj instanceof short[]) {
            short[] sArr = (short[]) obj;
            length = sArr.length;
            while (i < length) {
                arrayList.add(Short.valueOf(sArr[i]));
                i++;
            }
        } else if (obj instanceof byte[]) {
            byte[] bArr = (byte[]) obj;
            length = bArr.length;
            while (i < length) {
                arrayList.add(Byte.valueOf(bArr[i]));
                i++;
            }
        } else if (obj instanceof char[]) {
            char[] cArr = (char[]) obj;
            length = cArr.length;
            while (i < length) {
                arrayList.add(Character.valueOf(cArr[i]));
                i++;
            }
        }
        return arrayList;
    }

    public static String encode(CharSequence charSequence) throws HttpRequestException {
        try {
            URL url = new URL(charSequence.toString());
            String host = url.getHost();
            int port = url.getPort();
            if (port != -1) {
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append(host);
                stringBuilder.append(':');
                stringBuilder.append(Integer.toString(port));
                host = stringBuilder.toString();
            }
            try {
                host = new URI(url.getProtocol(), host, url.getPath(), url.getQuery(), null).toASCIIString();
                int indexOf = host.indexOf(63);
                if (indexOf <= 0) {
                    return host;
                }
                indexOf++;
                if (indexOf >= host.length()) {
                    return host;
                }
                StringBuilder stringBuilder2 = new StringBuilder();
                stringBuilder2.append(host.substring(0, indexOf));
                stringBuilder2.append(host.substring(indexOf).replace("+", "%2B"));
                return stringBuilder2.toString();
            } catch (Throwable e) {
                IOException iOException = new IOException("Parsing URI failed");
                iOException.initCause(e);
                throw new HttpRequestException(iOException);
            }
        } catch (IOException e2) {
            throw new HttpRequestException(e2);
        }
    }

    public static String append(CharSequence charSequence, Map<?, ?> map) {
        String charSequence2 = charSequence.toString();
        if (map == null || map.isEmpty()) {
            return charSequence2;
        }
        StringBuilder stringBuilder = new StringBuilder(charSequence2);
        addPathSeparator(charSequence2, stringBuilder);
        addParamPrefix(charSequence2, stringBuilder);
        Iterator it = map.entrySet().iterator();
        Entry entry = (Entry) it.next();
        addParam(entry.getKey().toString(), entry.getValue(), stringBuilder);
        while (it.hasNext()) {
            stringBuilder.append('&');
            entry = (Entry) it.next();
            addParam(entry.getKey().toString(), entry.getValue(), stringBuilder);
        }
        return stringBuilder.toString();
    }

    public static String append(CharSequence charSequence, Object... objArr) {
        String charSequence2 = charSequence.toString();
        if (objArr == null || objArr.length == 0) {
            return charSequence2;
        }
        int i = 2;
        if (objArr.length % 2 == 0) {
            StringBuilder stringBuilder = new StringBuilder(charSequence2);
            addPathSeparator(charSequence2, stringBuilder);
            addParamPrefix(charSequence2, stringBuilder);
            addParam(objArr[0], objArr[1], stringBuilder);
            while (i < objArr.length) {
                stringBuilder.append('&');
                addParam(objArr[i], objArr[i + 1], stringBuilder);
                i += 2;
            }
            return stringBuilder.toString();
        }
        throw new IllegalArgumentException("Must specify an even number of parameter names/values");
    }

    public static HttpRequest get(CharSequence charSequence) throws HttpRequestException {
        return new HttpRequest(charSequence, "GET");
    }

    public static HttpRequest get(URL url) throws HttpRequestException {
        return new HttpRequest(url, "GET");
    }

    public static HttpRequest get(CharSequence charSequence, Map<?, ?> map, boolean z) {
        charSequence = append(charSequence, (Map) map);
        if (z) {
            charSequence = encode(charSequence);
        }
        return get(charSequence);
    }

    public static HttpRequest get(CharSequence charSequence, boolean z, Object... objArr) {
        charSequence = append(charSequence, objArr);
        if (z) {
            charSequence = encode(charSequence);
        }
        return get(charSequence);
    }

    public static HttpRequest post(CharSequence charSequence) throws HttpRequestException {
        return new HttpRequest(charSequence, "POST");
    }

    public static HttpRequest post(URL url) throws HttpRequestException {
        return new HttpRequest(url, "POST");
    }

    public static HttpRequest post(CharSequence charSequence, Map<?, ?> map, boolean z) {
        charSequence = append(charSequence, (Map) map);
        if (z) {
            charSequence = encode(charSequence);
        }
        return post(charSequence);
    }

    public static HttpRequest post(CharSequence charSequence, boolean z, Object... objArr) {
        charSequence = append(charSequence, objArr);
        if (z) {
            charSequence = encode(charSequence);
        }
        return post(charSequence);
    }

    public static HttpRequest put(CharSequence charSequence) throws HttpRequestException {
        return new HttpRequest(charSequence, "PUT");
    }

    public static HttpRequest put(URL url) throws HttpRequestException {
        return new HttpRequest(url, "PUT");
    }

    public static HttpRequest put(CharSequence charSequence, Map<?, ?> map, boolean z) {
        charSequence = append(charSequence, (Map) map);
        if (z) {
            charSequence = encode(charSequence);
        }
        return put(charSequence);
    }

    public static HttpRequest put(CharSequence charSequence, boolean z, Object... objArr) {
        charSequence = append(charSequence, objArr);
        if (z) {
            charSequence = encode(charSequence);
        }
        return put(charSequence);
    }

    public static HttpRequest delete(CharSequence charSequence) throws HttpRequestException {
        return new HttpRequest(charSequence, "DELETE");
    }

    public static HttpRequest delete(URL url) throws HttpRequestException {
        return new HttpRequest(url, "DELETE");
    }

    public static HttpRequest delete(CharSequence charSequence, Map<?, ?> map, boolean z) {
        charSequence = append(charSequence, (Map) map);
        if (z) {
            charSequence = encode(charSequence);
        }
        return delete(charSequence);
    }

    public static HttpRequest delete(CharSequence charSequence, boolean z, Object... objArr) {
        charSequence = append(charSequence, objArr);
        if (z) {
            charSequence = encode(charSequence);
        }
        return delete(charSequence);
    }

    public static HttpRequest head(CharSequence charSequence) throws HttpRequestException {
        return new HttpRequest(charSequence, METHOD_HEAD);
    }

    public static HttpRequest head(URL url) throws HttpRequestException {
        return new HttpRequest(url, METHOD_HEAD);
    }

    public static HttpRequest head(CharSequence charSequence, Map<?, ?> map, boolean z) {
        charSequence = append(charSequence, (Map) map);
        if (z) {
            charSequence = encode(charSequence);
        }
        return head(charSequence);
    }

    public static HttpRequest head(CharSequence charSequence, boolean z, Object... objArr) {
        charSequence = append(charSequence, objArr);
        if (z) {
            charSequence = encode(charSequence);
        }
        return head(charSequence);
    }

    public static HttpRequest options(CharSequence charSequence) throws HttpRequestException {
        return new HttpRequest(charSequence, METHOD_OPTIONS);
    }

    public static HttpRequest options(URL url) throws HttpRequestException {
        return new HttpRequest(url, METHOD_OPTIONS);
    }

    public static HttpRequest trace(CharSequence charSequence) throws HttpRequestException {
        return new HttpRequest(charSequence, METHOD_TRACE);
    }

    public static HttpRequest trace(URL url) throws HttpRequestException {
        return new HttpRequest(url, METHOD_TRACE);
    }

    public static void keepAlive(boolean z) {
        setProperty("http.keepAlive", Boolean.toString(z));
    }

    public static void maxConnections(int i) {
        setProperty("http.maxConnections", Integer.toString(i));
    }

    public static void proxyHost(String str) {
        setProperty("http.proxyHost", str);
        setProperty("https.proxyHost", str);
    }

    public static void proxyPort(int i) {
        String num = Integer.toString(i);
        setProperty("http.proxyPort", num);
        setProperty("https.proxyPort", num);
    }

    public static void nonProxyHosts(String... strArr) {
        if (strArr == null || strArr.length <= 0) {
            setProperty("http.nonProxyHosts", null);
            return;
        }
        StringBuilder stringBuilder = new StringBuilder();
        int length = strArr.length - 1;
        for (int i = 0; i < length; i++) {
            stringBuilder.append(strArr[i]);
            stringBuilder.append('|');
        }
        stringBuilder.append(strArr[length]);
        setProperty("http.nonProxyHosts", stringBuilder.toString());
    }

    private static String setProperty(final String str, final String str2) {
        PrivilegedAction anonymousClass3;
        if (str2 != null) {
            anonymousClass3 = new PrivilegedAction<String>() {
                public String run() {
                    return System.setProperty(str, str2);
                }
            };
        } else {
            anonymousClass3 = new PrivilegedAction<String>() {
                public String run() {
                    return System.clearProperty(str);
                }
            };
        }
        return (String) AccessController.doPrivileged(anonymousClass3);
    }

    public HttpRequest(CharSequence charSequence, String str) throws HttpRequestException {
        try {
            this.url = new URL(charSequence.toString());
            this.requestMethod = str;
        } catch (IOException e) {
            throw new HttpRequestException(e);
        }
    }

    public HttpRequest(URL url, String str) throws HttpRequestException {
        this.url = url;
        this.requestMethod = str;
    }

    private Proxy createProxy() {
        return new Proxy(Type.HTTP, new InetSocketAddress(this.httpProxyHost, this.httpProxyPort));
    }

    private HttpURLConnection createConnection() {
        try {
            HttpURLConnection create;
            if (this.httpProxyHost != null) {
                create = CONNECTION_FACTORY.create(this.url, createProxy());
            } else {
                create = CONNECTION_FACTORY.create(this.url);
            }
            create.setRequestMethod(this.requestMethod);
            return create;
        } catch (IOException e) {
            throw new HttpRequestException(e);
        }
    }

    public String toString() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(method());
        stringBuilder.append(' ');
        stringBuilder.append(url());
        return stringBuilder.toString();
    }

    public HttpURLConnection getConnection() {
        if (this.connection == null) {
            this.connection = createConnection();
        }
        return this.connection;
    }

    public HttpRequest ignoreCloseExceptions(boolean z) {
        this.ignoreCloseExceptions = z;
        return this;
    }

    public boolean ignoreCloseExceptions() {
        return this.ignoreCloseExceptions;
    }

    public int code() throws HttpRequestException {
        try {
            closeOutput();
            return getConnection().getResponseCode();
        } catch (IOException e) {
            throw new HttpRequestException(e);
        }
    }

    public HttpRequest code(AtomicInteger atomicInteger) throws HttpRequestException {
        atomicInteger.set(code());
        return this;
    }

    public boolean ok() throws HttpRequestException {
        return 200 == code();
    }

    public boolean created() throws HttpRequestException {
        return 201 == code();
    }

    public boolean noContent() throws HttpRequestException {
        return 204 == code();
    }

    public boolean serverError() throws HttpRequestException {
        return System.SCREEN_KEY_LONG_PRESS_TIMEOUT_DEFAULT == code();
    }

    public boolean badRequest() throws HttpRequestException {
        return MonitorCommonConstants.MAX_COUNT_UPLOAD_SINGLE_TIME == code();
    }

    public boolean notFound() throws HttpRequestException {
        return 404 == code();
    }

    public boolean notModified() throws HttpRequestException {
        return 304 == code();
    }

    public String message() throws HttpRequestException {
        try {
            closeOutput();
            return getConnection().getResponseMessage();
        } catch (IOException e) {
            throw new HttpRequestException(e);
        }
    }

    public HttpRequest disconnect() {
        getConnection().disconnect();
        return this;
    }

    public HttpRequest chunk(int i) {
        getConnection().setChunkedStreamingMode(i);
        return this;
    }

    public HttpRequest bufferSize(int i) {
        if (i >= 1) {
            this.bufferSize = i;
            return this;
        }
        throw new IllegalArgumentException("Size must be greater than zero");
    }

    public int bufferSize() {
        return this.bufferSize;
    }

    public HttpRequest uncompress(boolean z) {
        this.uncompress = z;
        return this;
    }

    protected ByteArrayOutputStream byteStream() {
        int contentLength = contentLength();
        if (contentLength > 0) {
            return new ByteArrayOutputStream(contentLength);
        }
        return new ByteArrayOutputStream();
    }

    public String body(String str) throws HttpRequestException {
        OutputStream byteStream = byteStream();
        try {
            copy(buffer(), byteStream);
            return byteStream.toString(getValidCharset(str));
        } catch (IOException e) {
            throw new HttpRequestException(e);
        }
    }

    public String body() throws HttpRequestException {
        return body(charset());
    }

    public HttpRequest body(AtomicReference<String> atomicReference) throws HttpRequestException {
        atomicReference.set(body());
        return this;
    }

    public HttpRequest body(AtomicReference<String> atomicReference, String str) throws HttpRequestException {
        atomicReference.set(body(str));
        return this;
    }

    public boolean isBodyEmpty() throws HttpRequestException {
        return contentLength() == 0;
    }

    public byte[] bytes() throws HttpRequestException {
        OutputStream byteStream = byteStream();
        try {
            copy(buffer(), byteStream);
            return byteStream.toByteArray();
        } catch (IOException e) {
            throw new HttpRequestException(e);
        }
    }

    public BufferedInputStream buffer() throws HttpRequestException {
        return new BufferedInputStream(stream(), this.bufferSize);
    }

    public InputStream stream() throws HttpRequestException {
        InputStream inputStream;
        if (code() < MonitorCommonConstants.MAX_COUNT_UPLOAD_SINGLE_TIME) {
            try {
                inputStream = getConnection().getInputStream();
            } catch (IOException e) {
                throw new HttpRequestException(e);
            }
        }
        inputStream = getConnection().getErrorStream();
        if (inputStream == null) {
            try {
                inputStream = getConnection().getInputStream();
            } catch (IOException e2) {
                if (contentLength() <= 0) {
                    inputStream = new ByteArrayInputStream(new byte[0]);
                } else {
                    throw new HttpRequestException(e2);
                }
            }
        }
        if (!this.uncompress || !ENCODING_GZIP.equals(contentEncoding())) {
            return inputStream;
        }
        try {
            return new GZIPInputStream(inputStream);
        } catch (IOException e22) {
            throw new HttpRequestException(e22);
        }
    }

    public InputStreamReader reader(String str) throws HttpRequestException {
        try {
            return new InputStreamReader(stream(), getValidCharset(str));
        } catch (IOException e) {
            throw new HttpRequestException(e);
        }
    }

    public InputStreamReader reader() throws HttpRequestException {
        return reader(charset());
    }

    public BufferedReader bufferedReader(String str) throws HttpRequestException {
        return new BufferedReader(reader(str), this.bufferSize);
    }

    public BufferedReader bufferedReader() throws HttpRequestException {
        return bufferedReader(charset());
    }

    public HttpRequest receive(File file) throws HttpRequestException {
        try {
            final Object bufferedOutputStream = new BufferedOutputStream(new FileOutputStream(file), this.bufferSize);
            return (HttpRequest) new CloseOperation<HttpRequest>(this.ignoreCloseExceptions, bufferedOutputStream) {
                protected HttpRequest run() throws HttpRequestException, IOException {
                    return HttpRequest.this.receive(bufferedOutputStream);
                }
            }.call();
        } catch (IOException e) {
            throw new HttpRequestException(e);
        }
    }

    public HttpRequest receive(OutputStream outputStream) throws HttpRequestException {
        try {
            return copy(buffer(), outputStream);
        } catch (IOException e) {
            throw new HttpRequestException(e);
        }
    }

    public HttpRequest receive(PrintStream printStream) throws HttpRequestException {
        return receive((OutputStream) printStream);
    }

    public HttpRequest receive(Appendable appendable) throws HttpRequestException {
        final BufferedReader bufferedReader = bufferedReader();
        final Appendable appendable2 = appendable;
        return (HttpRequest) new CloseOperation<HttpRequest>(bufferedReader, this.ignoreCloseExceptions) {
            public HttpRequest run() throws IOException {
                Object allocate = CharBuffer.allocate(HttpRequest.this.bufferSize);
                while (true) {
                    int read = bufferedReader.read(allocate);
                    if (read == -1) {
                        return HttpRequest.this;
                    }
                    allocate.rewind();
                    appendable2.append(allocate, 0, read);
                    allocate.rewind();
                }
            }
        }.call();
    }

    public HttpRequest receive(Writer writer) throws HttpRequestException {
        final BufferedReader bufferedReader = bufferedReader();
        final Writer writer2 = writer;
        return (HttpRequest) new CloseOperation<HttpRequest>(bufferedReader, this.ignoreCloseExceptions) {
            public HttpRequest run() throws IOException {
                return HttpRequest.this.copy(bufferedReader, writer2);
            }
        }.call();
    }

    public HttpRequest readTimeout(int i) {
        getConnection().setReadTimeout(i);
        return this;
    }

    public HttpRequest connectTimeout(int i) {
        getConnection().setConnectTimeout(i);
        return this;
    }

    public HttpRequest header(String str, String str2) {
        getConnection().setRequestProperty(str, str2);
        return this;
    }

    public HttpRequest header(String str, Number number) {
        return header(str, number != null ? number.toString() : null);
    }

    public HttpRequest headers(Map<String, String> map) {
        if (!map.isEmpty()) {
            for (Entry header : map.entrySet()) {
                header(header);
            }
        }
        return this;
    }

    public HttpRequest header(Entry<String, String> entry) {
        return header((String) entry.getKey(), (String) entry.getValue());
    }

    public String header(String str) throws HttpRequestException {
        closeOutputQuietly();
        return getConnection().getHeaderField(str);
    }

    public Map<String, List<String>> headers() throws HttpRequestException {
        closeOutputQuietly();
        return getConnection().getHeaderFields();
    }

    public long dateHeader(String str) throws HttpRequestException {
        return dateHeader(str, -1);
    }

    public long dateHeader(String str, long j) throws HttpRequestException {
        closeOutputQuietly();
        return getConnection().getHeaderFieldDate(str, j);
    }

    public int intHeader(String str) throws HttpRequestException {
        return intHeader(str, -1);
    }

    public int intHeader(String str, int i) throws HttpRequestException {
        closeOutputQuietly();
        return getConnection().getHeaderFieldInt(str, i);
    }

    public String[] headers(String str) {
        Map headers = headers();
        if (headers == null || headers.isEmpty()) {
            return EMPTY_STRINGS;
        }
        List list = (List) headers.get(str);
        if (list == null || list.isEmpty()) {
            return EMPTY_STRINGS;
        }
        return (String[]) list.toArray(new String[list.size()]);
    }

    public String parameter(String str, String str2) {
        return getParam(header(str), str2);
    }

    public Map<String, String> parameters(String str) {
        return getParams(header(str));
    }

    protected Map<String, String> getParams(String str) {
        if (str == null || str.length() == 0) {
            return Collections.emptyMap();
        }
        int length = str.length();
        int indexOf = str.indexOf(59) + 1;
        if (indexOf == 0 || indexOf == length) {
            return Collections.emptyMap();
        }
        int indexOf2 = str.indexOf(59, indexOf);
        if (indexOf2 == -1) {
            indexOf2 = length;
        }
        Map<String, String> linkedHashMap = new LinkedHashMap();
        while (indexOf < indexOf2) {
            int indexOf3 = str.indexOf(61, indexOf);
            if (indexOf3 != -1 && indexOf3 < indexOf2) {
                String trim = str.substring(indexOf, indexOf3).trim();
                if (trim.length() > 0) {
                    String trim2 = str.substring(indexOf3 + 1, indexOf2).trim();
                    int length2 = trim2.length();
                    if (length2 != 0) {
                        if (length2 > 2 && '\"' == trim2.charAt(0)) {
                            length2--;
                            if ('\"' == trim2.charAt(length2)) {
                                linkedHashMap.put(trim, trim2.substring(1, length2));
                            }
                        }
                        linkedHashMap.put(trim, trim2);
                    }
                }
            }
            indexOf = indexOf2 + 1;
            indexOf2 = str.indexOf(59, indexOf);
            if (indexOf2 == -1) {
                indexOf2 = length;
            }
        }
        return linkedHashMap;
    }

    protected String getParam(String str, String str2) {
        if (str == null || str.length() == 0) {
            return null;
        }
        int length = str.length();
        int indexOf = str.indexOf(59) + 1;
        if (indexOf == 0 || indexOf == length) {
            return null;
        }
        int indexOf2 = str.indexOf(59, indexOf);
        if (indexOf2 == -1) {
            indexOf2 = length;
        }
        while (indexOf < indexOf2) {
            int indexOf3 = str.indexOf(61, indexOf);
            if (indexOf3 != -1 && indexOf3 < indexOf2 && str2.equals(str.substring(indexOf, indexOf3).trim())) {
                String trim = str.substring(indexOf3 + 1, indexOf2).trim();
                indexOf3 = trim.length();
                if (indexOf3 != 0) {
                    if (indexOf3 > 2 && '\"' == trim.charAt(0)) {
                        indexOf3--;
                        if ('\"' == trim.charAt(indexOf3)) {
                            return trim.substring(1, indexOf3);
                        }
                    }
                    return trim;
                }
            }
            indexOf = indexOf2 + 1;
            indexOf2 = str.indexOf(59, indexOf);
            if (indexOf2 == -1) {
                indexOf2 = length;
            }
        }
        return null;
    }

    public String charset() {
        return parameter("Content-Type", PARAM_CHARSET);
    }

    public HttpRequest userAgent(String str) {
        return header("User-Agent", str);
    }

    public HttpRequest referer(String str) {
        return header(HEADER_REFERER, str);
    }

    public HttpRequest useCaches(boolean z) {
        getConnection().setUseCaches(z);
        return this;
    }

    public HttpRequest acceptEncoding(String str) {
        return header(HEADER_ACCEPT_ENCODING, str);
    }

    public HttpRequest acceptGzipEncoding() {
        return acceptEncoding(ENCODING_GZIP);
    }

    public HttpRequest acceptCharset(String str) {
        return header(HEADER_ACCEPT_CHARSET, str);
    }

    public String contentEncoding() {
        return header("Content-Encoding");
    }

    public String server() {
        return header("Server");
    }

    public long date() {
        return dateHeader("Date");
    }

    public String cacheControl() {
        return header(HEADER_CACHE_CONTROL);
    }

    public String eTag() {
        return header(HEADER_ETAG);
    }

    public long expires() {
        return dateHeader(HEADER_EXPIRES);
    }

    public long lastModified() {
        return dateHeader(HEADER_LAST_MODIFIED);
    }

    public String location() {
        return header(HEADER_LOCATION);
    }

    public HttpRequest authorization(String str) {
        return header(HEADER_AUTHORIZATION, str);
    }

    public HttpRequest proxyAuthorization(String str) {
        return header(HEADER_PROXY_AUTHORIZATION, str);
    }

    public HttpRequest basic(String str, String str2) {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("Basic ");
        StringBuilder stringBuilder2 = new StringBuilder();
        stringBuilder2.append(str);
        stringBuilder2.append(':');
        stringBuilder2.append(str2);
        stringBuilder.append(Base64.encode(stringBuilder2.toString()));
        return authorization(stringBuilder.toString());
    }

    public HttpRequest proxyBasic(String str, String str2) {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("Basic ");
        StringBuilder stringBuilder2 = new StringBuilder();
        stringBuilder2.append(str);
        stringBuilder2.append(':');
        stringBuilder2.append(str2);
        stringBuilder.append(Base64.encode(stringBuilder2.toString()));
        return proxyAuthorization(stringBuilder.toString());
    }

    public HttpRequest ifModifiedSince(long j) {
        getConnection().setIfModifiedSince(j);
        return this;
    }

    public HttpRequest ifNoneMatch(String str) {
        return header(HEADER_IF_NONE_MATCH, str);
    }

    public HttpRequest contentType(String str) {
        return contentType(str, null);
    }

    public HttpRequest contentType(String str, String str2) {
        if (str2 == null || str2.length() <= 0) {
            return header("Content-Type", str);
        }
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(str);
        stringBuilder.append(HTTP.CHARSET_PARAM);
        stringBuilder.append(str2);
        return header("Content-Type", stringBuilder.toString());
    }

    public String contentType() {
        return header("Content-Type");
    }

    public int contentLength() {
        return intHeader("Content-Length");
    }

    public HttpRequest contentLength(String str) {
        return contentLength(Integer.parseInt(str));
    }

    public HttpRequest contentLength(int i) {
        getConnection().setFixedLengthStreamingMode(i);
        return this;
    }

    public HttpRequest accept(String str) {
        return header(HEADER_ACCEPT, str);
    }

    public HttpRequest acceptJson() {
        return accept(CONTENT_TYPE_JSON);
    }

    protected HttpRequest copy(InputStream inputStream, OutputStream outputStream) throws IOException {
        final InputStream inputStream2 = inputStream;
        final OutputStream outputStream2 = outputStream;
        return (HttpRequest) new CloseOperation<HttpRequest>(inputStream, this.ignoreCloseExceptions) {
            public HttpRequest run() throws IOException {
                byte[] bArr = new byte[HttpRequest.this.bufferSize];
                while (true) {
                    int read = inputStream2.read(bArr);
                    if (read == -1) {
                        return HttpRequest.this;
                    }
                    outputStream2.write(bArr, 0, read);
                    HttpRequest.this.totalWritten = HttpRequest.this.totalWritten + ((long) read);
                    HttpRequest.this.progress.onUpload(HttpRequest.this.totalWritten, HttpRequest.this.totalSize);
                }
            }
        }.call();
    }

    protected HttpRequest copy(Reader reader, Writer writer) throws IOException {
        final Reader reader2 = reader;
        final Writer writer2 = writer;
        return (HttpRequest) new CloseOperation<HttpRequest>(reader, this.ignoreCloseExceptions) {
            public HttpRequest run() throws IOException {
                char[] cArr = new char[HttpRequest.this.bufferSize];
                while (true) {
                    int read = reader2.read(cArr);
                    if (read == -1) {
                        return HttpRequest.this;
                    }
                    writer2.write(cArr, 0, read);
                    HttpRequest.this.totalWritten = HttpRequest.this.totalWritten + ((long) read);
                    HttpRequest.this.progress.onUpload(HttpRequest.this.totalWritten, -1);
                }
            }
        }.call();
    }

    public HttpRequest progress(UploadProgress uploadProgress) {
        if (uploadProgress == null) {
            this.progress = UploadProgress.DEFAULT;
        } else {
            this.progress = uploadProgress;
        }
        return this;
    }

    private HttpRequest incrementTotalSize(long j) {
        if (this.totalSize == -1) {
            this.totalSize = 0;
        }
        this.totalSize += j;
        return this;
    }

    protected HttpRequest closeOutput() throws IOException {
        progress(null);
        if (this.output == null) {
            return this;
        }
        if (this.multipart) {
            this.output.write("\r\n--00content0boundary00--\r\n");
        }
        if (this.ignoreCloseExceptions) {
            try {
                this.output.close();
            } catch (IOException e) {
            }
        } else {
            this.output.close();
        }
        this.output = null;
        return this;
    }

    protected HttpRequest closeOutputQuietly() throws HttpRequestException {
        try {
            return closeOutput();
        } catch (IOException e) {
            throw new HttpRequestException(e);
        }
    }

    protected HttpRequest openOutput() throws IOException {
        if (this.output != null) {
            return this;
        }
        getConnection().setDoOutput(true);
        this.output = new RequestOutputStream(getConnection().getOutputStream(), getParam(getConnection().getRequestProperty("Content-Type"), PARAM_CHARSET), this.bufferSize);
        return this;
    }

    protected HttpRequest startPart() throws IOException {
        if (this.multipart) {
            this.output.write("\r\n--00content0boundary00\r\n");
        } else {
            this.multipart = true;
            contentType(CONTENT_TYPE_MULTIPART).openOutput();
            this.output.write("--00content0boundary00\r\n");
        }
        return this;
    }

    protected HttpRequest writePartHeader(String str, String str2) throws IOException {
        return writePartHeader(str, str2, null);
    }

    protected HttpRequest writePartHeader(String str, String str2, String str3) throws IOException {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("form-data; name=\"");
        stringBuilder.append(str);
        if (str2 != null) {
            stringBuilder.append("\"; filename=\"");
            stringBuilder.append(str2);
        }
        stringBuilder.append('\"');
        partHeader("Content-Disposition", stringBuilder.toString());
        if (str3 != null) {
            partHeader("Content-Type", str3);
        }
        return send(CRLF);
    }

    public HttpRequest part(String str, String str2) {
        return part(str, null, str2);
    }

    public HttpRequest part(String str, String str2, String str3) throws HttpRequestException {
        return part(str, str2, null, str3);
    }

    public HttpRequest part(String str, String str2, String str3, String str4) throws HttpRequestException {
        try {
            startPart();
            writePartHeader(str, str2, str3);
            this.output.write(str4);
            return this;
        } catch (IOException e) {
            throw new HttpRequestException(e);
        }
    }

    public HttpRequest part(String str, Number number) throws HttpRequestException {
        return part(str, null, number);
    }

    public HttpRequest part(String str, String str2, Number number) throws HttpRequestException {
        return part(str, str2, number != null ? number.toString() : null);
    }

    public HttpRequest part(String str, File file) throws HttpRequestException {
        return part(str, null, file);
    }

    public HttpRequest part(String str, String str2, File file) throws HttpRequestException {
        return part(str, str2, null, file);
    }

    public HttpRequest part(String str, String str2, String str3, File file) throws HttpRequestException {
        try {
            InputStream bufferedInputStream = new BufferedInputStream(new FileInputStream(file));
            incrementTotalSize(file.length());
            return part(str, str2, str3, bufferedInputStream);
        } catch (IOException e) {
            throw new HttpRequestException(e);
        }
    }

    public HttpRequest part(String str, InputStream inputStream) throws HttpRequestException {
        return part(str, null, null, inputStream);
    }

    public HttpRequest part(String str, String str2, String str3, InputStream inputStream) throws HttpRequestException {
        try {
            startPart();
            writePartHeader(str, str2, str3);
            copy(inputStream, this.output);
            return this;
        } catch (IOException e) {
            throw new HttpRequestException(e);
        }
    }

    public HttpRequest partHeader(String str, String str2) throws HttpRequestException {
        return send((CharSequence) str).send((CharSequence) ": ").send((CharSequence) str2).send(CRLF);
    }

    public HttpRequest send(File file) throws HttpRequestException {
        try {
            InputStream bufferedInputStream = new BufferedInputStream(new FileInputStream(file));
            incrementTotalSize(file.length());
            return send(bufferedInputStream);
        } catch (IOException e) {
            throw new HttpRequestException(e);
        }
    }

    public HttpRequest send(byte[] bArr) throws HttpRequestException {
        if (bArr != null) {
            incrementTotalSize((long) bArr.length);
        }
        return send(new ByteArrayInputStream(bArr));
    }

    public HttpRequest send(InputStream inputStream) throws HttpRequestException {
        try {
            openOutput();
            copy(inputStream, this.output);
            return this;
        } catch (IOException e) {
            throw new HttpRequestException(e);
        }
    }

    public HttpRequest send(final Reader reader) throws HttpRequestException {
        try {
            openOutput();
            final Object outputStreamWriter = new OutputStreamWriter(this.output, this.output.encoder.charset());
            return (HttpRequest) new FlushOperation<HttpRequest>(outputStreamWriter) {
                protected HttpRequest run() throws IOException {
                    return HttpRequest.this.copy(reader, outputStreamWriter);
                }
            }.call();
        } catch (IOException e) {
            throw new HttpRequestException(e);
        }
    }

    public HttpRequest send(CharSequence charSequence) throws HttpRequestException {
        try {
            openOutput();
            this.output.write(charSequence.toString());
            return this;
        } catch (IOException e) {
            throw new HttpRequestException(e);
        }
    }

    public OutputStreamWriter writer() throws HttpRequestException {
        try {
            openOutput();
            return new OutputStreamWriter(this.output, this.output.encoder.charset());
        } catch (IOException e) {
            throw new HttpRequestException(e);
        }
    }

    public HttpRequest form(Map<?, ?> map) throws HttpRequestException {
        return form((Map) map, "UTF-8");
    }

    public HttpRequest form(Entry<?, ?> entry) throws HttpRequestException {
        return form((Entry) entry, "UTF-8");
    }

    public HttpRequest form(Entry<?, ?> entry, String str) throws HttpRequestException {
        return form(entry.getKey(), entry.getValue(), str);
    }

    public HttpRequest form(Object obj, Object obj2) throws HttpRequestException {
        return form(obj, obj2, "UTF-8");
    }

    public HttpRequest form(Object obj, Object obj2, String str) throws HttpRequestException {
        int i = this.form ^ 1;
        if (i != 0) {
            contentType(CONTENT_TYPE_FORM, str);
            this.form = true;
        }
        str = getValidCharset(str);
        try {
            openOutput();
            if (i == 0) {
                this.output.write(38);
            }
            this.output.write(URLEncoder.encode(obj.toString(), str));
            this.output.write(61);
            if (obj2 != null) {
                this.output.write(URLEncoder.encode(obj2.toString(), str));
            }
            return this;
        } catch (IOException e) {
            throw new HttpRequestException(e);
        }
    }

    public HttpRequest form(Map<?, ?> map, String str) throws HttpRequestException {
        if (!map.isEmpty()) {
            for (Entry form : map.entrySet()) {
                form(form, str);
            }
        }
        return this;
    }

    public HttpRequest trustAllCerts() throws HttpRequestException {
        HttpURLConnection connection = getConnection();
        if (connection instanceof HttpsURLConnection) {
            ((HttpsURLConnection) connection).setSSLSocketFactory(getTrustedFactory());
        }
        return this;
    }

    public HttpRequest trustAllHosts() {
        HttpURLConnection connection = getConnection();
        if (connection instanceof HttpsURLConnection) {
            ((HttpsURLConnection) connection).setHostnameVerifier(getTrustedVerifier());
        }
        return this;
    }

    public URL url() {
        return getConnection().getURL();
    }

    public String method() {
        return getConnection().getRequestMethod();
    }

    public HttpRequest useProxy(String str, int i) {
        if (this.connection == null) {
            this.httpProxyHost = str;
            this.httpProxyPort = i;
            return this;
        }
        throw new IllegalStateException("The connection has already been created. This method must be called before reading or writing to the request.");
    }

    public HttpRequest followRedirects(boolean z) {
        getConnection().setInstanceFollowRedirects(z);
        return this;
    }
}
