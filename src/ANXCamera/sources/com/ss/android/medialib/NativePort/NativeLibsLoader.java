package com.ss.android.medialib.NativePort;

import android.util.Log;
import java.util.ArrayList;
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
            List<String> arrayList = new ArrayList();
            arrayList.add("ttffmpeg");
            arrayList.add("yuv");
            arrayList.add("effect");
            arrayList.add("ttffmpeg-invoker");
            if (mLibraryLoader != null) {
                mLibraryLoader.onLoadNativeLibs(arrayList);
                sLibraryLoaded = true;
                return;
            }
            for (String safeLoadSo : arrayList) {
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
