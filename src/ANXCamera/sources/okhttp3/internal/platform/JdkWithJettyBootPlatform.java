package okhttp3.internal.platform;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.List;
import javax.net.ssl.SSLSocket;
import okhttp3.Protocol;
import okhttp3.internal.Util;

class JdkWithJettyBootPlatform extends Platform {
    private final Class<?> clientProviderClass;
    private final Method getMethod;
    private final Method putMethod;
    private final Method removeMethod;
    private final Class<?> serverProviderClass;

    private static class JettyNegoProvider implements InvocationHandler {
        private final List<String> protocols;
        String selected;
        boolean unsupported;

        JettyNegoProvider(List<String> list) {
            this.protocols = list;
        }

        public Object invoke(Object obj, Method method, Object[] objArr) throws Throwable {
            String name = method.getName();
            Class returnType = method.getReturnType();
            if (objArr == null) {
                objArr = Util.EMPTY_STRING_ARRAY;
            }
            if (name.equals("supports") && Boolean.TYPE == returnType) {
                return Boolean.valueOf(true);
            }
            if (name.equals("unsupported") && Void.TYPE == returnType) {
                this.unsupported = true;
                return null;
            } else if (name.equals("protocols") && objArr.length == 0) {
                return this.protocols;
            } else {
                if ((name.equals("selectProtocol") || name.equals("select")) && String.class == returnType && objArr.length == 1 && (objArr[0] instanceof List)) {
                    List list = (List) objArr[0];
                    int size = list.size();
                    for (int i = 0; i < size; i++) {
                        if (this.protocols.contains(list.get(i))) {
                            name = (String) list.get(i);
                            this.selected = name;
                            return name;
                        }
                    }
                    name = (String) this.protocols.get(0);
                    this.selected = name;
                    return name;
                } else if ((!name.equals("protocolSelected") && !name.equals("selected")) || objArr.length != 1) {
                    return method.invoke(this, objArr);
                } else {
                    this.selected = (String) objArr[0];
                    return null;
                }
            }
        }
    }

    JdkWithJettyBootPlatform(Method method, Method method2, Method method3, Class<?> cls, Class<?> cls2) {
        this.putMethod = method;
        this.getMethod = method2;
        this.removeMethod = method3;
        this.clientProviderClass = cls;
        this.serverProviderClass = cls2;
    }

    /* JADX WARNING: Removed duplicated region for block: B:4:0x002e A:{ExcHandler: java.lang.reflect.InvocationTargetException (r6_1 'e' java.lang.Exception), Splitter: B:1:0x0004} */
    /* JADX WARNING: Missing block: B:4:0x002e, code:
            r6 = move-exception;
     */
    /* JADX WARNING: Missing block: B:6:0x0035, code:
            throw okhttp3.internal.Util.assertionError("unable to set alpn", r6);
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void configureTlsExtensions(SSLSocket sSLSocket, String str, List<Protocol> list) {
        List alpnProtocolNames = Platform.alpnProtocolNames(list);
        try {
            Object newProxyInstance = Proxy.newProxyInstance(Platform.class.getClassLoader(), new Class[]{this.clientProviderClass, this.serverProviderClass}, new JettyNegoProvider(alpnProtocolNames));
            this.putMethod.invoke(null, new Object[]{sSLSocket, newProxyInstance});
        } catch (Exception e) {
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:3:0x000e A:{ExcHandler: java.lang.IllegalAccessException (r5_1 'e' java.lang.Exception), Splitter: B:0:0x0000} */
    /* JADX WARNING: Missing block: B:3:0x000e, code:
            r5 = move-exception;
     */
    /* JADX WARNING: Missing block: B:5:0x0015, code:
            throw okhttp3.internal.Util.assertionError("unable to remove alpn", r5);
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void afterHandshake(SSLSocket sSLSocket) {
        try {
            this.removeMethod.invoke(null, new Object[]{sSLSocket});
        } catch (Exception e) {
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:11:0x002e A:{ExcHandler: java.lang.reflect.InvocationTargetException (r4_4 'e' java.lang.Exception), Splitter: B:0:0x0000} */
    /* JADX WARNING: Missing block: B:11:0x002e, code:
            r4 = move-exception;
     */
    /* JADX WARNING: Missing block: B:13:0x0035, code:
            throw okhttp3.internal.Util.assertionError("unable to get selected protocol", r4);
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public String getSelectedProtocol(SSLSocket sSLSocket) {
        try {
            Object[] objArr = new Object[]{sSLSocket};
            String str = null;
            JettyNegoProvider jettyNegoProvider = (JettyNegoProvider) Proxy.getInvocationHandler(this.getMethod.invoke(null, objArr));
            if (jettyNegoProvider.unsupported || jettyNegoProvider.selected != null) {
                if (!jettyNegoProvider.unsupported) {
                    str = jettyNegoProvider.selected;
                }
                return str;
            }
            Platform.get().log(4, "ALPN callback dropped: HTTP/2 is disabled. Is alpn-boot on the boot class path?", null);
            return null;
        } catch (Exception e) {
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:3:0x0076 A:{ExcHandler: java.lang.ClassNotFoundException (e java.lang.ClassNotFoundException), Splitter: B:0:0x0000} */
    /* JADX WARNING: Missing block: B:5:0x0078, code:
            return null;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public static Platform buildIfSupported() {
        try {
            String str = "org.eclipse.jetty.alpn.ALPN";
            Class cls = Class.forName(str);
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append(str);
            stringBuilder.append("$Provider");
            Class cls2 = Class.forName(stringBuilder.toString());
            StringBuilder stringBuilder2 = new StringBuilder();
            stringBuilder2.append(str);
            stringBuilder2.append("$ClientProvider");
            Class cls3 = Class.forName(stringBuilder2.toString());
            stringBuilder2 = new StringBuilder();
            stringBuilder2.append(str);
            stringBuilder2.append("$ServerProvider");
            Class cls4 = Class.forName(stringBuilder2.toString());
            Method method = cls.getMethod("put", new Class[]{SSLSocket.class, cls2});
            return new JdkWithJettyBootPlatform(method, cls.getMethod("get", new Class[]{SSLSocket.class}), cls.getMethod("remove", new Class[]{SSLSocket.class}), cls3, cls4);
        } catch (ClassNotFoundException e) {
        }
    }
}
