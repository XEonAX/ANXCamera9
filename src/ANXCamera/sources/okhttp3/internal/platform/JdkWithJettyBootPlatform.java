package okhttp3.internal.platform;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.util.List;
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
    public void configureTlsExtensions(javax.net.ssl.SSLSocket r6, java.lang.String r7, java.util.List<okhttp3.Protocol> r8) {
        /*
        r5 = this;
        r7 = okhttp3.internal.platform.Platform.alpnProtocolNames(r8);
        r8 = okhttp3.internal.platform.Platform.class;
        r8 = r8.getClassLoader();	 Catch:{ InvocationTargetException -> 0x002e, InvocationTargetException -> 0x002e }
        r0 = 2;
        r1 = new java.lang.Class[r0];	 Catch:{ InvocationTargetException -> 0x002e, InvocationTargetException -> 0x002e }
        r2 = r5.clientProviderClass;	 Catch:{ InvocationTargetException -> 0x002e, InvocationTargetException -> 0x002e }
        r3 = 0;
        r1[r3] = r2;	 Catch:{ InvocationTargetException -> 0x002e, InvocationTargetException -> 0x002e }
        r2 = r5.serverProviderClass;	 Catch:{ InvocationTargetException -> 0x002e, InvocationTargetException -> 0x002e }
        r4 = 1;
        r1[r4] = r2;	 Catch:{ InvocationTargetException -> 0x002e, InvocationTargetException -> 0x002e }
        r2 = new okhttp3.internal.platform.JdkWithJettyBootPlatform$JettyNegoProvider;	 Catch:{ InvocationTargetException -> 0x002e, InvocationTargetException -> 0x002e }
        r2.<init>(r7);	 Catch:{ InvocationTargetException -> 0x002e, InvocationTargetException -> 0x002e }
        r7 = java.lang.reflect.Proxy.newProxyInstance(r8, r1, r2);	 Catch:{ InvocationTargetException -> 0x002e, InvocationTargetException -> 0x002e }
        r8 = r5.putMethod;	 Catch:{ InvocationTargetException -> 0x002e, InvocationTargetException -> 0x002e }
        r1 = 0;
        r0 = new java.lang.Object[r0];	 Catch:{ InvocationTargetException -> 0x002e, InvocationTargetException -> 0x002e }
        r0[r3] = r6;	 Catch:{ InvocationTargetException -> 0x002e, InvocationTargetException -> 0x002e }
        r0[r4] = r7;	 Catch:{ InvocationTargetException -> 0x002e, InvocationTargetException -> 0x002e }
        r8.invoke(r1, r0);	 Catch:{ InvocationTargetException -> 0x002e, InvocationTargetException -> 0x002e }
        return;
    L_0x002e:
        r6 = move-exception;
        r7 = "unable to set alpn";
        r6 = okhttp3.internal.Util.assertionError(r7, r6);
        throw r6;
        */
        throw new UnsupportedOperationException("Method not decompiled: okhttp3.internal.platform.JdkWithJettyBootPlatform.configureTlsExtensions(javax.net.ssl.SSLSocket, java.lang.String, java.util.List):void");
    }

    /* JADX WARNING: Removed duplicated region for block: B:3:0x000e A:{ExcHandler: java.lang.IllegalAccessException (r5_1 'e' java.lang.Exception), Splitter: B:0:0x0000} */
    /* JADX WARNING: Missing block: B:3:0x000e, code:
            r5 = move-exception;
     */
    /* JADX WARNING: Missing block: B:5:0x0015, code:
            throw okhttp3.internal.Util.assertionError("unable to remove alpn", r5);
     */
    public void afterHandshake(javax.net.ssl.SSLSocket r5) {
        /*
        r4 = this;
        r0 = r4.removeMethod;	 Catch:{ IllegalAccessException -> 0x000e, IllegalAccessException -> 0x000e }
        r1 = 0;
        r2 = 1;
        r2 = new java.lang.Object[r2];	 Catch:{ IllegalAccessException -> 0x000e, IllegalAccessException -> 0x000e }
        r3 = 0;
        r2[r3] = r5;	 Catch:{ IllegalAccessException -> 0x000e, IllegalAccessException -> 0x000e }
        r0.invoke(r1, r2);	 Catch:{ IllegalAccessException -> 0x000e, IllegalAccessException -> 0x000e }
        return;
    L_0x000e:
        r5 = move-exception;
        r0 = "unable to remove alpn";
        r5 = okhttp3.internal.Util.assertionError(r0, r5);
        throw r5;
        */
        throw new UnsupportedOperationException("Method not decompiled: okhttp3.internal.platform.JdkWithJettyBootPlatform.afterHandshake(javax.net.ssl.SSLSocket):void");
    }

    /* JADX WARNING: Removed duplicated region for block: B:11:0x002e A:{ExcHandler: java.lang.reflect.InvocationTargetException (r4_4 'e' java.lang.Exception), Splitter: B:0:0x0000} */
    /* JADX WARNING: Missing block: B:11:0x002e, code:
            r4 = move-exception;
     */
    /* JADX WARNING: Missing block: B:13:0x0035, code:
            throw okhttp3.internal.Util.assertionError("unable to get selected protocol", r4);
     */
    public java.lang.String getSelectedProtocol(javax.net.ssl.SSLSocket r4) {
        /*
        r3 = this;
        r0 = r3.getMethod;	 Catch:{ InvocationTargetException -> 0x002e, InvocationTargetException -> 0x002e }
        r1 = 1;
        r1 = new java.lang.Object[r1];	 Catch:{ InvocationTargetException -> 0x002e, InvocationTargetException -> 0x002e }
        r2 = 0;
        r1[r2] = r4;	 Catch:{ InvocationTargetException -> 0x002e, InvocationTargetException -> 0x002e }
        r4 = 0;
        r0 = r0.invoke(r4, r1);	 Catch:{ InvocationTargetException -> 0x002e, InvocationTargetException -> 0x002e }
        r0 = java.lang.reflect.Proxy.getInvocationHandler(r0);	 Catch:{ InvocationTargetException -> 0x002e, InvocationTargetException -> 0x002e }
        r0 = (okhttp3.internal.platform.JdkWithJettyBootPlatform.JettyNegoProvider) r0;	 Catch:{ InvocationTargetException -> 0x002e, InvocationTargetException -> 0x002e }
        r1 = r0.unsupported;	 Catch:{ InvocationTargetException -> 0x002e, InvocationTargetException -> 0x002e }
        if (r1 != 0) goto L_0x0026;
    L_0x0017:
        r1 = r0.selected;	 Catch:{ InvocationTargetException -> 0x002e, InvocationTargetException -> 0x002e }
        if (r1 != 0) goto L_0x0026;
    L_0x001b:
        r0 = okhttp3.internal.platform.Platform.get();	 Catch:{ InvocationTargetException -> 0x002e, InvocationTargetException -> 0x002e }
        r1 = 4;
        r2 = "ALPN callback dropped: HTTP/2 is disabled. Is alpn-boot on the boot class path?";
        r0.log(r1, r2, r4);	 Catch:{ InvocationTargetException -> 0x002e, InvocationTargetException -> 0x002e }
        return r4;
    L_0x0026:
        r1 = r0.unsupported;	 Catch:{ InvocationTargetException -> 0x002e, InvocationTargetException -> 0x002e }
        if (r1 == 0) goto L_0x002b;
    L_0x002a:
        goto L_0x002d;
    L_0x002b:
        r4 = r0.selected;	 Catch:{ InvocationTargetException -> 0x002e, InvocationTargetException -> 0x002e }
    L_0x002d:
        return r4;
    L_0x002e:
        r4 = move-exception;
        r0 = "unable to get selected protocol";
        r4 = okhttp3.internal.Util.assertionError(r0, r4);
        throw r4;
        */
        throw new UnsupportedOperationException("Method not decompiled: okhttp3.internal.platform.JdkWithJettyBootPlatform.getSelectedProtocol(javax.net.ssl.SSLSocket):java.lang.String");
    }

    /* JADX WARNING: Removed duplicated region for block: B:3:0x0076 A:{ExcHandler: java.lang.ClassNotFoundException (e java.lang.ClassNotFoundException), Splitter: B:0:0x0000} */
    /* JADX WARNING: Missing block: B:5:0x0078, code:
            return null;
     */
    public static okhttp3.internal.platform.Platform buildIfSupported() {
        /*
        r0 = "org.eclipse.jetty.alpn.ALPN";
        r1 = java.lang.Class.forName(r0);	 Catch:{ ClassNotFoundException -> 0x0076, ClassNotFoundException -> 0x0076 }
        r2 = new java.lang.StringBuilder;	 Catch:{ ClassNotFoundException -> 0x0076, ClassNotFoundException -> 0x0076 }
        r2.<init>();	 Catch:{ ClassNotFoundException -> 0x0076, ClassNotFoundException -> 0x0076 }
        r2.append(r0);	 Catch:{ ClassNotFoundException -> 0x0076, ClassNotFoundException -> 0x0076 }
        r3 = "$Provider";
        r2.append(r3);	 Catch:{ ClassNotFoundException -> 0x0076, ClassNotFoundException -> 0x0076 }
        r2 = r2.toString();	 Catch:{ ClassNotFoundException -> 0x0076, ClassNotFoundException -> 0x0076 }
        r2 = java.lang.Class.forName(r2);	 Catch:{ ClassNotFoundException -> 0x0076, ClassNotFoundException -> 0x0076 }
        r3 = new java.lang.StringBuilder;	 Catch:{ ClassNotFoundException -> 0x0076, ClassNotFoundException -> 0x0076 }
        r3.<init>();	 Catch:{ ClassNotFoundException -> 0x0076, ClassNotFoundException -> 0x0076 }
        r3.append(r0);	 Catch:{ ClassNotFoundException -> 0x0076, ClassNotFoundException -> 0x0076 }
        r4 = "$ClientProvider";
        r3.append(r4);	 Catch:{ ClassNotFoundException -> 0x0076, ClassNotFoundException -> 0x0076 }
        r3 = r3.toString();	 Catch:{ ClassNotFoundException -> 0x0076, ClassNotFoundException -> 0x0076 }
        r8 = java.lang.Class.forName(r3);	 Catch:{ ClassNotFoundException -> 0x0076, ClassNotFoundException -> 0x0076 }
        r3 = new java.lang.StringBuilder;	 Catch:{ ClassNotFoundException -> 0x0076, ClassNotFoundException -> 0x0076 }
        r3.<init>();	 Catch:{ ClassNotFoundException -> 0x0076, ClassNotFoundException -> 0x0076 }
        r3.append(r0);	 Catch:{ ClassNotFoundException -> 0x0076, ClassNotFoundException -> 0x0076 }
        r0 = "$ServerProvider";
        r3.append(r0);	 Catch:{ ClassNotFoundException -> 0x0076, ClassNotFoundException -> 0x0076 }
        r0 = r3.toString();	 Catch:{ ClassNotFoundException -> 0x0076, ClassNotFoundException -> 0x0076 }
        r9 = java.lang.Class.forName(r0);	 Catch:{ ClassNotFoundException -> 0x0076, ClassNotFoundException -> 0x0076 }
        r0 = "put";
        r3 = 2;
        r3 = new java.lang.Class[r3];	 Catch:{ ClassNotFoundException -> 0x0076, ClassNotFoundException -> 0x0076 }
        r4 = javax.net.ssl.SSLSocket.class;
        r5 = 0;
        r3[r5] = r4;	 Catch:{ ClassNotFoundException -> 0x0076, ClassNotFoundException -> 0x0076 }
        r4 = 1;
        r3[r4] = r2;	 Catch:{ ClassNotFoundException -> 0x0076, ClassNotFoundException -> 0x0076 }
        r0 = r1.getMethod(r0, r3);	 Catch:{ ClassNotFoundException -> 0x0076, ClassNotFoundException -> 0x0076 }
        r2 = "get";
        r3 = new java.lang.Class[r4];	 Catch:{ ClassNotFoundException -> 0x0076, ClassNotFoundException -> 0x0076 }
        r6 = javax.net.ssl.SSLSocket.class;
        r3[r5] = r6;	 Catch:{ ClassNotFoundException -> 0x0076, ClassNotFoundException -> 0x0076 }
        r6 = r1.getMethod(r2, r3);	 Catch:{ ClassNotFoundException -> 0x0076, ClassNotFoundException -> 0x0076 }
        r2 = "remove";
        r3 = new java.lang.Class[r4];	 Catch:{ ClassNotFoundException -> 0x0076, ClassNotFoundException -> 0x0076 }
        r4 = javax.net.ssl.SSLSocket.class;
        r3[r5] = r4;	 Catch:{ ClassNotFoundException -> 0x0076, ClassNotFoundException -> 0x0076 }
        r7 = r1.getMethod(r2, r3);	 Catch:{ ClassNotFoundException -> 0x0076, ClassNotFoundException -> 0x0076 }
        r1 = new okhttp3.internal.platform.JdkWithJettyBootPlatform;	 Catch:{ ClassNotFoundException -> 0x0076, ClassNotFoundException -> 0x0076 }
        r4 = r1;
        r5 = r0;
        r4.<init>(r5, r6, r7, r8, r9);	 Catch:{ ClassNotFoundException -> 0x0076, ClassNotFoundException -> 0x0076 }
        return r1;
    L_0x0076:
        r0 = move-exception;
        r0 = 0;
        return r0;
        */
        throw new UnsupportedOperationException("Method not decompiled: okhttp3.internal.platform.JdkWithJettyBootPlatform.buildIfSupported():okhttp3.internal.platform.Platform");
    }
}
