package okhttp3.internal.platform;

import java.lang.reflect.Method;
import java.util.List;
import javax.net.ssl.SSLParameters;
import javax.net.ssl.SSLSocket;
import javax.net.ssl.SSLSocketFactory;
import javax.net.ssl.X509TrustManager;
import okhttp3.Protocol;

final class Jdk9Platform extends Platform {
    final Method getProtocolMethod;
    final Method setProtocolMethod;

    Jdk9Platform(Method method, Method method2) {
        this.setProtocolMethod = method;
        this.getProtocolMethod = method2;
    }

    /* JADX WARNING: Removed duplicated region for block: B:3:0x0022 A:{Splitter: B:0:0x0000, ExcHandler: java.lang.IllegalAccessException (r5_1 'e' java.lang.Exception)} */
    /* JADX WARNING: Missing block: B:3:0x0022, code:
            r5 = move-exception;
     */
    /* JADX WARNING: Missing block: B:5:0x0029, code:
            throw okhttp3.internal.Util.assertionError("unable to set ssl parameters", r5);
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void configureTlsExtensions(SSLSocket sSLSocket, String str, List<Protocol> list) {
        try {
            SSLParameters sSLParameters = sSLSocket.getSSLParameters();
            List alpnProtocolNames = Platform.alpnProtocolNames(list);
            this.setProtocolMethod.invoke(sSLParameters, new Object[]{alpnProtocolNames.toArray(new String[alpnProtocolNames.size()])});
            sSLSocket.setSSLParameters(sSLParameters);
        } catch (Exception e) {
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:8:0x0019 A:{Splitter: B:0:0x0000, ExcHandler: java.lang.IllegalAccessException (r3_4 'e' java.lang.Exception)} */
    /* JADX WARNING: Missing block: B:8:0x0019, code:
            r3 = move-exception;
     */
    /* JADX WARNING: Missing block: B:10:0x0020, code:
            throw okhttp3.internal.Util.assertionError("unable to get selected protocols", r3);
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public String getSelectedProtocol(SSLSocket sSLSocket) {
        try {
            String str = (String) this.getProtocolMethod.invoke(sSLSocket, new Object[0]);
            if (str == null || str.equals("")) {
                return null;
            }
            return str;
        } catch (Exception e) {
        }
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
