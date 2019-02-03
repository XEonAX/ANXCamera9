package com.android.camera2.autozoom;

import android.hardware.camera2.CaptureRequest.Key;
import android.hardware.camera2.CaptureResult;
import android.util.Log;
import java.lang.reflect.Constructor;

public class RequestKeyCreator {
    private static Constructor<Key> requestConstructor;
    private static Constructor<CaptureResult.Key> resultConstructor;

    public static <T> Key<T> requestKey(String str, Class<T> cls) {
        String simpleName;
        StringBuilder stringBuilder;
        try {
            if (requestConstructor == null) {
                requestConstructor = Key.class.getConstructor(new Class[]{String.class, cls.getClass()});
                requestConstructor.setAccessible(true);
            }
            try {
                return (Key) requestConstructor.newInstance(new Object[]{str, cls});
            } catch (Exception e) {
                simpleName = RequestKeyCreator.class.getSimpleName();
                stringBuilder = new StringBuilder();
                stringBuilder.append("cannot call captureRequest.Key constructor: ");
                stringBuilder.append(e.getMessage());
                Log.d(simpleName, stringBuilder.toString());
                return null;
            }
        } catch (NoSuchMethodException e2) {
            simpleName = RequestKeyCreator.class.getSimpleName();
            stringBuilder = new StringBuilder();
            stringBuilder.append("cannot find captureRequest.Key constructor: ");
            stringBuilder.append(e2.getMessage());
            Log.d(simpleName, stringBuilder.toString());
        }
    }

    public static <T> CaptureResult.Key<T> resultKey(String str, Class<T> cls) {
        String simpleName;
        StringBuilder stringBuilder;
        try {
            if (resultConstructor == null) {
                resultConstructor = CaptureResult.Key.class.getConstructor(new Class[]{String.class, cls.getClass()});
                resultConstructor.setAccessible(true);
            }
            try {
                return (CaptureResult.Key) resultConstructor.newInstance(new Object[]{str, cls});
            } catch (Exception e) {
                simpleName = RequestKeyCreator.class.getSimpleName();
                stringBuilder = new StringBuilder();
                stringBuilder.append("cannot call captureResult.Key constructor: ");
                stringBuilder.append(e.getMessage());
                Log.d(simpleName, stringBuilder.toString());
                return null;
            }
        } catch (NoSuchMethodException e2) {
            simpleName = RequestKeyCreator.class.getSimpleName();
            stringBuilder = new StringBuilder();
            stringBuilder.append("cannot find captureResult.Key constructor: ");
            stringBuilder.append(e2.getMessage());
            Log.d(simpleName, stringBuilder.toString());
        }
    }
}
