package android.support.test.internal.util;

public class ReflectionUtil {
    private static final String TAG = "ReflectionUtil";

    /* JADX WARNING: Removed duplicated region for block: B:7:0x0038 A:{ExcHandler: java.lang.ClassNotFoundException (r4_3 'e' java.lang.Throwable), Splitter: B:5:0x0022} */
    /* JADX WARNING: Removed duplicated region for block: B:7:0x0038 A:{ExcHandler: java.lang.ClassNotFoundException (r4_3 'e' java.lang.Throwable), Splitter: B:5:0x0022} */
    /* JADX WARNING: Removed duplicated region for block: B:7:0x0038 A:{ExcHandler: java.lang.ClassNotFoundException (r4_3 'e' java.lang.Throwable), Splitter: B:5:0x0022} */
    /* JADX WARNING: Missing block: B:7:0x0038, code:
            r4 = move-exception;
     */
    /* JADX WARNING: Missing block: B:8:0x0039, code:
            android.util.Log.e(TAG, "Reflective call failed: ", r4);
     */
    /* JADX WARNING: Missing block: B:9:?, code:
            return;
     */
    public static void reflectivelyInvokeRemoteMethod(java.lang.String r4, java.lang.String r5) {
        /*
        android.support.test.internal.util.Checks.checkNotNull(r4);
        android.support.test.internal.util.Checks.checkNotNull(r5);
        r0 = "ReflectionUtil";
        r1 = "Attempting to reflectively call: ";
        r2 = java.lang.String.valueOf(r5);
        r3 = r2.length();
        if (r3 == 0) goto L_0x0019;
    L_0x0014:
        r1 = r1.concat(r2);
        goto L_0x001f;
    L_0x0019:
        r2 = new java.lang.String;
        r2.<init>(r1);
        r1 = r2;
    L_0x001f:
        android.util.Log.i(r0, r1);
        r4 = java.lang.Class.forName(r4);	 Catch:{ ClassNotFoundException -> 0x0038, ClassNotFoundException -> 0x0038, ClassNotFoundException -> 0x0038, ClassNotFoundException -> 0x0038 }
        r0 = 0;
        r1 = new java.lang.Class[r0];	 Catch:{ ClassNotFoundException -> 0x0038, ClassNotFoundException -> 0x0038, ClassNotFoundException -> 0x0038, ClassNotFoundException -> 0x0038 }
        r4 = r4.getDeclaredMethod(r5, r1);	 Catch:{ ClassNotFoundException -> 0x0038, ClassNotFoundException -> 0x0038, ClassNotFoundException -> 0x0038, ClassNotFoundException -> 0x0038 }
        r5 = 1;
        r4.setAccessible(r5);	 Catch:{ ClassNotFoundException -> 0x0038, ClassNotFoundException -> 0x0038, ClassNotFoundException -> 0x0038, ClassNotFoundException -> 0x0038 }
        r5 = 0;
        r0 = new java.lang.Object[r0];	 Catch:{ ClassNotFoundException -> 0x0038, ClassNotFoundException -> 0x0038, ClassNotFoundException -> 0x0038, ClassNotFoundException -> 0x0038 }
        r4.invoke(r5, r0);	 Catch:{ ClassNotFoundException -> 0x0038, ClassNotFoundException -> 0x0038, ClassNotFoundException -> 0x0038, ClassNotFoundException -> 0x0038 }
        goto L_0x0040;
    L_0x0038:
        r4 = move-exception;
        r5 = "ReflectionUtil";
        r0 = "Reflective call failed: ";
        android.util.Log.e(r5, r0, r4);
    L_0x0040:
        return;
        */
        throw new UnsupportedOperationException("Method not decompiled: android.support.test.internal.util.ReflectionUtil.reflectivelyInvokeRemoteMethod(java.lang.String, java.lang.String):void");
    }
}
