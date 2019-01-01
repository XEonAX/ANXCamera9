package android.support.test.internal.util;

import android.util.Log;
import java.lang.reflect.Method;

public class ReflectionUtil {
    private static final String TAG = "ReflectionUtil";

    /* JADX WARNING: Removed duplicated region for block: B:7:0x0038 A:{Splitter: B:5:0x0022, ExcHandler: java.lang.ClassNotFoundException (r4_3 'e' java.lang.Throwable)} */
    /* JADX WARNING: Removed duplicated region for block: B:7:0x0038 A:{Splitter: B:5:0x0022, ExcHandler: java.lang.ClassNotFoundException (r4_3 'e' java.lang.Throwable)} */
    /* JADX WARNING: Removed duplicated region for block: B:7:0x0038 A:{Splitter: B:5:0x0022, ExcHandler: java.lang.ClassNotFoundException (r4_3 'e' java.lang.Throwable)} */
    /* JADX WARNING: Missing block: B:7:0x0038, code:
            r4 = move-exception;
     */
    /* JADX WARNING: Missing block: B:8:0x0039, code:
            android.util.Log.e(TAG, "Reflective call failed: ", r4);
     */
    /* JADX WARNING: Missing block: B:9:?, code:
            return;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public static void reflectivelyInvokeRemoteMethod(String str, String str2) {
        Checks.checkNotNull(str);
        Checks.checkNotNull(str2);
        String str3 = TAG;
        String str4 = "Attempting to reflectively call: ";
        String valueOf = String.valueOf(str2);
        Log.i(str3, valueOf.length() != 0 ? str4.concat(valueOf) : new String(str4));
        try {
            Method declaredMethod = Class.forName(str).getDeclaredMethod(str2, new Class[0]);
            declaredMethod.setAccessible(true);
            declaredMethod.invoke(null, new Object[0]);
        } catch (Throwable e) {
        }
    }
}
