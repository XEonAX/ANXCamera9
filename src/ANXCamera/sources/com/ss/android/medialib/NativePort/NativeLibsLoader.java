package com.ss.android.medialib.NativePort;

import android.util.Log;
import com.ss.android.medialib.LibsConfig;
import java.util.List;

public class NativeLibsLoader {
    private static final String TAG = NativeLibsLoader.class.getSimpleName();
    private static ILibraryLoader mLibraryLoader;
    private static boolean sLibraryLoaded = false;

    public interface ILibraryLoader {
        void onLoadNativeLibs(List<String> list);
    }

    public static synchronized void loadLibrary() {
        synchronized (NativeLibsLoader.class) {
            if (sLibraryLoaded) {
                return;
            }
            List<String> list = LibsConfig.LIBS;
            if (mLibraryLoader != null) {
                mLibraryLoader.onLoadNativeLibs(list);
                sLibraryLoaded = true;
                return;
            }
            for (String safeLoadSo : list) {
                safeLoadSo(safeLoadSo);
            }
            sLibraryLoaded = true;
        }
    }

    public static void safeLoadSo(String str) {
        try {
            System.loadLibrary(str);
        } catch (Throwable th) {
            String str2 = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("loadLibrary Load native library failed : ");
            stringBuilder.append(th.getMessage());
            Log.e(str2, stringBuilder.toString());
        }
    }

    public static void setLibraryLoad(ILibraryLoader iLibraryLoader) {
        mLibraryLoader = iLibraryLoader;
    }
}
