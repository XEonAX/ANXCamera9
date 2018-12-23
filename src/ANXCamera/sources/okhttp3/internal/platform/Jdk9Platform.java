package okhttp3.internal.platform;

import java.lang.reflect.Method;
import javax.net.ssl.SSLParameters;
import javax.net.ssl.SSLSocket;
import javax.net.ssl.SSLSocketFactory;
import javax.net.ssl.X509TrustManager;

final class Jdk9Platform extends Platform {
    final Method getProtocolMethod;
    final Method setProtocolMethod;

    Jdk9Platform(Method method, Method method2) {
        this.setProtocolMethod = method;
        this.getProtocolMethod = method2;
    }

    /* JADX WARNING: Removed duplicated region for block: B:3:0x0022 A:{ExcHandler: java.lang.IllegalAccessException (r5_1 'e' java.lang.Exception), Splitter: B:0:0x0000} */
    /* JADX WARNING: Missing block: B:3:0x0022, code:
            r5 = move-exception;
     */
    /* JADX WARNING: Missing block: B:5:0x0029, code:
            throw okhttp3.internal.Util.assertionError("unable to set ssl parameters", r5);
     */
    public void configureTlsExtensions(javax.net.ssl.SSLSocket r5, java.lang.String r6, java.util.List<okhttp3.Protocol> r7) {
        /*
        r4 = this;
        r6 = r5.getSSLParameters();	 Catch:{ IllegalAccessException -> 0x0022, IllegalAccessException -> 0x0022 }
        r7 = okhttp3.internal.platform.Platform.alpnProtocolNames(r7);	 Catch:{ IllegalAccessException -> 0x0022, IllegalAccessException -> 0x0022 }
        r0 = r4.setProtocolMethod;	 Catch:{ IllegalAccessException -> 0x0022, IllegalAccessException -> 0x0022 }
        r1 = 1;
        r1 = new java.lang.Object[r1];	 Catch:{ IllegalAccessException -> 0x0022, IllegalAccessException -> 0x0022 }
        r2 = 0;
        r3 = r7.size();	 Catch:{ IllegalAccessException -> 0x0022, IllegalAccessException -> 0x0022 }
        r3 = new java.lang.String[r3];	 Catch:{ IllegalAccessException -> 0x0022, IllegalAccessException -> 0x0022 }
        r7 = r7.toArray(r3);	 Catch:{ IllegalAccessException -> 0x0022, IllegalAccessException -> 0x0022 }
        r1[r2] = r7;	 Catch:{ IllegalAccessException -> 0x0022, IllegalAccessException -> 0x0022 }
        r0.invoke(r6, r1);	 Catch:{ IllegalAccessException -> 0x0022, IllegalAccessException -> 0x0022 }
        r5.setSSLParameters(r6);	 Catch:{ IllegalAccessException -> 0x0022, IllegalAccessException -> 0x0022 }
        return;
    L_0x0022:
        r5 = move-exception;
        r6 = "unable to set ssl parameters";
        r5 = okhttp3.internal.Util.assertionError(r6, r5);
        throw r5;
        */
        throw new UnsupportedOperationException("Method not decompiled: okhttp3.internal.platform.Jdk9Platform.configureTlsExtensions(javax.net.ssl.SSLSocket, java.lang.String, java.util.List):void");
    }

    /* JADX WARNING: Removed duplicated region for block: B:8:0x0019 A:{ExcHandler: java.lang.IllegalAccessException (r3_4 'e' java.lang.Exception), Splitter: B:0:0x0000} */
    /* JADX WARNING: Missing block: B:8:0x0019, code:
            r3 = move-exception;
     */
    /* JADX WARNING: Missing block: B:10:0x0020, code:
            throw okhttp3.internal.Util.assertionError("unable to get selected protocols", r3);
     */
    public java.lang.String getSelectedProtocol(javax.net.ssl.SSLSocket r3) {
        /*
        r2 = this;
        r0 = r2.getProtocolMethod;	 Catch:{ IllegalAccessException -> 0x0019, IllegalAccessException -> 0x0019 }
        r1 = 0;
        r1 = new java.lang.Object[r1];	 Catch:{ IllegalAccessException -> 0x0019, IllegalAccessException -> 0x0019 }
        r3 = r0.invoke(r3, r1);	 Catch:{ IllegalAccessException -> 0x0019, IllegalAccessException -> 0x0019 }
        r3 = (java.lang.String) r3;	 Catch:{ IllegalAccessException -> 0x0019, IllegalAccessException -> 0x0019 }
        if (r3 == 0) goto L_0x0017;
    L_0x000d:
        r0 = "";
        r0 = r3.equals(r0);	 Catch:{ IllegalAccessException -> 0x0019, IllegalAccessException -> 0x0019 }
        if (r0 == 0) goto L_0x0016;
    L_0x0015:
        goto L_0x0017;
    L_0x0016:
        return r3;
    L_0x0017:
        r3 = 0;
        return r3;
    L_0x0019:
        r3 = move-exception;
        r0 = "unable to get selected protocols";
        r3 = okhttp3.internal.Util.assertionError(r0, r3);
        throw r3;
        */
        throw new UnsupportedOperationException("Method not decompiled: okhttp3.internal.platform.Jdk9Platform.getSelectedProtocol(javax.net.ssl.SSLSocket):java.lang.String");
    }

    public X509TrustManager trustManager(SSLSocketFactory sSLSocketFactory) {
        throw new UnsupportedOperationException("clientBuilder.sslSocketFactory(SSLSocketFactory) not supported on JDK 9+");
    }

    public static Jdk9Platform buildIfSupported() {
        try {
            return new Jdk9Platform(SSLParameters.class.getMethod("setApplicationProtocols", new Class[]{String[].class}), SSLSocket.class.getMethod("getApplicationProtocol", new Class[0]));
        } catch (NoSuchMethodException e) {
            return null;
        }
    }
}
